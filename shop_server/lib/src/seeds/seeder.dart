import 'package:faker_x/faker_x.dart';
import 'package:serverpod/server.dart';
import 'package:shop_server/src/generated/product.dart';
import 'package:shop_server/src/generated/slide_ad.dart';

class Seeder {
  static const count = 20;

  static Future insertSeedData(Session session) async {
    await _seedProducts(session);
    await _seedSlideAds(session);
  }

  static Future _seedSlideAds(Session session) async {
    final allBannerAds = await BannerAd.find(session);

    if (allBannerAds.isEmpty) {
      final banners = List.generate(
        20,
        (index) => BannerAd(
          title: FakerX.defaultInstance.lorem.sentence,
          description: FakerX.defaultInstance.lorem.paragraph(minSentences: 3, maxSentences: 5),
          image: FakerX.defaultInstance.image.image(
            width: 640,
            height: 360,
            keywords: ['shoes', 't-shirt', 'laptop', 'ssd', 'watch', 'xbox', 'tea pot', 'book'],
          ),
        ),
      );

      for (var row in banners) {
        await BannerAd.insert(session, row);
      }

      print('inserted seed products into ${BannerAd.t.tableName} table');
    }
  }

  static Future _seedProducts(Session session) async {
    final allProducts = await Product.find(session);

    if (allProducts.isEmpty) {
      final products = List.generate(
        20,
        (index) => Product(
          name: FakerX.defaultInstance.lorem.word,
          description: FakerX.defaultInstance.lorem.paragraph(minSentences: 4, maxSentences: 10),
        ),
      );
      for (var row in products) {
        await Product.insert(session, row);
      }

      print('inserted seed products into ${Product.t.tableName} table');
    }
  }
}

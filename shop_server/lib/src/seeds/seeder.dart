import 'package:faker_x/faker_x.dart';
import 'package:serverpod/server.dart';
import 'package:shop_server/src/generated/category.dart';
import 'package:shop_server/src/generated/product.dart';
import 'package:shop_server/src/generated/protocol.dart';
import 'package:shop_server/src/generated/slide_ad.dart';
import 'package:collection/collection.dart';

class Seeder {
  static const _count = 20;

  static Future<void> insertSeedData(Session session) async {
    await _seedCategories(session);
    await _seedProducts(session);
    await _seedSlideAds(session);
    await _seedOffers(session);
  }

  static Future<void> _seedCategories(Session session) async {
    final allCategories = await Category.find(session);

    if (allCategories.isEmpty) {
      final categories = List.generate(
        _count,
        (index) => Category(
          name: 'Category ${index + 1}',
          description: FakerX.defaultInstance.lorem.paragraph(),
          image: FakerX.defaultInstance.image.image(width: 150, height: 150, keywords: ['category']),
          icon: FakerX.defaultInstance.image.image(width: 150, height: 150, keywords: ['icon']),
          productsCount: FakerX.defaultInstance.number.randomInt(100000),
        ),
      );

      final chunks = categories.slices(5);
      for (var chunk in chunks) {
        final parent = chunk.first;
        final subCategories = chunk.sublist(1);

        await Category.insert(session, parent);
        for (var category in subCategories) {
          await Category.insert(session, category..parentId = parent.id);
        }
      }
    }
  }

  static Future<void> _seedSlideAds(Session session) async {
    final allBannerAds = await BannerAd.find(session);

    if (allBannerAds.isEmpty) {
      final banners = List.generate(
        _count,
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

  static Future<void> _seedProducts(Session session) async {
    final allProducts = await Product.find(session);

    final categories = await Category.find(session);

    if (allProducts.isEmpty) {
      final products = List.generate(
        _count,
        (index) => Product(
          name: FakerX.defaultInstance.lorem.word,
          description: FakerX.defaultInstance.lorem.paragraph(minSentences: 4, maxSentences: 10),
          category: categories.randomItem!,
          price: FakerX.defaultInstance.number.randomInt(1000, min: 30),
          images: List.generate(
            FakerX.defaultInstance.number.randomInt(10, min: 3),
            (index) => FakerX.defaultInstance.image.image(
              width: 640,
              height: 360,
              keywords: ['shoes', 't-shirt', 'laptop', 'ssd', 'watch', 'xbox', 'tea pot', 'book'],
            ),
          ),
        ),
      );
      for (var row in products) {
        await Product.insert(session, row);
      }

      print('inserted seed products into ${Product.t.tableName} table');
    }
  }

  static Future<void> _seedOffers(Session session) async {
    final products = await Product.find(session);
    final offerItems = products.take(6).toList();

    for (var item in offerItems) {
      final discountPercentage = FakerX.defaultInstance.number.randomDouble(min: 0.05, range: 0.5);
      final discount = Discount(
        productId: item.id!,
        discountPrice: (item.price * (1 - discountPercentage)).toInt().abs(),
        startDate: DateTime.now(),
        dueDate: DateTime.now().add(const Duration(days: 3)),
        message: 'An amazing offer',
      );

      await Discount.insert(session, discount);

      await Offer.insert(
        session,
        Offer(
          productId: item.id!,
          discountId: discount.id!,
          expireAt: discount.dueDate,
          startedAt: discount.dueDate,
        ),
      );
    }
  }
}

import 'package:faker_x/faker_x.dart';
import 'package:serverpod/server.dart';
import 'package:shop_server/src/generated/product.dart';

class Seeder {
  static Future seedProducts(Session session) async {
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
    }
  }
}

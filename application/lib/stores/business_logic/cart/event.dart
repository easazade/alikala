import 'package:flutter_crystalline/flutter_crystalline.dart';

class UpdateCartItemOperation extends Operation {
  UpdateCartItemOperation({
    required this.productId,
    required this.count,
  }) : super('update-cart-item');

  final int productId;
  final int count;
}

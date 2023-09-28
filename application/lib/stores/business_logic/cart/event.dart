import 'package:flutter_crystalline/flutter_crystalline.dart';

abstract class CartItemOperation extends Operation {
  CartItemOperation(super.name);
}

class AddToCartOperation extends CartItemOperation {
  AddToCartOperation(this.productId) : super('add-to-cart');

  final int productId;
}

class RemoveFromCartOperation extends CartItemOperation {
  RemoveFromCartOperation(this.productId) : super('remove-to-cart');

  final int productId;
}

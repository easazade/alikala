import 'dart:ui';

class AmazingDeal {
  final int id;
  final List<String> images;
  final String title;
  final int price;
  final int offPrice;
  final double offPercentage;
  final DateTime dueDate;

  AmazingDeal(this.id, this.images, this.title, this.price, this.offPrice, this.offPercentage, this.dueDate);
}

class Product {
  final int id;
  final List<String> images;
  final String title;
  final int price;
  final int offPrice;
  final Color color;
  final String colorName;
  final double offPercentage;
  final DateTime dueDate;

  Product(
    this.id,
    this.images,
    this.title,
    this.price,
    this.offPrice,
    this.offPercentage,
    this.dueDate,
    this.color,
    this.colorName,
  );
}

class Category {
  final int id;
  final int parentId;
  final String name;
  final String image;
  final int productsEstimate;

  Category(this.id, this.parentId, this.name, this.image, this.productsEstimate);
}

class Comment {
  final int id;
  final String title;
  final String content;
  final DateTime dateTime;
  final String username;

  Comment(this.id, this.title, this.content, this.dateTime, this.username);
}

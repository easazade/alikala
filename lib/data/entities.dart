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
  final double offPercentage;
  final DateTime dueDate;

  Product(this.id, this.images, this.title, this.price, this.offPrice, this.offPercentage, this.dueDate);
}

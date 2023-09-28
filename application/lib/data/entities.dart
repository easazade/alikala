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

class Comment {
  final int id;
  final String title;
  final String content;
  final DateTime dateTime;
  final String username;

  Comment(this.id, this.title, this.content, this.dateTime, this.username);
}

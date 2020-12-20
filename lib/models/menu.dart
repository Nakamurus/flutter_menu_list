class Menu {
  int id;
  String title;
  String category;
  String price;
  String img;
  String desc;

  Menu({this.id, this.title, this.category, this.price, this.img, this.desc});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        id: json['id'] as int,
        title: json['title'] as String,
        category: json['category'] as String,
        price: json['price'].toString(),
        img: json['img'] as String,
        desc: json['desc'] as String);
  }
}

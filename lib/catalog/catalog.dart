
class Catalog{
  static List<Item> items = [];
}
class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id,required this.name,required this.desc,required this.price,required this.color,required this.image});
  factory Item.fromMap(Map<String,dynamic> map)
  {
    return Item(id: map["id"], name: map["name"], desc: map["desc"], price: map["price"], color: map["color"], image: map["image"]);
  }
  ToMap() => {
    "id":id,
    "name":name,
    "desc":desc,
    "color":color,
    "price":price,
    "image":image
  };
}


// ignore_for_file: public_member_api_docs, sort_constructors_first

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 14 Pro",
        desc: "Apple iPhone 14th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.uTnEp33CJ_ogYwMrnrJpgQHaK4%26pid%3DApi&f=1&ipt=b8c3b3ab243825b8417e73aa7751279cdb477fd4623b4be6f334d628595558ea&ipo=images")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };

  // Item copyWith({
  //   int? id,
  //   String? name,
  //   String? desc,
  //   num? price,
  //   String? color,
  //   String? image,
  // }) {
  //   return Item(
  //     id ?? this.id,
  //     name ?? this.name,
  //     desc ?? this.desc,
  //     price ?? this.price,
  //     color ?? this.color,
  //     image ?? this.image,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'desc': desc,
  //     'price': price,
  //     'color': color,
  //     'image': image,
  //   };
  // }

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     map['id'] as int,
  //     map['name'] as String,
  //     map['desc'] as String,
  //     map['price'] as num,
  //     map['color'] as String,
  //     map['image'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Item.fromJson(String source) =>
  //     Item.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  // }

  // @override
  // bool operator ==(covariant Item other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.name == name &&
  //       other.desc == desc &&
  //       other.price == price &&
  //       other.color == color &&
  //       other.image == image;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //       desc.hashCode ^
  //       price.hashCode ^
  //       color.hashCode ^
  //       image.hashCode;
  // }
}

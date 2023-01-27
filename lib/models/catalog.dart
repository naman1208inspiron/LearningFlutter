class CatalogModel {
  static final items = [
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

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}

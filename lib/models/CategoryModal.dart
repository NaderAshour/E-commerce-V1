import 'Product.dart';

class CategoryModal {
  String ?categoryName;
  List<Product>? products;

  CategoryModal({
    required this.categoryName,
    required this.products,
  });

  CategoryModal.fromjson(Map<String, dynamic> map) {
    this.categoryName = map['categoryName'];
    print(categoryName);

    this.products = [];
    (map['products'] as List).forEach((element) {
      this.products!.add(Product.fromjson(element));
    });
    print(products);
  }

  Map<String, dynamic> toMap() {
    List productlist = [];
    this.products!.forEach((element) {
      productlist.add(element.toMap());
    });

    Map<String, dynamic> map = {
      "categoryName": this.categoryName,
    };
    return map;
  }
}

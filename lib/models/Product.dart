import 'package:flutter/material.dart';

class Product {
   String? image;
   String ? title;
  double? price;
  // int size;
   int? id;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,

   // this.size,

  });
  Product.fromjson(Map<String,dynamic>map){
    this.id=map['id'];
    print(id);
    this.image=map['imageUrl'];
    print('http//'+image!);
    this.title=map['name'];
    print(title);
    this.price=map['price']['current']['value'];
    print(price);



  }
   Map<String, dynamic> toMap() {
     Map<String, dynamic> map = {
       "id": this.id,
       "name": this.title,
       "price": this.price,
       "imageUrl": this.image,
     };
     return map;
   }

}


//  List<Product> products = [
//  Product(
//      id: 1,
//      title: "Office Code",
//      price: 234,
//      size: 12,
//      description: dummyText,
//      image: "assets/images/bag_1.png",
//      color: Color(0xFF3D82AE)),
//  Product(
//      id: 2,
//      title: "Belt Bag",
//      price: 234,
//      size: 8,
//      description: dummyText,
//      image: "assets/images/bag_2.png",
//      color: Color(0xFFD3A984)),
//  Product(
//      id: 3,
//      title: "Hang Top",
//      price: 234,
//      size: 10,
//      description: dummyText,
//      image: "assets/images/bag_3.png",
//      color: Color(0xFF989493)),
//  Product(
//      id: 4,
//      title: "Old Fashion",
//      price: 234,
//      size: 11,
//      description: dummyText,
//      image: "assets/images/bag_4.png",
//      color: Color(0xFFE6B398)),
//  Product(
//      id: 5,
//      title: "Office Code",
//      price: 234,
//      size: 12,
//      description: dummyText,
//      image: "assets/images/bag_5.png",
//      color: Color(0xFFFB7883)),
//  Product(
//    id: 6,
//    title: "Office Code",
//    price: 234,
//    size: 12,
//    description: dummyText,
//    image: "assets/images/bag_6.png",
//    color: Color(0xFFAEAEAE),
//  )
// ];
//
// String dummyText =
//    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

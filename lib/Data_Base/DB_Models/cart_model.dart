import 'package:flutter/material.dart';

import 'Helper/cart_provider.dart';

class Cart_Model {
  int ?id;
   String? image;
   String ?name;
  double? price;


  Cart_Model({
    this.id,
     this.image,
     this.price,
     this.name,
  });

  Cart_Model.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    image = map[columnImage];
    price = map[columnPrice];
    name = map[columnName];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnImage]  = image;
    map[columnPrice] = price;
    map[columnName] = name;
    return map;
  }
}
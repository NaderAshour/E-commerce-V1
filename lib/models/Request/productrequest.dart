
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/Product.dart';
Future<Product> GetProductdata(String ProductId) async{
  http.Response request = await http.get(Uri.https('asos2.p.rapidapi.com','/products/v3/detail',
      {
        'id': ProductId, 'lang': 'en-US', 'store': 'US', 'sizeSchema': 'US', 'currency': 'USD'
      }),
      headers: {
        'X-RapidAPI-Key': '8738984fe0msh775013e63bd3afap1f94fcjsnde255588dd5d',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      });
  if (request.statusCode <= 299 && request.statusCode >= 200) {
    final Map<String, dynamic> jsonBody = json.decode(request.body);
    // List<dynamic> data = jsonBody["products"];
    Product detailsResponse = Product.fromjson(jsonBody);
    // print(detailsResponse.description);
    print(detailsResponse);
    return detailsResponse;

  }
  else {
    print('error');
    throw ('Request Fail');
  }
}
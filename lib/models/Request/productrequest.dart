
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/Product.dart';
Future<Product> GetProductdata(String ProductId) async{
  http.Response request = await http.get(Uri.https('asos2.p.rapidapi.com','/products/v3/detail',
      {
        'id': ProductId, 'lang': 'en-US', 'store': 'US', 'sizeSchema': 'US', 'currency': 'USD'
      }),
      headers: {
        'X-RapidAPI-Key': 'e667247f01msh6d7d535460ee861p1fc683jsnfd14e8a27872',
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
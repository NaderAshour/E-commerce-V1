import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/CategoryModal.dart';
class CategoryRequest {
  Future<CategoryModal> getdata(String CategoryId) async {
    http.Response request = await http.get(
        Uri.https('asos2.p.rapidapi.com', '/products/v2/list',
            {
              "store": 'US',
              "offset": '0',
              "categoryId": CategoryId,
              "limit": '48',
              "country": 'US',
              "sort": 'freshness',
              "currency": 'USD',
              "sizeSchema": 'US',
              "lang": 'en-US'
            }),
        headers: {
          'X-RapidAPI-Key': 'e667247f01msh6d7d535460ee861p1fc683jsnfd14e8a27872',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
        });
    if (request.statusCode <= 299 && request.statusCode >= 200) {
print('sucess');
      final Map<String, dynamic> jsonBody = json.decode(request.body);
      List<dynamic> data = jsonBody["products"];
      print(data);
      CategoryModal categoryResponse = CategoryModal.fromjson(jsonBody);
      return  categoryResponse;
    }
    else {
      print('failure');
      throw ('Request Fail');
    }
  }
}

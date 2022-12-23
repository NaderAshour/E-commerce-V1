import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Data_Base/DB_Models/Helper/favourite_provider.dart';
import 'package:shop_app/Data_Base/DB_Models/favourite_model.dart';

import '../../../constants.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key ?key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kDefaultPaddin),
        child: FutureBuilder<List<Favourite_Model>>(
          future: Favourite_Provider.instance.getAllFav(),
          builder: (context,snapshot){
            return ListView.builder(itemBuilder: (context,index){
            return  ListTile(
                leading: Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 
                ),
               child: Image.network('${snapshot.data![index]!.image}'),
              ),
                   title: Text('${snapshot.data![index]!.name}'),
                subtitle: Text('${snapshot.data![index]!.price}'),
                trailing: Icon(Icons.delete),
              );
            },
            itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Request/CategoryRequest.dart';
import 'package:shop_app/screens/home/components/model_state.dart';

import '../../../constants.dart';



class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
  List<String> categories = ["Jeans", "Shoes", "Accesories"];
  List<int> categories_id = [4208, 4209, 4210];
  int selectedIndex = 0;
  //Categories( this.selectedIndex,this.categories_id);
}


class _CategoriesState extends State<Categories> {
@override


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap:(){
              //getdata('${categories_id[index]}');
              setState(() {
                widget.selectedIndex =index;
              });},
              child: buildCategory(index)
          ),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
     return
       //GestureDetector(
    //   onTap: () {
    //      //getdata('${categories_id[index]}');
    //     setState(() {
    //       selectedIndex =index;
    //     });
    //   },
    //   child:
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: widget.selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      );

  }
}

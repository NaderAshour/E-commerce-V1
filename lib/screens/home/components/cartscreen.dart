
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/Data_Base/DB_Models/Helper/cart_provider.dart';
import 'package:shop_app/models/CategoryModal.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:rive/rive.dart';

import '../../../Data_Base/DB_Models/cart_model.dart';
import '../../../constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key ?key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 // Artboard? riveaertboard;
 // StateMachineController? controllerIdle;
 // StateMachineController? controllerpressed;
 // SMIInput<String>? stateidle; // كدا ناقص ميثود للاضافة والمسح
  @override
 /* void initState() {
    rootBundle.load('assets/light_like.riv').then((data)async{
      final file =RiveFile.import(data);
      final artboard=file.mainArtboard;
      var rive=StateMachineController.fromArtboard(artboard, 'State Machine 1');
      if(rive!=null){
        artboard.addController(rive);
        rive.findInput('Pressed');
      }
      
    });
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.lightBlueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Body()));
          },
        ),
        title: const Text("Cart Details"),
      ),
      body: FutureBuilder<List<Cart_Model>>(
        future:Cart_Provider.instance.getAllCarts() ,
        builder:(BuildContext context, snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          if(snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Constants.thirdColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:snapshot.data!.length ,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.17, //145,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                     image: DecorationImage(
                                         image: NetworkImage(
                                           snapshot.data!.elementAt(index).image!,
                                         ),
                                         fit: BoxFit.contain),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                 Text(
                                   snapshot.data!.elementAt(index).name!,
                                   style: const TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold),
                                   maxLines: 1,
                                 ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                         Text(
                                           '${snapshot.data!.elementAt(index).price}\$',
                                           style: const TextStyle(
                                               fontSize: 20,
                                               fontWeight: FontWeight.bold,
                                               color: Colors.grey),
                                         ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.all(10),
                                      child: IconButton(
                                        onPressed: () {

                                          setState(() {
                                              Cart_Provider.instance.deleteCart(snapshot.data![index].id!);
                                              print('product $index deleted successfuly');

                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 25,
                                          color: Colors.grey,
                                        ),
                                        padding: EdgeInsets.all(0),
                                      ),
                                      decoration: BoxDecoration(

                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    right: 10,
                    left: 10,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Item',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          // Text(
                          //   products.length.toString(),
                          //   style: const TextStyle(
                          //     fontSize: 15,
                          //   ),
                          // ),
                        ],
                      ),
                      Container(width: 8,height:60,color: Colors.white),
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          TotalPrice(total:200),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
          }
          return Center(

            child: CircularProgressIndicator(),
          );

        } ,

      ),





    );
  }
}
class TotalPrice extends StatefulWidget {
  TotalPrice({Key ?key,required this.total}) : super(key: key);
  double total;
  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.total.toString(),
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}

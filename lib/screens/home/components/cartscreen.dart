
import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/body.dart';

import '../../../constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key ?key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Column(
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
                itemCount:12 ,
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
                            //  image: DecorationImage(
                            //      image: NetworkImage(
                            //        products.elementAt(index).image,
                            //      ),
                            //      fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        // Text(
                        //   products.elementAt(index).title,
                        //   style: const TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold),
                        //   maxLines: 1,
                        // ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                 // Text(
                                 //   '${products.elementAt(index).price}\$',
                                 //   style: const TextStyle(
                                 //       fontSize: 20,
                                 //       fontWeight: FontWeight.bold,
                                 //       color: Colors.grey),
                                 // ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                margin: const EdgeInsets.all(10),
                                child: IconButton(
                                  onPressed: () {

                                    setState(() {

                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(0),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
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

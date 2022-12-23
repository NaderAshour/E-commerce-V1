import 'package:flutter/material.dart';
import 'package:shop_app/Data_Base/DB_Models/cart_model.dart';
import 'package:shop_app/screens/home/components/cartscreen.dart';
import '../../../Data_Base/DB_Models/Helper/cart_provider.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart>with SingleTickerProviderStateMixin {
  @override

@override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[

          Expanded(
            child: SizedBox(
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color(0xFF3D82AE),
                onPressed: () {
                   Cart_Provider.instance.insertCart(Cart_Model(price: widget.product.price,
                   id:widget.product!.id!,
                   image:'http://'+ widget.product!.image!,
                   name: widget.product!.title!,
                   ));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){

                    return CartScreen();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to cart".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

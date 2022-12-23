import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
     Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            product!.title!,
            style: Theme.of(context)
                .textTheme
                .headline4
                !.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Container(
                width: 200,
                height: 240,
                child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    'http://'+product!.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

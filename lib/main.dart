import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/Splash_Screen.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/screens/home/components/model_state.dart';
import 'Data_Base/DB_Models/Helper/cart_provider.dart';
import 'Data_Base/DB_Models/Helper/favourite_provider.dart';
import 'constants.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Cart_Provider.instance.open();
  //Favourite_Provider.instance.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( context)=> categoryprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

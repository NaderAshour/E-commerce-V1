import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop_app/models/CategoryModal.dart';
import 'package:shop_app/models/Request/CategoryRequest.dart';
import 'package:shop_app/screens/Shimmerwidget.dart';
import 'package:shop_app/screens/home/components/profilescreen.dart';
import '../../../constants.dart';

import '../../details/details_screen.dart';
import 'cartscreen.dart';
import 'categorries.dart';
import 'item_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
bool isloading= false;
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {


   @override
 void initState() {
  isloading= true;
   Future.delayed(const Duration(seconds:2),(){
     setState(() {
       isloading=false;
     });
   }
   );
   super.initState();
 }
 final List<Widget>taps=[
   BodyHome(),
   CartScreen(),
   ProfileScreen(),
 ];
   int selectedindex=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     //appBar:AppBar(
     //  backgroundColor: Colors.white,
     //  elevation: 0,
     //  leading: IconButton(
     //    icon: SvgPicture.asset("assets/icons/back.svg"),
     //    onPressed: () {},
     //  ),
     //  actions: <Widget>[
     //    IconButton(
     //      icon: SvgPicture.asset(
     //        "assets/icons/search.svg",
     //        // By default our  icon color is white
     //        color: kTextColor,
     //      ),
     //      onPressed: () {},
     //    ),
     //    IconButton(
     //      icon: SvgPicture.asset(
     //        "assets/icons/cart.svg",
     //        // By default our  icon color is white
     //        color: kTextColor,
     //      ),
     //      onPressed: () {},
     //    ),
     //    SizedBox(width: kDefaultPaddin / 2)
     //  ],
     //),
      body: taps[selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          onTabChange: (newvalue){
            setState(() {
              selectedindex=newvalue;
            });
          },
          //ackgroundColor: Colors.redAccent,
          // rippleColor: Colors.grey[800], // tab button ripple color when pressed
          // hoverColor: Colors.grey[700], // tab button hover color
         //  haptic: true, // haptic feedback
          // tabBorderRadius: 15,
           tabActiveBorder: Border.all(color: Color(0xff6ccefc), width: 1), // tab button border
           //tabBorder: Border.all(color: Colors.brown, width: 2), // tab button border
          // //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          // curve: Curves.linear, // tab animation curves
          // duration: Duration(milliseconds: 200), // tab animation duration
           gap: 8, // the tab button gap between icon and text
          // color: Colors.grey[800], // unselected icon color
           activeColor: Color(0xff4d2059), // selected icon and text color
           iconSize: 25, // tab button icon size
           tabBackgroundColor: Color(0xff6ccefc), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),

              GButton(

                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              GButton(
                icon: EvaIcons.heart,
                text: 'Likes',
              ),
            ]
        ),
      ),
    );
  }
}

class BodyHome extends StatefulWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Categories(),
              FutureBuilder<CategoryModal>(
                future: CategoryRequest().getdata('4210'),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.products!.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kDefaultPaddin,
                                crossAxisSpacing: kDefaultPaddin,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) => ItemCard(
                                product: snapshot.data!.products![index],
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: snapshot.data!.products![index],
                                      ),
                                    )),
                              )),
                        ),
                      ],
                    );
                  }
                  if(snapshot.hasError){
                    print(snapshot.error);

                  }
                  return shimmerwidget();
               //    return CircularProgressIndicator();
               // else {
               //   return Container(
               //     width: MediaQuery.of(context).size.width,
               //     height: MediaQuery.of(context).size.height,
               //     child: shimmerwidget(),
               //   );
               // }
                } ,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

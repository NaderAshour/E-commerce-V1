import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/screens/LoginScreen/States_Enum.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testEmail = "nader@gmail.com";
  String testPassword = "123456";
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hands up");
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hands down");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Faillll");
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftttttt");
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(StatesEnum.idle.name);
       controllerHandsUp = SimpleAnimation(StatesEnum.Hands_up.name);
     controllerHandsDown = SimpleAnimation(StatesEnum.hands_down.name);
     controllerLookRight = SimpleAnimation(StatesEnum.Look_down_right.name);
      controllerLookLeft = SimpleAnimation(StatesEnum.Look_down_left.name);
       controllerSuccess = SimpleAnimation(StatesEnum.success.name);
          controllerFail = SimpleAnimation(StatesEnum.fail.name);

    rootBundle.load('assets/login_animation.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
    //  appBar: AppBar(title: const Text('Login Screen'),centerTitle: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipPath(
                     clipper: Customshape(),
                    child: Container(
                      width: width,
                      height:height*0.3,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 160,),
                 //ClipPath(
                 //  clipper: Customshape2(),
                 //  child: Container(
                 //    width: width,
                 //    height:height,
                 //    color: Colors.cyan,
                 //  ),
                 //),
                ],
              ),

              Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: riveArtboard == null
                        ? const SizedBox.shrink()
                        : Rive(
                      artboard: riveArtboard!,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          validator: (value) =>
                          value != testEmail ? "Wrong email" : null,
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                value.length < 16 &&
                                !isLookingLeft) {
                              addLookLeftController();
                            } else if (value.isNotEmpty &&
                                value.length > 16 &&
                                !isLookingRight) {
                              addLookRightController();
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          focusNode: passwordFocusNode,
                          validator: (value) =>
                          value != testPassword ? "Wrong password" : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 8,
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              passwordFocusNode.unfocus();

                              validateEmailAndPassword();
                              if(formKey.currentState!.validate()){

                               Future.delayed(const Duration(milliseconds: 1800),
                                   ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()))
                               );
                              }

                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ]
          ),
        ),
      ),
    );
  }
}



class Customshape extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height-100);
    //path.cubicTo(0, height,width*0.5,height*0.001, width, height);
    path.cubicTo(0, height-100, width*0.25,height , width*0.5, height-100);
    path.cubicTo(width*0.5, height-100, width*0.75,height , width, height-100);
   // path.quadraticBezierTo(width/2, height*0.1, width, height-80);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
class Customshape2 extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0,height );
   path.cubicTo(0, height-100,width*0.25,height, width*0.5, height-100);
   path.cubicTo(width*0.5, height-100,width*0.75,height, width, height-100);
   //path.lineTo(width, 0);
    path.lineTo(width, 0);
    //path.cubicTo(width*0.2, height,width*0.4,height*0.001, width, height);
   // path.quadraticBezierTo(width/2, height*0.1, width, height-80);
   // path.lineTo(width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

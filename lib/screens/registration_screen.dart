import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_app/services/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation1;
  Animation<Color> animation2;
  Widget _mywidget;
  TextEditingController _email,_pass;
  
  Future<void> _signup(BuildContext context,String email,String pass) async{
    try{
      print(pass);
      final auth= Provider.of<FirebaseAuthService>(context,listen: false);
      final user = await auth.createUser(email,pass);
      print('uid: ${user.uid}');
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    _email=TextEditingController(text: "");
    _pass= TextEditingController(text:"");
    super.initState();
    _mywidget = animatedWidget();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation1 = ColorTween(begin: Colors.grey[500], end: Colors.grey[100])
        .animate(_controller);
    animation2 = ColorTween(begin: Colors.grey[100], end: Colors.grey[500])
        .animate(_controller);

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed)
        _controller.reverse();
      else if (_controller.status == AnimationStatus.dismissed)
        _controller.forward();
      this.setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0.2 * size.height,
                ),
                Text(
                  "Getting Started",
                  style: ktextstyle1.copyWith(fontSize: 40),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  style: ktextstyle2.copyWith(fontSize: 20, letterSpacing: 1.5),
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromRGBO(6, 157, 126, 100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(6, 157, 126, 100),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(
                          6,
                          157,
                          126,
                          100,
                        ),
                      ),
                    ),
                    labelStyle: ktextstyle1.copyWith(
                        color: Color.fromRGBO(6, 157, 126, 100), fontSize: 15),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                TextField(
                  controller: _pass,
                  obscureText: true,
                  style: ktextstyle2.copyWith(fontSize: 20, letterSpacing: 1.5),
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromRGBO(6, 157, 126, 100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(6, 157, 126, 100),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(
                          6,
                          157,
                          126,
                          100,
                        ),
                      ),
                    ),
                    labelStyle: ktextstyle1.copyWith(
                        color: Color.fromRGBO(6, 157, 126, 100), fontSize: 15),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                      duration: Duration(microseconds: 600),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) =>
                              ScaleTransition(scale: animation, child: child),
                      child: _mywidget,
                    ),
                    RawMaterialButton(
                      elevation: 0,
                      onPressed: () async {
                        setState(() {
                          _mywidget = SpinKitCircle(
                            color: Color.fromRGBO(126, 41, 130, 100),
                            duration: Duration(seconds: 1),
                          );
                        });

                         _signup(context, _email.text, _pass.text);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 140,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget animatedWidget() {
  return Material(
    elevation: 8,
    shadowColor: Colors.transparent,
    child: Container(
      width: 130,
      decoration: BoxDecoration(
          color: Color.fromRGBO(126, 41, 130, 100),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        "Register",
        style: ktextstyle1.copyWith(fontSize: 20, color: Colors.white),
      )),
    ),
  );
}

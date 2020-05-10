import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
      //final user =Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(6, 57, 126, 100),
          title: Center(
            child: Text(
              "Home Screen",
              style: ktextstyle1.copyWith(fontSize: 25, letterSpacing: 1),
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async{
                final auth =Provider.of<FirebaseAuthService>(context, listen: false);
                await auth.signOut();
              },
                          child: Container(
                padding: EdgeInsets.all(13),
                            child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(126, 41, 130, 100),style: BorderStyle.solid,width: 1)),
                  padding: EdgeInsets.all(8),
                  child: Center(child: Text("Log Out",style: ktextstyle1.copyWith(fontSize:8,fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),

        body: Center(child: Text("Welcome",style: ktextstyle2,),),
      ),
    );
  }
}

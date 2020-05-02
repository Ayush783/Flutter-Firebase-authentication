import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_app/screens/Login_screen.dart';
import 'package:new_app/screens/home_screen.dart';
import 'package:new_app/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authservice=Provider.of<FirebaseAuthService>(context,listen: false);
    return StreamBuilder<User>(
      stream: authservice.onAuthStateChanged,
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final user=snapshot.data;
          return user== null?LoginScreen():HomeScreen();
        }
        return Scaffold(body: Center(
          child: SpinKitCircle(color: Colors.blue,),
        ),);
      },
    );
  }
}
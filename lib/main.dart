import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/auth_widget.dart';
import 'package:new_app/screens/splash_screen.dart';
import 'package:new_app/services/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Provider<FirebaseAuthService>(
      create: (_)=>FirebaseAuthService(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          initialRoute: '/SplashScreen',
          routes: <String , WidgetBuilder>{
            '/SplashScreen': (context)=> SplashScreen(),
            '/AuthWidget': (context)=> AuthWidget(),
          },
      ),
    );
  }
}

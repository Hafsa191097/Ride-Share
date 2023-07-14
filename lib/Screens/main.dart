import 'package:flutter/material.dart';
import 'package:ride_share/Screens/SignUp.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:ride_share/Authentication_Classes/authenticateUser.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticateUser()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>const Signup()), 
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green, 
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(65),
            child: Image.asset('images/logo.png'),
          ), 
        ),
    );
  }
}


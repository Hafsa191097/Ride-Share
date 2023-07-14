import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ride_share/Common_Widgets/header.dart';
import 'package:ride_share/Screens/registration.dart';
import 'package:ride_share/Screens/Forgot_Password.dart';
import 'package:ride_share/Screens/HomeScreen.dart';
import 'package:ride_share/model_classes/signup_model.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_share/Screens/SignUp.dart';

import 'Take_phone.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> { 
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUp_model());
    final _formkey = GlobalKey<FormState>();
    return  Scaffold(
      extendBodyBehindAppBar: true,
      
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const header(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.Email,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 13,horizontal:10), 
                          isDense: true,
                          label: const Text('Email'),
                          labelStyle: const TextStyle(color: Colors.grey,fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width:2.0,color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.Password,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 13,horizontal:10), 
                          isDense: true,
                          label:const Text('Password'),
                          labelStyle: const TextStyle(color: Colors.grey,fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width:2.0,color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            
                            padding: const EdgeInsets.all(13),
                            
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(30.0),
                          ),
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: controller.Email.text.trim(),
                              password: controller.Password.text.trim()).then((value) => 
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) =>const HomeScreen()), 
                                ),
                              ).onError((error, stackTrace) => print("Error: $error"));
                          },
                          child:const Text('Sign In',
                            style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
        
                    const SizedBox(height: 15.0),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    
                     const SizedBox(height: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(13),
                              backgroundColor: Colors.blue[700],
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            ),
                            onPressed: () {
                              SignUp_model.instance.signInWithGoogleAccount();
                            },
                            icon:const  FaIcon(FontAwesomeIcons.google,size: 15,color: Colors.white,),
                    
                            label: const Text('SignIn with Google',
                              style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.all(13),
                              shape: RoundedRectangleBorder(
                                
                                borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => PhoneNumberPage()), 
                              );
                            },
                            icon:const  FaIcon(FontAwesomeIcons.phone,size: 15,color: Colors.white,),
                            label:const Text('Sign In With Apple',
                              style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
        
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             TextButton(
                                
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) =>const Forgot_password()));
                              },
                              style: TextButton.styleFrom( padding: EdgeInsets.zero),
                              child: const Text.rich(
                              TextSpan(
                                text: 'Forgot Your Password? ',
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey, decoration: TextDecoration.none),
                                
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Retrieve',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.green, decoration: TextDecoration.none,),
                                  )
                                
                                  
                                ],
                              ),
                              ),
                            ),
        
                             TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) =>const registeration()));
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                               child:const Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  text: 'Need An Account? ',
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none, ),
                                    
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Sign Up',
                                      
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.green, decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                                     ),
                             ),
        
                          ],
                        ),
                      ],
                    ),
        
                  ],
                ),
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}


class AuthenticateUser extends GetxController {
    static AuthenticateUser get instance => Get.find();
    final _auth = FirebaseAuth.instance;
    late final Rx<User?> user;
     
    @override
    void onReady(){
      user = Rx<User?>(_auth.currentUser);
      user.bindStream(_auth.userChanges());
      ever(user, (callback) => _setInitialScreen);
    }
    void _setInitialScreen(User ? user){
      user == null ? Get.offAll( ()=>const Signup()) : Get.offAll( ()=>const HomeScreen()) ;
    }
    Future<void> createUserWithEmailAndPassword(String email, String password)async {
      try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        user.value != null ? Get.offAll( ()=>const HomeScreen()) : Get.offAll( ()=>const Signup());
      }on FirebaseAuthException catch (e) {
        e.printError();
      }catch (_){}
      
    }

    Future<void> signinUserWithEmailAndPassword(String email, String password)async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        user.value != null ? Get.offAll( ()=>const Signup()) : Get.offAll( ()=>const HomeScreen());
      }on FirebaseAuthException catch (e) {
        e.printError();
      }catch (_){}
    
    }
}

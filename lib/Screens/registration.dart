import 'package:flutter/material.dart';
import 'package:ride_share/Common_Widgets/header.dart';
import 'package:ride_share/Screens/SignIn.dart';
import 'package:ride_share/model_classes/signup_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class registeration extends StatefulWidget {
  const registeration({super.key});

  @override
  State<registeration> createState() => _registerationState();
}

// ignore: camel_case_types
class _registerationState extends State<registeration> {


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUp_model());
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const header(),
              Container(
                padding: const EdgeInsets.only(top:20,right:10,left:10,bottom:10),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.Email,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 13,horizontal:10), //Change this value to custom as you like
                          isDense: true,
                          label: Text('Email'),
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width:2.0,color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: controller.Password,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 13,horizontal:10), //Change this value to custom as you like
                          isDense: true,
                          label: Text('Password'),
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width:2.0,color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        obscureText: true,
                        controller: controller.Confirm_Pass,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 13,horizontal:10), //Change this value to custom as you like
                          isDense: true,
                          label: const Text('Confirm Password'),
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width:2.0,color: Colors.green),
                          ),
                        ),
                      ),
      
                      const SizedBox(height: 15.0),
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
      
                            if(_formkey.currentState!.validate()){
                              // ignore: unrelated_type_equality_checks
                              if(controller.Email.text.trim().isEmail){
                                SignUp_model.instance.RegisterUser(controller.Email.text.trim(), controller.Password.text.trim());
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) =>const SignIn()), 
                            );
                             }
                              
                            }
                              
                          },
                          child:const Text('Sign Up',
                            style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      ),
                    const SizedBox(height: 15.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            'Continue With',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
      
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 145,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(13),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        ),
                        onPressed: () {
                          // Handle sign in with Twitter button press
                        },
                        icon: const FaIcon(FontAwesomeIcons.apple,size: 15,color: Colors.white,),
                        label: const Text('SignIn',
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 145,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                        onPressed: () {
                          
                        },
                        icon:  const FaIcon(FontAwesomeIcons.twitter,size: 15,color: Colors.white,),
                        label:const Text('SignIn',
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          ),
                        ),
                      ),
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



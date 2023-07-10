import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ride_share/Screens/registration.dart';
import 'package:ride_share/Screens/SignIn.dart';
import 'package:ride_share/Common_Widgets/header.dart';
import 'Take_phone.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Stack(

        children: [
         
        const header(),
        Container(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        margin:const EdgeInsets.only(top:350,left:10,right:10,bottom:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  TextButton(
                    onPressed: (){},
                    child: const Text.rich(
                      TextSpan(
                        text: 'Sign Up ',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none,),
                          
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'With',
                            
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none,),
                          )
                          
                        ],
                      ),
                    ),
                  ),
                   const SizedBox(height: 10.0),
                    SizedBox(
                      
                      width: 330,
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          
                          padding: const EdgeInsets.all(13),
                          
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        ),
                        onPressed: () {
                            Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const registeration()), 
                          );
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
                  TextButton(
                    onPressed: (){},
                    child: const Text.rich(
                      TextSpan(
                        text: 'Or         ',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none,),
                          
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 145,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(64, 196, 255, 1),
                    padding: const EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                     ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => PhoneNumberPage()), 
                      );
                    },
                    icon:const  FaIcon(FontAwesomeIcons.phone,size: 15,color: Colors.white,),
                    label:const Text('Sign In',
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
                      borderRadius: BorderRadius.circular(13.0),
                     ),
                  ),
                    onPressed: () {
                      // Handle sign in with Facebook button press
                    },
                    icon:const  FaIcon(FontAwesomeIcons.twitter,size: 15,color: Colors.white,),
                    label:const Text('Sign In',
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
           
            
            
            
            const SizedBox(height: 20.0),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>const SignIn()));
                },
                child: const Text.rich(
                TextSpan(
                  
                  text: 'Already Have An Account? ',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none,),
                    
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'SignIn',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.green, decoration: TextDecoration.none),
                    )
                    
                  ],
                ),
                ),
                ),
          ],
        
        ),
      ),
    ],
    )
  );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../Authentication_Classes/otp_controller.dart';
import '../Common_Widgets/header.dart';
import 'HomeScreen.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const header(),
            SizedBox(height: 15.0),
            const Text(
              'Enter the OTP code sent to Your Phone Number',
              style: TextStyle(fontSize: 15,),
            ),
            SizedBox(height: 30.0),
            OtpTextField(
              fieldWidth: 45,
              numberOfFields: 6,
              margin: const EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              onSubmit:(code){
                verifyOTP_controller.instance.verifyOTP(code);
              } ,
            ),
            SizedBox(height: 16.0),
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
                          MaterialPageRoute(builder: (_) =>const HomeScreen()), 
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
          ],
        ),
      ),
    );
  }
}

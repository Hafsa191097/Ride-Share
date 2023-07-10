import 'package:flutter/material.dart';
import 'package:ride_share/Screens/Opt_Screen.dart';

import '../Common_Widgets/header.dart';
import '../model_classes/signup_model.dart';

class PhoneNumberPage extends StatelessWidget {
  PhoneNumberPage({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();

  void _sendOTP() {
    String phoneNumber = _phoneNumberController.text.trim();
    SignUp_model.instance.registerPhoneNumber(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const header(),
              SizedBox(height: 32.0),
              Text(
                'Enter your phone number',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 13,horizontal:20), 
                  isDense: true,
                  label: const Text('Phone Number'),
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Phone number',
                  labelStyle: TextStyle(color: Colors.grey,fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width:2.0,color: Colors.green),
                  ),
                ),
              ),
        
              const SizedBox(height: 25.0),
             
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
                      _sendOTP();
                      Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) =>const OTPVerificationPage()), 
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
    ),
    );
  }
}

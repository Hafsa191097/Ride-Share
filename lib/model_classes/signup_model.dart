import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ride_share/Authentication_Classes/authenticateUser.dart';

class SignUp_model extends GetxController {
    static SignUp_model get instance => Get.put(SignUp_model());
    

    final Email = TextEditingController();
    final Password = TextEditingController();
    final Confirm_Pass =TextEditingController();
    final Phn =TextEditingController();

    void RegisterUser(String email,String password ){
      AuthenticateUser.instance.createUserWithEmailAndPassword(email, password);
    }
    void loginUser(String email,String password ){
        AuthenticateUser.instance.signinUserWithEmailAndPassword(email, password);
    }

    void registerPhoneNumber(String phn ){
        AuthenticateUser.instance.phoneAuthentication(phn);
    }
}

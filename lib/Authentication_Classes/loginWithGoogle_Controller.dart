import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ride_share/Authentication_Classes/authenticateUser.dart';


class LoginController extends GetxController{
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?> (null);

  void login() async{
    googleAccount.value= await _googleSignIn.signIn();
  }

  void logout() async{
    googleAccount.value= await _googleSignIn.signOut();
  }

}
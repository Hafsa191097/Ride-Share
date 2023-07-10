import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_share/Authentication_Classes/authenticateUser.dart';
import 'package:ride_share/Screens/HomeScreen.dart';
import 'package:get/get.dart';

class verifyOTP_controller extends GetxController {
    static verifyOTP_controller get instance => Get.put(verifyOTP_controller());
    late final Rx<User?> user;
   
    Future<void> verifyOTP(String otp) async{
     var verified = AuthenticateUser.instance.verifyOTP(otp);
     await verified ? Get.offAll(const HomeScreen()) : Get.back();
    }

    
}

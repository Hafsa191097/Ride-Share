import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ride_share/Screens/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:ride_share/Screens/SignUp.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthenticateUser extends GetxController {
    static AuthenticateUser get instance => Get.find();
    final _auth = FirebaseAuth.instance;
    late final Rx<User?> user;
    var verificationId=''.obs;
     
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

    Future<void> phoneAuthentication(String phn) async {
      await _auth.verifyPhoneNumber(
        phoneNumber: phn,
        verificationCompleted: (credentials)async{
         await _auth.signInWithCredential(credentials);
        },
        codeSent: (verificationId,resendToken){
          this.verificationId.value = verificationId;

        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value = verificationId;
        },
        verificationFailed:(e){
          if(e.code == 'invalid-phone number'){
            Get.snackbar('Error', 'Provided phone number is not valid');
          }else{
            Get.snackbar('Error', 'Something went wrong please try again!');
          }
        },
      );
    }

    Future<bool> verifyOTP(String otp) async{
      var credentials= await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
      return credentials.user!=null ? true :false;
    }

    Future<void> signinUserWithEmailAndPassword(String email, String password)async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        user.value != null ? Get.offAll( ()=>const Signup()) : Get.offAll( ()=>const HomeScreen());
      }on FirebaseAuthException catch (e) {
        e.printError();
      }catch (_){}
    
    }

    Future<UserCredential> signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}

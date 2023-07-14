

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
    final Googflesigin = GoogleSignIn();
    GoogleSignInAccount? _user;
    GoogleSignInAccount get user => _user!;

    Future<void> LoginUser() async{
      final googleuser = await Googflesigin.signIn();
      if(googleuser == null) return;
      _user=googleuser;
      final googleAuth = await googleuser.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credentials);
      notifyListeners();

    }

}
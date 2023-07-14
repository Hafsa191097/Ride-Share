import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_share/Screens/SignIn.dart';

class header extends StatelessWidget {
  const header({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    
    return Material(
      color: Colors.white,
      child:Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: wavey(),
              child: Container(
                height: 335,
                color: Colors.green,
              ),
            ),
          ),
          ClipPath(
              clipper: wavey(),
              child: Container(
                height: 330,
                color: Colors.green,
              ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 60,top:15,right:60,bottom:50),
            padding: const EdgeInsets.all(45),
            
            child: Image.asset('images/logo.png'),
          ),
        ],
      ),
    );
  }
}

class wavey extends CustomClipper<Path>{

  
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var first =Offset(size.width/5,size.height);
    var firstend =Offset(size.width/2.25,size.height-50);
    path.quadraticBezierTo(first.dx, first.dy, firstend.dx, firstend.dy);

    var second= Offset(size.width - (size.width/3.24),size.height-105);
    var secondend =Offset(size.width,size.height-10);
    path.quadraticBezierTo(second.dx, second.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
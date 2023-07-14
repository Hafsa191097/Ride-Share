import 'package:flutter/material.dart';
import '../model_classes/signup_model.dart';
import 'SignIn.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 100,
            ),
            Text('hafsa',
            ),
            Text( '',
            ),
            SizedBox(height: 16,),
             ActionChip(
              avatar:const Icon(Icons.logout),
              label:const Text('Logout'),
              onPressed: (){
                setState(() {
                  SignUp_model.instance.logout();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignIn()), 
                  );
                });
              },
            ),
          ],
      ),
    );
  }
}
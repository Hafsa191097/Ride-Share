import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Authentication_Classes/loginWithGoogle_Controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    
  final google_controller =Get.put(LoginController());
    return GetMaterialApp(
      home: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: Image.network( '').image,
            radius: 100,
          ),
          Text('hafsa',
            style: Get.textTheme.headlineMedium,
          ),
          Text( '',
            style: Get.textTheme.bodyMedium,
          ),
          SizedBox(height: 16,),
           ActionChip(
            avatar:const Icon(Icons.logout),
            label:const Text('Logout'),
            onPressed: (){
              google_controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
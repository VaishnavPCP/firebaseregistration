import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseregistration/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:firebaseregistration/loginpage.dart';
import 'package:get/get.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
  .then((value)=>Get.put(AuthController()));
  runApp(const Register());
}
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Firstpage(),
    );
  }
}

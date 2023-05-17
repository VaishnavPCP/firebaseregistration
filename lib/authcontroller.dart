import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseregistration/loginpage.dart';
import 'package:firebaseregistration/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AuthController extends GetxController{
  static AuthController instance=Get.find();
  late Rx<User?>user;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    user=Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user,initialscreen);
  }

  initialscreen(User?user){
    if(user==null){
      print("login page");
      Get.offAll(()=>Firstpage());
    }else{
      Get.offAll(()=>Welcomepage(email:user.email));
    }
  }
  void register(String email,String password)async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }

    catch(e){
      Get.snackbar("About user","User message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Registration failed"),
          messageText: Text(e.toString()) );
    }
  }
  void login(String email,String password)async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    }

    catch(e){
      Get.snackbar("About login","Login message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()) );
    }
  }
  void logout()async{
    await auth.signOut();
  }
  }

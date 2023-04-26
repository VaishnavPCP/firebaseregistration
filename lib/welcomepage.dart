import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Welcomepage extends StatelessWidget {
  String? email;
  Welcomepage({this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black),),
            Text(email!,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.purple),),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

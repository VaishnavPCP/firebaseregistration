import 'package:firebaseregistration/authcontroller.dart';
import 'package:firebaseregistration/registerpage.dart';
import 'package:flutter/material.dart';
class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INSTAGRAM",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(controller: emailcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email or username"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(controller: passwordcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  AuthController.instance.login(emailcontroller.text.trim(), passwordcontroller.text.trim());
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Login with Facebook",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account?",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage(),));
                },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

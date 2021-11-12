import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_email/login_screens/login_page.dart';
import 'package:login_signup_email/login_screens/register_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Fluttertoast.showToast(msg: "Password Reset Email Sent Succesfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No User found for that Email');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              "Reset Link will be sent to your email id!",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Expanded(
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                                labelText: 'Email:',
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15)),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text;
                                      });
                                    }
                                    resetPassword();
                                  },
                                  child: Text(
                                    "Send Email",
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                              TextButton(
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()))
                                      },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 14.0),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationScreen()))
                                      },
                                  child: Text('Singup'))
                            ],
                          ),
                        )
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}

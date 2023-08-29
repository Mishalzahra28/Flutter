import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import "../widget/CustomTextField.dart";
import "./auth_screen.dart";

class LoginScreen extends StatefulWidget {
  static const routeName='login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = "";
  String password = "";

  void trySubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      Signup();
    }
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void Signup() async {
    try {
      _isLoading = true;
      var authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (error) {
      _isLoading = false;
      var message = "An error occured. Please check credentials";
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            message,
          )));
    } catch (e) {
      _isLoading = false;
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Error Submitting the form",
          )));
    }
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Center(
                    child: Icon(
                  Icons.chat,
                  size: 50,
                  color: Colors.white,
                )),
                SizedBox(width: 10),
                Text(
                  "My",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigo),
                ),
                Text(
                  "Chat",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ]),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 8),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        CustomTextField(
                            title: "EMAIL",
                            setValue: setEmail,
                            hideText: false,
                            hintText: "username@mail.com"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                            title: "PASSWORD",
                            setValue: setPassword,
                            hideText: true,
                            hintText: "*******"),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: trySubmit,
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 51, 45, 138)),
                                foregroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 255, 255, 255))),
                            child: const Text("LOGIN"),
                          ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => AuthScreen()));
                        },
                        child: Text("Create Account"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

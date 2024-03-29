import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:image_picker/image_picker.dart';
import "package:firebase_storage/firebase_storage.dart";

import "./login_screen.dart";
import "../widget/CustomTextField.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = "";
  String password = "";
  String username = "";
  File? pickedImageFile;

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

  void setUsername(String value) {
    username = value;
  }

  void Signup() async {
    if (pickedImageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Please pick an Image",
          )));
    }
    try {
      _isLoading = true;
      var authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(authResult.user!.uid + '.jpg');
      await ref.putFile(pickedImageFile as File);
      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({"username": username, "email": email, 'image_url': url});
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

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImageFile = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
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
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.indigo.shade400,
                      backgroundImage: pickedImageFile != null
                          ? FileImage(pickedImageFile!)
                          : null,
                    ),
                    TextButton.icon(
                      onPressed: _pickImage,
                      label: Text("Add Image"),
                      icon: Icon(Icons.image),
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        CustomTextField(
                            title: "USERNAME",
                            setValue: setUsername,
                            hideText: false,
                            hintText: "username"),
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
                        CustomTextField(
                            title: "EMAIL",
                            setValue: setEmail,
                            hideText: false,
                            hintText: "username@mail.com"),
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
                            child: const Text("SIGN UP"),
                          ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text("Login"))
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

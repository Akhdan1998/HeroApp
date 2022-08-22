import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroapp/register.dart';
import 'package:supercharged/supercharged.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigation.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  double _padding = 6;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.white,
              child: Image.asset('assets/splash.png'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: 'FFC14F'.toColor(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Login",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Email",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 10),
                Container(
                  height: 35,
                  child: TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: 'C42D2D'.toColor()),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: 'C42D2D'.toColor()),
                      ),
                      hintText: 'contohemail@gmail.com',
                      hintStyle:
                          TextStyle(fontSize: 10, color: 'C42D2D'.toColor()),
                      fillColor: Colors.red.shade50,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Password",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 10),
                Container(
                  height: 35,
                  child: TextField(
                    obscureText: true,
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: 'C42D2D'.toColor()),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: 'C42D2D'.toColor()),
                      ),
                      hintText: '**********',
                      hintStyle:
                          TextStyle(fontSize: 10, color: 'C42D2D'.toColor()),
                      fillColor: Colors.red.shade50,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 77),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 51,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                    onTapDown: (_) => setState(() {
                      _padding = 0;
                    }),
                    onTapUp: (_) => setState(() {
                      _padding = 6;
                    }),
                    onTap: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailTextEditingController.text,
                                  password: passwordTextEditingController.text);
                        } on FirebaseAuthException catch (e) {
                          showNotification(context, e.message.toString());
                        }
                      }
                      Get.to(navigation());
                      Fluttertoast.showToast(
                          msg: "Berhasil Login",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: _padding),
                      padding: EdgeInsets.only(bottom: _padding),
                      decoration: BoxDecoration(
                        color: 'D44F4F'.toColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(milliseconds: 100),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: 'EB5C5C'.toColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('LOGIN SEKARANG',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Belum daftar? Daftar dulu ',
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                          color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Get.to(register());
                    },
                    child: Text('disini',
                        style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                            color: Colors.red)),
                  ),
                ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade50,
        content: Text(message.toString())));
  }
}

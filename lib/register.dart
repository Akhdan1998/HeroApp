import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroapp/model.dart';
import 'package:heroapp/registersukses.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';
import 'avatar.dart';
import 'model.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final namaLengkapEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final tanggalEditingController = TextEditingController();

  double _padding = 6;

  List<Select> select = [
    Select(
      id: '1',
      image: 'assets/spiderman.png',
      nama: 'spiderman',
      attack: 9,
      defence: 8,
      speed: 8,
      spesial: 9,
    ),
    Select(
      id: '2',
      image: 'assets/woldfreen.png',
      nama: 'woldfreen',
      attack: 8,
      defence: 9,
      speed: 8,
      spesial: 9,
    ),
    Select(
      id: '3',
      image: 'assets/amerika.png',
      nama: 'amerika',
      attack: 7,
      defence: 9,
      speed: 7,
      spesial: 9,
    ),
    Select(
      id: '4',
      image: 'assets/wonderwomen.png',
      nama: 'wonderwomen',
      attack: 9,
      defence: 8,
      speed: 8,
      spesial: 8,
    ),
    Select(
      id: '5',
      image: 'assets/pool.png',
      nama: 'pool',
      attack: 8,
      defence: 8,
      speed: 8,
      spesial: 8,
    ),
  ];

  //bikin string buat nyimpen
  String selectedId = '';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      backgroundColor: 'FFC14F'.toColor(),
      body: Column(children: [
        AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: 'FFC14F'.toColor(),
          title: Row(children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_outlined,
                  size: 17, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text(
              'Register',
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Nama Lengkap',
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                SizedBox(height: 8),
                Container(
                  height: 35,
                  child: TextField(
                    controller: namaLengkapEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: 'C42D2D'.toColor()),
                        ),
                        fillColor: Colors.red.shade50,
                        filled: true,
                        hintText: 'Nama Lengkap',
                        hintStyle: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: 'C42D2D'.toColor())),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Tanggal Lahir',
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                SizedBox(height: 8),
                Container(
                  height: 35,
                  child: TextField(
                    controller: tanggalEditingController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today_outlined,
                            size: 15, color: 'C42D2D'.toColor()),
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: 'C42D2D'.toColor()),
                        ),
                        fillColor: Colors.red.shade50,
                        filled: true,
                        hintText: 'tanggal lahir',
                        hintStyle: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: 'C42D2D'.toColor())),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1945),
                          lastDate: DateTime(2500));

                      if (pickeddate != null) {
                        setState(() {
                          tanggalEditingController.text =
                              DateFormat('yyyy-dd-MM').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Email',
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                SizedBox(height: 8),
                Container(
                  height: 35,
                  child: TextField(
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: 'C42D2D'.toColor()),
                        ),
                        fillColor: Colors.red.shade50,
                        filled: true,
                        hintText: 'contohemail@gmail.com',
                        hintStyle: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: 'C42D2D'.toColor())),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Password',
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                SizedBox(height: 8),
                Container(
                  height: 35,
                  child: TextField(
                    obscureText: true,
                    controller: passwordEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: 'C42D2D'.toColor()),
                        ),
                        fillColor: Colors.red.shade50,
                        filled: true,
                        hintText: '**********',
                        hintStyle: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: 'C42D2D'.toColor())),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Choose Avatar',
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ]),
            ),
            SizedBox(height: 14),
            SingleChildScrollView(
              clipBehavior: Clip.hardEdge,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  SizedBox(width: 20),
                  avatar(
                      select: select[0],
                      isActiv: (selectedId == select[0].id) ? true : false,
                      onSelected: (value) {
                        setState(() {
                          selectedId = value;
                        });
                      }),
                  SizedBox(width: 15),
                  avatar(
                      select: select[1],
                      isActiv: (selectedId == select[1].id) ? true : false,
                      onSelected: (value) {
                        setState(() {
                          selectedId = value;
                        });
                      }),
                  SizedBox(width: 15),
                  avatar(
                    select: select[2],
                    isActiv: (selectedId == select[2].id) ? true : false,
                    onSelected: (value) {
                      setState(() {
                        selectedId = value;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  avatar(
                    select: select[3],
                    isActiv: (selectedId == select[3].id) ? true : false,
                    onSelected: (value) {
                      setState(() {
                        selectedId = value;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  avatar(
                    select: select[4],
                    isActiv: (selectedId == select[4].id) ? true : false,
                    onSelected: (value) {
                      setState(() {
                        selectedId = value;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                ]),
              ),
            ),
            SizedBox(height: 80),
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
                          .createUserWithEmailAndPassword(
                              email: emailEditingController.text,
                              password: passwordEditingController.text);
                    } on FirebaseAuthException catch (e) {
                      showNotification(context, e.message.toString());
                    }
                  }
                  users.add({
                    'nama': namaLengkapEditingController.text,
                    'tanggal': tanggalEditingController.text,
                    'email': emailEditingController.text,
                    'password': passwordEditingController.text,
                    'selectedId': selectedId,
                  });
                  Get.to(registersukses());
                },
                child: AnimatedContainer(
                  height: 45,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: _padding),
                  padding: EdgeInsets.only(bottom: _padding),
                  decoration: BoxDecoration(
                    color: 'D44F4F'.toColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  duration: const Duration(milliseconds: 100),
                  child: AnimatedContainer(
                    height: 45,
                    duration: const Duration(milliseconds: 100),
                    alignment: Alignment.bottomCenter,
                    width: 400,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: 'EB5C5C'.toColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('DAFTAR SEKARANG',
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red.shade50,
        content: Text(message.toString())));
  }
}

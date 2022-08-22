import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:auth/auth.dart';

import 'avatar.dart';
import 'fpd.dart';
import 'login.dart';
import 'model.dart';

class settings extends StatefulWidget {
  final String? nama;
  final String? tanggal;
  final String? email;
  final String? password;

  settings({required this.nama, this.tanggal, this.email, this.password});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  TextEditingController nama = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _obsecureText = true;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  double _padding = 6;
  DateTime date = DateTime.now();
  String namaString = '';
  String tanggalString = '';
  String emailString = '';
  String passwordString = '';
  var isChanged = false;

  @override
  initState() {
    nama.text = widget.nama!;
    tanggal.text = widget.tanggal!;
    email.text = widget.email!;
    password.text = widget.password!;
  }

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: 'FFC14F'.toColor(),
        title: Container(
          padding: EdgeInsets.only(left: 4),
          alignment: Alignment.centerLeft,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Pengaturan',
                style: GoogleFonts.montserrat().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            GestureDetector(
              child: Icon(Icons.logout_outlined, color: Colors.black, size: 17),
              onTap: () async {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: isChanged ? 300 : 0,
                        height: isChanged ? 300 : 0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.close_outlined,
                                        color: Colors.black, size: 20),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Column(children: [
                                Container(
                                  width: 200,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 50),
                                          child: Text(
                                            'Are you sure?',
                                            style: GoogleFonts.play().copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RaisedButton(
                                                  elevation: 0,
                                                  color: Colors.white,
                                                  child: Text('NO',
                                                      style: GoogleFonts.play()
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: Colors
                                                                  .black)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                              RaisedButton(
                                                  elevation: 0,
                                                  color: Colors.white,
                                                  child: Text('YES',
                                                      style: GoogleFonts.play()
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: Colors
                                                                  .black)),
                                                  onPressed: () async {
                                                    await FirebaseAuth.instance
                                                        .signOut();
                                                    Get.to(login());
                                                    Fluttertoast.showToast(
                                                        msg: "Silahkan Login Kembali",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        backgroundColor: Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0
                                                    );
                                                  }),
                                            ]),
                                      ]),
                                  alignment: Alignment.center,
                                ),
                              ]),
                            ]),
                      );
                    });
              },
            ),
          ]),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: 'FFC14F'.toColor(),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Nama Lengkap',
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                child: TextField(
                  onChanged: (value) {
                    namaString = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.red.shade50,
                      filled: true,
                      hintText: 'nama lengkap',
                      hintStyle: GoogleFonts.montserrat().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: 'C42D2D'.toColor())),
                  controller: nama,
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Tanggal Lahir',
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                child: TextField(
                  onChanged: (value) {
                    tanggalString = value;
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.event,
                          color: 'C42D2D'.toColor(), size: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.red.shade50,
                      filled: true,
                      hintText: 'tanggal lahir',
                      hintStyle: GoogleFonts.montserrat().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: 'C42D2D'.toColor())),
                  controller: tanggal,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1945),
                      lastDate: DateTime(2500),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        tanggal.text =
                            DateFormat('yyyy-dd-MM').format(pickedDate);
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Email',
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                child: TextField(
                  onChanged: (value) {
                    emailString = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.red.shade50,
                      filled: true,
                      hintText: 'contohemail@gmail.com',
                      hintStyle: GoogleFonts.montserrat().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: 'C42D2D'.toColor())),
                  controller: email,
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Password',
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                child: TextField(
                  onChanged: (value) {
                    passwordString = value;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12, left: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      // suffixIcon: GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) {
                      //           return ForgotPasswordPage();
                      //         },
                      //       ),
                      //     );
                      //   },
                      //   child: Icon(Icons.sync_lock_outlined,
                      //       size: 18, color: 'C42D2D'.toColor()),
                      // ),
                      fillColor: Colors.red.shade50,
                      filled: true,
                      hintText: 'password',
                      hintStyle: GoogleFonts.montserrat().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: 'C42D2D'.toColor())),
                  obscureText: _obsecureText,
                  controller: password,
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Choose Avatar',
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              SizedBox(height: 20),
            ]),
          ),
          Container(
            child: SingleChildScrollView(
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
                    },
                  ),
                  SizedBox(width: 15),
                  avatar(
                    select: select[1],
                    isActiv: (selectedId == select[1].id) ? true : false,
                    onSelected: (value) {
                      setState(() {
                        selectedId = value;
                      });
                    },
                  ),
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
          ),
          SizedBox(height: 32),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('email, isEqualto: current.currentUser!.email')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                return Container(
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
                      Fluttertoast.showToast(
                          msg: "Done Update",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: email.text.trim());
                        snapshot.data!.docs[0].reference.update({
                          'password': password.text,
                        });
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }

                      // memanggil isi text field
                      setState(() {
                        namaString = nama.text;
                      });
                      snapshot.data!.docs[0].reference.update({
                        'nama': nama.text,
                        'tanggal': tanggal.text,
                        'email': email.text,
                        'password': password.text,
                        'selectedId': selectedId,
                      });
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
                        height: 45,
                        duration: const Duration(milliseconds: 100),
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: 'EB5C5C'.toColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('UPDATE DATA',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ]),
      ),
    );
  }
}

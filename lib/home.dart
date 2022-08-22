import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:auth/auth.dart';

import 'model.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController password = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  bool _obsecureText = true;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 'FFC14F'.toColor(),
      padding: EdgeInsets.only(top: 39),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              password.text = data['password'];
              return Column(children: [
                Text('MyHero App',
                    style: GoogleFonts.play().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.43,
                        color: 'C42D2D'.toColor())),
                SizedBox(height: 27),
                Container(
                  height: 70,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      Positioned(child: Image.asset('assets/Union.png')),
                      Container(
                        height: 40,
                        child: Positioned(
                            child: Image.asset(select
                                .firstWhere((e) => e.id! == data['selectedId']!)
                                .image!)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 11),
                Text(
                    select
                        .firstWhere((e) => e.id! == data["selectedId"]!)
                        .nama!,
                    //dari list select dicari dimanakah id select yang sama dengan id firebase
                    style: GoogleFonts.play().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.43,
                        color: 'C42D2D'.toColor())),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    Column(children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset('assets/attack.png'),
                      ),
                      SizedBox(height: 6),
                      Text('Attack',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text(
                          (select
                                      .firstWhere(
                                          (e) => e.id! == data['selectedId']!)
                                      .attack!
                                      .toString() ??
                                  '') +
                              ' / ' +
                              ('10'),
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black)),
                    ]),
                    SizedBox(width: 32),
                    Column(children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset('assets/defance.png'),
                      ),
                      SizedBox(height: 6),
                      Text('Defence',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(
                          (select
                                      .firstWhere(
                                          (e) => e.id! == data['selectedId']!)
                                      .defence
                                      .toString() ??
                                  '') +
                              ' / ' +
                              ('10'),
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black)),
                    ]),
                    SizedBox(width: 32),
                    Column(children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset('assets/speed.png'),
                      ),
                      SizedBox(height: 6),
                      Text('Speed',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(
                          (select
                                      .firstWhere(
                                          (e) => e.id! == data['selectedId']!)
                                      .speed
                                      .toString() ??
                                  '') +
                              ' / ' +
                              ('10'),
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12)),
                    ]),
                    SizedBox(width: 32),
                    Column(children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset('assets/special.png'),
                      ),
                      SizedBox(height: 6),
                      Text('Special',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(
                          (select
                                      .firstWhere(
                                          (e) => e.id! == data['selectedId']!)
                                      .spesial
                                      .toString() ??
                                  '') +
                              ' / ' +
                              ('10'),
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black)),
                    ]),
                  ]),
                ),
                SizedBox(height: 27),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Biodata:',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(children: [
                          Text('Nama:',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: '787878'.toColor())),
                          SizedBox(width: 142),
                          Text('Tanggal Lahir:',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: '787878'.toColor())),
                        ]),
                        SizedBox(height: 4),
                        Row(children: [
                          Container(
                            // color: Colors.red,
                            width: 140,
                            child: Text(data['nama'],
                                style: GoogleFonts.montserrat().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: '3E3E3E'.toColor())),
                          ),
                          SizedBox(width: 37),
                          Container(
                            // color: Colors.red,
                            width: 65,
                            child: Text(data['tanggal'],
                                style: GoogleFonts.montserrat().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: '3E3E3E'.toColor())),
                          ),
                        ]),
                        SizedBox(height: 20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // color: Colors.red,
                                width: 140,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Email:',
                                            style: GoogleFonts.montserrat()
                                                .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 10,
                                                    color: '787878'.toColor())),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        width: 150,
                                        height: 50,
                                        child: Text(data['email'],
                                            style: GoogleFonts.montserrat()
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: '3E3E3E'.toColor()),
                                            maxLines: 2),
                                      ),
                                    ]),
                              ),
                              SizedBox(width: 37),
                              Container(
                                // color: Colors.red,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Password:',
                                          style: GoogleFonts.montserrat()
                                              .copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 10,
                                                  color: '787878'.toColor())),
                                      SizedBox(height: 4),
                                      Container(
                                        width: 103,
                                        child: Container(
                                          height: 20,
                                          child: TextField(
                                            style: GoogleFonts.montserrat()
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.black),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obsecureText =
                                                        !_obsecureText;
                                                  });
                                                },
                                                child: Icon(
                                                    _obsecureText
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    size: 12),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.only(left: 1),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                            obscureText: _obsecureText,
                                            controller: password,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ]),
                      ]),
                    ),
                  ]),
                ),
              ]);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

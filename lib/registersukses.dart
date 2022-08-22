import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supercharged/supercharged.dart';

import 'login.dart';

class registersukses extends StatefulWidget {
  @override
  State<registersukses> createState() => _registersuksesState();
}

class _registersuksesState extends State<registersukses> {
  double _padding = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 20),
        child: Column(children: [
          Container(
            width: 300,
            height: 300,
            child: LottieBuilder.network(
                'https://assets5.lottiefiles.com/private_files/lf30_h8sr4qjf.json'),
          ),
          // SizedBox(height: 5),
          Text(
            'Register Success',
            style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.w300, fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 6),
          Text(
              'Congratulations you have registered in this app, let’s login to continue',
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: '717171'.toColor()),
              maxLines: 2,
              textAlign: TextAlign.center),
          SizedBox(height: 152),
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
              onTap: () {
                Get.to(login());
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
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: 'EB5C5C'.toColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('LANJUTKAN LOGIN',
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
    );
  }
}

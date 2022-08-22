import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heroapp/settings.dart';
import 'home.dart';

class navigation extends StatefulWidget {
  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int _selectedIndex = 0;
  PageController controller = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });

    controller.animateToPage(_selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email, isEqualto: current.currentUser!.email')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              return Container(
                height: 583.3,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      home(),
                      settings(
                        nama: data['nama'],
                        tanggal: data['tanggal'],
                        email: data['email'],
                        password: data['password'],
                      ),
                    ]),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Image.asset('assets/tent.png', scale: 1.5)),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Image.asset('assets/settings.png', scale: 1.5)),
          ],
        ),
      ]),
    );
  }
}

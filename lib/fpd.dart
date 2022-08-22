// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ForgotPasswordPage extends StatefulWidget {
//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }
//
// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   TextEditingController nama = TextEditingController();
//   TextEditingController tanggal = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   String namaString = '';
//   String tanggalString = '';
//   String emailString = '';
//   String passwordString = '';
//
//   @override
//   void dispose() {
//     email.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(left: 20, right: 20),
//         child: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               controller: email,
//               decoration: InputDecoration(),
//             ),
//             SizedBox(height: 20),
//             StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .where('email, isEqualto: current.currentUser!.email')
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasData) {
//                   var data = snapshot.data!.docs[0];
//                   return Container(
//                     alignment: Alignment.bottomCenter,
//                     height: 51,
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.only(left: 20, right: 20),
//                     child: ElevatedButton(
//                         onPressed: () async {
//                           try {
//                             await FirebaseAuth.instance.sendPasswordResetEmail(
//                                 email: email.text.trim());
//                             snapshot.data!.docs[0].reference.update({
//                               'password': password.text,
//                             });
//                           } on FirebaseAuthException catch (e) {
//                             print(e);
//                           }
//                           setState(() {
//                             namaString = nama.text;
//                           });
//                           snapshot.data!.docs[0].reference.update({
//                             'password': password.text,
//                           });
//
//                         },
//                         child: Text('Reset Password')),
//                   );
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               },
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

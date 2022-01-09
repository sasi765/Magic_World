// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:magic_world/Screens/main_screens/login_screens/signup.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   late String email;
//   late String adress;

//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage("assets/images/splash.png"),
//         fit: BoxFit.cover,
//       )),
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.black45,
//         body: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       alignment: Alignment.centerLeft,
//                       child: const Text("Magic World",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 36.0,
//                             fontWeight: FontWeight.bold,
//                           ))),
//                   const SizedBox(height: 25),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       bottom: 15,
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 15),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                         onChanged: (value) {
//                           email = value;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide: const BorderSide(color: Colors.teal)),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide:
//                                   const BorderSide(color: Colors.white)),
//                           prefixIcon: const Icon(
//                             Icons.email,
//                             color: Colors.white70,
//                           ),
//                           hintText: "Email",
//                           hintStyle: const TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         validator: (String? email) {
//                           if (email!.isEmpty) {
//                             return "Please Enter Email";
//                           }
//                           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                               .hasMatch(email)) {
//                             return "Please Enter valid Email";
//                           }
//                           return null;
//                         },
//                         onSaved: (String? email) {
//                           email = email;
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       bottom: 15,
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 15),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                         onChanged: (value) {
//                           adress = value;
//                         },
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white)),
//                             filled: true,
//                             prefixIcon: const Icon(Icons.location_city,
//                                 color: Colors.white70),
//                             hintText: "Password",
//                             hintStyle: const TextStyle(
//                               color: Colors.white,
//                             )),
//                         validator: (String? adress) {
//                           if (adress!.isEmpty) {
//                             return "Please Enter Password";
//                           }
//                           return null;
//                         },
//                         onSaved: (String? adress) {
//                           adress = adress;
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 15),
//                       child: ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
//                             primary: Colors.transparent,
//                             onPrimary: Colors.white,
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 side: const BorderSide(
//                                     color: Colors.white, width: 1))),
//                         onPressed: () {
//                           if (_formkey.currentState!.validate()) {
//                             ("success");
//                           } else {
//                             ("error");
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.send,
//                           color: Colors.white,
//                         ),
//                         label: const Text("Sende code"),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Text(
//                         "Don't have an account?",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const SignUp()));
//                           },
//                           child: const Text(
//                             "SignUp",
//                             style: TextStyle(
//                               color: Colors.redAccent,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15,
//                             ),
//                           ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

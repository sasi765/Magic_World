// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:magic_world/Screens/bottom_screens/home/home.dart';
// import 'package:magic_world/Screens/main_screens/login_screens/login_screen.dart';
// import 'package:magic_world/Screens/main_screens/splash.dart';

// import 'login_usermodel.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   late String smsCode;
//   late String verificationCode;
//   late String number;
//   late String email;
//   late String name;
//   late String password;
//   late String adress;
//   late String verId;
//   bool phoneCodeSent = false;
//   bool autoValidate = false;

//   bool isLoading = false;

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
//                           name = value;
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
//                             Icons.person,
//                             color: Colors.white70,
//                           ),
//                           hintText: "Name",
//                           hintStyle: const TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         validator: (String? name) {
//                           if (name!.isEmpty) {
//                             return "Please Enter name";
//                           }
//                           return null;
//                         },
//                         onSaved: (String? name) {
//                           name = name;
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
//                           password = value;
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
//                         validator: (String? password) {
//                           if (password!.isEmpty) {
//                             return "Please Enter Password";
//                           }
//                           return null;
//                         },
//                         onSaved: (String? password) {
//                           password = password;
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
//                         keyboardType: TextInputType.number,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                         onChanged: (value) {
//                           number = value;
//                         },
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide:
//                                     const BorderSide(color: Colors.white)),
//                             filled: true,
//                             prefixIcon:
//                                 const Icon(Icons.phone, color: Colors.white70),
//                             hintText: "Phone Number",
//                             hintStyle: const TextStyle(
//                               color: Colors.white,
//                             )),
//                         validator: (String? number) {
//                           if (number!.isEmpty) {
//                             return "Please Enter Phone Number";
//                           }
//                           if (number.length < 10) {
//                             return "Please Enter Valid Number";
//                           }
//                           return null;
//                         },
//                         onSaved: (String? number) {
//                           number = number;
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
//                             _submit();
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
//                                     builder: (context) => const Login()));
//                           },
//                           child: const Text(
//                             "login",
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

//   Future<void> _submit() async {
//     // ignore: prefer_function_declarations_over_variables
//     if (_formkey.currentState!.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//       setState(() {
//         autoValidate = false;
//       });
//       FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((user) {
//         // sign up
//         postUserDataToDb();
//       }).catchError((onError) {
//         setState(() {
//           isLoading = false;
//         });
//         Fluttertoast.showToast(msg: "error " + onError.toString());
//       });
//     } else {
//       setState(() {
//         autoValidate = true;
//       });
//     }
//   }

//   void sendVerificationEmail() async {
//     //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//     User? firebaseUser = FirebaseAuth.instance.currentUser;
//     await firebaseUser!.sendEmailVerification();

//     Fluttertoast.showToast(
//         msg: "email verifcation link has sent to your email.");

//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const Home()),
//         (Route<dynamic> route) => false);
//   }

//   void postUserDataToDb() async {
//     User? firebaseUser = FirebaseAuth.instance.currentUser;

//     UserModel userModel = UserModel(
//         adress: '',
//         mobileNumber: '',
//         email: '',
//         name: '',
//         uid: '',
//         timestamp: Timestamp.now());
//     userModel.name = name;
//     userModel.adress = adress;
//     userModel.email = email;
//     userModel.mobileNumber = number;
//     userModel.uid = firebaseUser!.uid;

//     await FirebaseFirestore.instance
//         .collection("user")
//         .doc(firebaseUser.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Register Success");
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const SplashScreen()),
//         (Route<dynamic> route) => false);
//   }
// }

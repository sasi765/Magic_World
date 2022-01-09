import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magic_world/Screens/main_screens/bottom_screen/bottom_screen.dart';
import 'package:magic_world/Screens/main_screens/login_screens/login_usermodel.dart';

import 'Trail/utils.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   String _email, _password, _name, _mobile;

  final _formkey = GlobalKey<FormState>();

  bool autoValidate = false;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/splash.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.centerLeft,
                        child: const Text("Magic World",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      validator: (item) {
                        return item.isNotEmpty ? null : "Enter valid Name";
                      },
                      onChanged: (item) {
                        setState(() {
                          _name = item;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        hintText: "Enter Name",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      maxLength: 10,
                      validator: (item) {
                        return item.length < 10 ? "Enter valid Mobile" : null;
                      },
                      onChanged: (item) {
                        setState(() {
                          _mobile = item;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        hintText: "Enter Mobile Number",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      validator: (item) {
                        return item.contains("@") ? null : "Enter valid Email";
                      },
                      onChanged: (item) {
                        setState(() {
                          _email = item;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        hintText: "Enter Email",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      validator: (item) {
                        return item.length > 6
                            ? null
                            : "Password must be 6 characters";
                      },
                      onChanged: (item) {
                        setState(() {
                          _password = item;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                            primary: Colors.transparent,
                            onPrimary: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.white, width: 1))),
                        onPressed: () {
                          signup();
                        },
                        child: const Text(
                          "Register",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              "login",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        autoValidate = false;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        postUserDataToDb();
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  void postUserDataToDb() async {
    setState(() {
      isLoading = true;
    });

    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    User firebaseUser = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel(
        adress: '',
        email: '',
        mobileNumber: '',
        name: '',
        timestamp: Timestamp.now(),
        uid: '');
    userModel.email = _email;
    userModel.name = _name;
    userModel.mobileNumber = _mobile;
    userModel.uid = firebaseUser.uid;

    // await FireStore.instance
    //     .collection("user")
    //     .document(firebaseUser.uid)
    //     .setData(userModel.toMap());

    await FirebaseFirestore.instance
        .collection("user")
        .doc(firebaseUser.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Register Success");

    await FirebaseUtils.updateFirebaseToken();

    sendVerificationEmail();

    setState(() {
      isLoading = false;
    });
  }

  void sendVerificationEmail() async {
    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    User firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser.sendEmailVerification();

    Fluttertoast.showToast(
        msg: "email verifcation link has sent to your email.");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const BottomScreen()),
        (Route<dynamic> route) => false);
  }
}

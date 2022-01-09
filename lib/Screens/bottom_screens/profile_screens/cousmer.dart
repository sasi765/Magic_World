import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoustmerCare extends StatefulWidget {
  @override
  _CoustmerCareState createState() => _CoustmerCareState();
}

class _CoustmerCareState extends State<CoustmerCare> {
  String number;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController name = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: <Widget>[
        Container(
          height: 160,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 25),
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {}),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0, right: 110, bottom: 25),
                child: Text(
                  'Coustmer Care',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Redressed",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 400),
        Container(
          height: 800.0,
          padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: "Enter Name",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        controller: phonenumber,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        onChanged: (val) {
                          number = val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: "Phone number",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter Phone number";
                          }
                          if (value.length < 10) {
                            return "Please Enter valid Number";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        right: 10,
                        left: 10,
                      ),
                      child: TextFormField(
                        controller: message,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon: const Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            hintText: " Please Enter Message",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(30.0, 30.0, 0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        maxLines: 10,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter Message";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 150,
                        right: 10,
                        left: 10,
                      ),
                      child: ButtonTheme(
                        height: 50,
                        child: OutlineButton.icon(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              Map<String, dynamic> data = {
                                "Name": name.text,
                                "Phonenumber": phonenumber.text,
                                "Message": message.text
                              };
                              FirebaseFirestore.instance
                                  .collection("Coustmer Care")
                                  .add(data);
                              Fluttertoast.showToast(
                                      msg: "Posted successfully.")
                                  .then((_) => _formkey.currentState.reset());
                            }
                          },
                          highlightElevation: 20.0,
                          hoverColor: Colors.black,
                          color: Colors.black,
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          label: Text("Send Request"),
                          textColor: Colors.white,
                          splashColor: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

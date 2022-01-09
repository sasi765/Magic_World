import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Form extends StatefulWidget {
  const Form({ Key key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
   String name, mobile, pincode, state, city, houseno, area, password;

  final Color wtColor = Colors.white;

  final _formkey = GlobalKey<FormState>();

  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Add delivery address"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 25,
            color: wtColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            iconSize: 25,
            color: wtColor,
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                validator: (item) {
                  return item.isNotEmpty ? null : "Please Enter Name";
                },
                onChanged: (item) {
                  setState(() {
                    name = item;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Full Name(Required)*",
                  hintStyle: TextStyle(
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
                  return item.length < 10 ? "Enter valid Number" : null;
                },
                onChanged: (item) {
                  setState(() {
                    mobile = item;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.teal)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Phone Number(Required)*",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "+ Add Alternative Phone Number",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      maxLength: 6,
                      validator: (item) {
                        return item.length < 6
                            ? "Enter valid Pin Code"
                            : null;
                      },
                      onChanged: (item) {
                        setState(() {
                          pincode = item;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "PinCode (Required)*",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xff1B7BC5),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.gps_fixed_rounded,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Use my location",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      validator: (item) {
                        return item.isNotEmpty
                            ? null
                            : "Please Enter State";
                      },
                      onChanged: (item) {
                        setState(() {
                          state = item;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "State (Required)*",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      validator: (item) {
                        return item.isNotEmpty
                            ? null
                            : "Please Enter City";
                      },
                      onChanged: (item) {
                        setState(() {
                          city = item;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "City (Required)*",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                validator: (item) {
                  return item.isNotEmpty
                      ? null
                      : "Please Enter House No:";
                },
                onChanged: (item) {
                  setState(() {
                    houseno = item;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "House No.,Building Name(Required)*",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                validator: (item) {
                  return item.isNotEmpty
                      ? null
                      : "Please Enter Road name,Area,Colony";
                },
                onChanged: (item) {
                  setState(() {
                    area = item;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Road name, Area, Colony(Required)*",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "+ Add  Nearby Famous Shop/Mall/Landmark",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Type of address",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(80, 25, 80, 15),
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                        color: Colors.white,
                      ))),
                  onPressed: () {
                    _formkey.currentState.validate();
                  },
                  child: const Text(
                    "Check Out",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

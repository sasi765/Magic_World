import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import 'package:magic_world/Screens/main_screens/login_screens/login_usermodel.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckRazor extends StatefulWidget {
  final MovieEntity movie;

  CheckRazor({Key key,  this.movie});

  @override
  _CheckRazorState createState() => _CheckRazorState();
}

class _CheckRazorState extends State<CheckRazor> {
  Razorpay _razorpay = Razorpay();
  String price = "100";
  var options;
  Future payData() async {
    try {
      _razorpay.open(options);
    } catch (e) {
      print("errror occured here is ......................./:$e");
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("payment has succedded");

    final CollectionReference profile =
        FirebaseFirestore.instance.collection("user");

    profile.doc(FirebaseAuth.instance.currentUser?.uid).update({
      "Buy": FieldValue.arrayUnion([widget.movie.key])
    });

    _razorpay.clear();
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("payment has error");
    // Do something when payment fails

    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("payment has externalWallet");

    _razorpay.clear();
    // Do something when an external wallet is selected
  }

  @override
  void initState() {
    super.initState();

    options = {
      'key':
          "rzp_test_sRaqCi9nfSLxkb", // Enter the Key ID generated from the Dashboard

      'amount': widget.movie.price * 100, //in the smallest currency sub-unit.
      'name': widget.movie.title,

      'currency': "INR",
      'theme.color': "#F37254",
      'buttontext': "Pay with Razorpay",
      'description': 'RazorPay example',
      'prefill': {
        'contact': '9123456789',
        'email': 'gaurav.kumar@example.com',
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    // print("razor runtime --------: ${_razorpay.runtimeType}");
    return Scaffold(
      body: FutureBuilder(
          future: payData(),
          builder: (context, snapshot) {
            return Container(
              child: Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

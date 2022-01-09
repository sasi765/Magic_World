import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_world/Screens/json.files/image_entity.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import 'package:magic_world/Screens/razorpay_screens/razorpay.dart';
import 'package:magic_world/Screens/viideo.screens/video_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Color _color = Colors.white;

class DetailScreen extends StatefulWidget {
  final MovieEntity movie;
  final String title;

  const DetailScreen({Key key,  this.movie,  this.title});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = ScrollController();

  double appBarHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25, color: _color),
        ),
        backgroundColor: Colors.black,
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: appBarHeight,
            floating: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(children: <Widget>[
                  FadeInImage.assetNetwork(
                    image: widget.movie.image,
                    placeholder: "assets/images/placeholder.png",
                    height: double.infinity,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.movie.title,
                            style: TextStyle(
                                fontSize: 26,
                                color: _color,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ]);
              },
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 5, bottom: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 35),
                  Wrap(
                    children: <Widget>[
                      Text(
                        widget.movie.title,
                        style: TextStyle(
                            fontSize: 26,
                            color: _color,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildDescription(
                    widget.movie.text1,
                  ),
                  const SizedBox(height: 20),
                  _buildDescription(
                    widget.movie.text2,
                  ),
                  _buildTitle("Instructions"),
                  const SizedBox(height: 20),
                  _buildDescription(
                    widget.movie.text3,
                  ),
                  const SizedBox(height: 20),
                  _buildDescription(
                    widget.movie.text4,
                  ),
                  const SizedBox(height: 20),
                  _buildDescription(widget.movie.text4),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shadowColor: Colors.red,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  color: Colors.white, width: 1))),
                      onPressed: () async {
                        DocumentSnapshot documentSnapshot = await FirebaseFirestore
                            .instance
                            .collection("user")
                            // .where("Buy",arrayContainsAny: ["Sai","sasiZZZZZZ"])
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .get();

                        Map<String, dynamic> map = documentSnapshot.data();
                        List list = (map["Buy"] as List);
                        List listRes = list
                            .where((element) => element == widget.movie.key)
                            .toList();
                        if (listRes != null && listRes.length > 0) {
                          print("im here");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoGrid(
                                        movie: widget.movie,
                                      )));
                        } else {
                          print("im nots here");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CheckRazor(movie: widget.movie)));
                        }
                        print("mapmap " + map.toString());
                      },
                      icon: Icon(Icons.send, color: _color),
                      label: const Text("Buy Now"),
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  _buildTitle(String text) {
    return Wrap(
      children: <Widget>[
        Text(text,
            style: TextStyle(
                color: _color, fontStyle: FontStyle.italic, fontSize: 20))
      ],
    );
  }

  _buildDescription(String text) {
    return Wrap(
      children: <Widget>[
        Text(text,
            style: TextStyle(
                color: _color, fontStyle: FontStyle.italic, fontSize: 18))
      ],
    );
  }
}

import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/admin_panel.dart/admin_home.dart';
import 'package:magic_world/Screens/bottom_screens/profile_screens/cousmer.dart';
import 'package:magic_world/Screens/main_screens/login_screens/sign.dart';

class ProfileDisplay extends StatefulWidget {
  const ProfileDisplay({Key key}) : super(key: key);

  @override
  _ProfileDisplayState createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  //Circular Image

  //Center Widget
  Center profilePage(
      String profileName, String jobDescription, String webLink) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 350,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white38,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  Text(
                    profileName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 44.0),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 70.0,
                ),
                child: Text(
                  jobDescription,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0, bottom: 100),
                child: Column(
                  children: [
                    Text(
                      webLink,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Admin()));
                        },
                        child: const Text(
                          "Admin Panel",
                          style: TextStyle(fontSize: 40),
                        )),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: OutlineButton(
                      child: Row(
                        children: [
                          const Text('Coustmer Care',
                              style: TextStyle(color: Colors.black)),
                          const Icon(Icons.help)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CoustmerCare()),
                        );
                      },
                      highlightElevation: 20.0,
                      hoverColor: Colors.black,
                      color: Colors.black,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: OutlineButton(
                        child: Row(
                          children: [
                            Text('logout',
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.exit_to_app_outlined)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alert'),
                              content: const Text(
                                'Are you want to logout',
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                ),
                                FlatButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      FirebaseAuth.instance
                                          .signOut()
                                          .then((onvalue) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    RegistrationScreen()));
                                      });
                                    }),
                              ],
                            ),
                          );
                        },
                        highlightElevation: 20.0,
                        hoverColor: Colors.black,
                        color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(
                          bottom: 150, top: 40, left: 15, right: 15),
                      child: const ProfileImageWidget()),
                  profilePage("Alex4James4Sasi4Prak",
                      "Sasiprakashelle@gmail.com", "Andhra Pradesh,Rajamundry"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({Key key}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
   ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controllerCenter,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: true,
      colors: const [
        Colors.red,
        Colors.redAccent,
        Colors.black,
        Colors.green,
        Colors.white,
        Colors.yellow,
        Colors.pink
      ],
      child: GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/mashmello.jpg")))),
        onDoubleTap: () {
          _controllerCenter.play();
        },
      ),
    );
  }
}

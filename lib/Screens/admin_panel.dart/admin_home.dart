import 'package:flutter/material.dart';
import 'package:magic_world/Screens/admin_panel.dart/insert_form.dart';
import 'package:magic_world/Screens/admin_panel.dart/notifications_screens/notification.dart';
import 'package:magic_world/Screens/admin_panel.dart/users/users.dart';

class Admin extends StatefulWidget {
  const Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final TextStyle xstyle = const TextStyle(fontSize: 20, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Amin Panal"),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          children: <Widget>[
            grid(
                text: "Amin",
                onTouch: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Insert()));
                }),
            grid(text: "Movies", onTouch: () {}),
            grid(text: "Flutter", onTouch: () {}),
            grid(text: "Payment Details", onTouch: () {}),
            grid(
                text: "Notifications",
                onTouch: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Notifications()));
                }),
            grid(
                text: "Users",
                onTouch: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Users()));
                }),
          ],
        ));
  }

  Widget grid({
    String text,
    void Function() onTouch,
  }) {
    return GestureDetector(
      onTap: onTouch,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
            child: Text(
          text,
          style: xstyle,
        )),
        color: Colors.teal[600],
      ),
    );
  }
}

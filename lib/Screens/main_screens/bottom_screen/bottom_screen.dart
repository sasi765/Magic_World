import 'package:flutter/material.dart';
import 'package:magic_world/Screens/bottom_screens/home/home.dart';
import 'package:magic_world/Screens/bottom_screens/profile_screens/profile.dart';
import 'package:magic_world/Screens/bottom_screens/store/store.dart';

import 'bottomfield.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key key}) : super(key: key);

  @override
  _BottomScrenState createState() => _BottomScrenState();
}

class _BottomScrenState extends State<BottomScreen> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        Home(),
        StoreHome(),
        StoreHome(),
        ProfileDisplay(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index]["icon"],
                      color: activeTab == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      size: 27,
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

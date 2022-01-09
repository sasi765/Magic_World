import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magic_world/Screens/admin_panel.dart/users/collectionreference.dart';
import 'package:magic_world/Screens/bottom_screens/profile_screens/cousmer.dart';
import 'package:magic_world/Screens/main_screens/login_screens/login_usermodel.dart';
import 'package:magic_world/Screens/models/notification_model.dart';
import 'package:magic_world/Screens/models/user_model.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Notifications extends StatefulWidget {
  NotificationModel usermodel = NotificationModel(null);
  // Notifications({
  //   Key key,
  // }) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController key = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController typemovie = TextEditingController();
  TextEditingController videos = TextEditingController();
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  bool loading = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: notificationCollectionReference.get().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return NoData(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  if (snapshot.data.docs.isEmpty) {
                    return NoData("No data found".trim());
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      NotificationModel notification =
                          NotificationModel(snapshot.data.docs[index].data());
                      // check
                      //  OrderModel myOrderModel =
                      // OrderModel(snapshot.data.docs[index].data());
                      return Card(
                        child: ListTile(
                          title: Text(notification.name),
                          subtitle: Text(notification.message),
                          trailing: Text(notification.phonenumber),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
        floatingActionButton: Visibility(
          child: FloatingActionButton(
            onPressed: showSheet,
            child: const Icon(Icons.add),
          ),
        ));
  }

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
            color: Colors.red,
            cornerRadius: 16,
            avoidStatusBar: false,
            snapSpec: const SnapSpec(
              snappings: [double.infinity],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: buildSheet,
            headerBuilder: buildHeader,
          ));
  Widget buildSheet(context, state) => Material(
        color: Colors.black,
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: title,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: price,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Price",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: key,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Key",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: image,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Image",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: typemovie,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "TypeMovie",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: videos,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Videos",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: text1,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "text1",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: text2,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "text2",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: text3,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "text3",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: text4,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "text4",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Full Name(Required)*",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        addProduct().then((_) => _formkey.currentState.reset());
                      }
                    },
                    child: const Text("Close")),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context, SheetState state) => Material(
          child: Container(
        height: 25,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text(
          'This is the header',
        ),
      ));

  addProduct() async {
    try {
      widget.usermodel ??= NotificationModel(null);
      widget.usermodel.name = phonenumber.text;
      widget.usermodel.message = message.text;
      widget.usermodel.phonenumber = key.text;

      DocumentReference documentReference =
          notificationCollectionReference.doc();

      await documentReference.set(widget.usermodel.toMap());
      loading = false;
      setState(() {});
      Fluttertoast.showToast(msg: "Product added successfully.");
      Navigator.pop(context);
    } catch (e) {
      loading = false;
      setState(() {});
      Fluttertoast.showToast(msg: "Product adding failed " + e.toString());
      print(e.toString());
    }
  }
}

class NoData extends StatelessWidget {
  final String text;
  const NoData(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.headline5?.copyWith(color: Colors.red),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/main_screens/login_screens/login_usermodel.dart';
import 'package:magic_world/Screens/models/user_model.dart';

import 'collectionreference.dart';

class Users extends StatefulWidget {
  const Users({Key key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("users"),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: usersCollectionReference
                  .orderBy("timestamp", descending: true)
                  .get()
                  .asStream(),
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
                      UsersModel userModel =
                          UsersModel(snapshot.data.docs[index].data());
                      // check
                      //  OrderModel myOrderModel =
                      // OrderModel(snapshot.data.docs[index].data());
                      return Card(
                        child: ListTile(
                          title: Text(userModel.name),
                          subtitle: Text(userModel.email),
                          trailing: Text(userModel.mobileNumber),
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
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ));
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

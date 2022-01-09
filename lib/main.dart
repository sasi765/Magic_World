import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/admin_panel.dart/admin_home.dart';
import 'package:magic_world/Screens/main_screens/splash.dart';
import 'Screens/services/movie_service.dart';
import 'Screens/services/moviie_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => MovieBloc(MovieService())),
        ],
        dependencies: [],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Magic World",
          theme: ThemeData(primaryColor: Colors.red),
          home: const SplashScreen(),
        ));
  }
}

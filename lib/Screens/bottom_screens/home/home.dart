import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_world/Screens/bottom_screens/home/vertical_screen.dart';
import 'package:magic_world/Screens/services/moviie_bloc.dart';

import 'card.dart';
import 'carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Carousel(
            title: "Ethical Hacking",
            listMovieFlux: _movieBloc.listMoviesFlux,
          ),
          VerticalScreen(
              title: "Cyber Forensic",
              listMovieFlux: _movieBloc.listMoviesPopularFlux),
          Carousel(
              listMovieFlux: _movieBloc.listMoviesMyListFlux,
              title: "Cyber Digital"),
          VerticalScreen(
              listMovieFlux: _movieBloc.listMoviesTrendingFlux,
              title: "Trending Now"),
          VerticalScreen(
              listMovieFlux: _movieBloc.listMoviesCardFlux, title: "Popular"),
          CardScreen(
            title: 'Hacking',
            listMovieFlux: _movieBloc.listMoviesTrendingFlux,
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({Key key})
      : super(key: key, 
          backgroundColor: Colors.black,
          title: const Text(
            "Magic World",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 25,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notification_add,
              ),
              iconSize: 25,
              color: Colors.white,
            )
          ],
        );
}

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/bottom_screens/home/home.dart';
import 'package:magic_world/Screens/bottom_screens/store/data_grid.dart';
import 'package:magic_world/Screens/services/moviie_bloc.dart';

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: ListView(
        children: <Widget>[
          StoreGridScreen(
              title: 'Ethical Hacking',
              listMovieFlux: _movieBloc.listMoviesFlux),
          StoreGridScreen(
              title: 'My List', listMovieFlux: _movieBloc.listMoviesMyListFlux),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          StoreGridScreen(
              title: 'Trending Now',
              listMovieFlux: _movieBloc.listMoviesTrendingFlux),
          StoreGridScreen(
              title: 'Popular',
              listMovieFlux: _movieBloc.listMoviesPopularFlux),
          StoreGridScreen(
              title: 'Highlights',
              listMovieFlux: _movieBloc.listMoviesCardFlux),
        ],
      ),
    );
  }

  getApp() => AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "Ethical Hacking",
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          onPressed: () => {},
          icon: const Icon(
            Icons.home,
            color: Colors.white,
            size: 25.0,
          ),
          iconSize: 30.0,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 30.0),
            onPressed: () => {},
            icon: const Icon(Icons.notifications),
            iconSize: 25.0,
            color: Colors.white,
          ),
        ],
      );
}

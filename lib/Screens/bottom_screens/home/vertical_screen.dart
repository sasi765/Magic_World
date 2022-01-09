import 'package:flutter/material.dart';
import 'package:magic_world/Screens/detail.screens/detail_screen.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';

import '../data_store.dart';

class VerticalScreen extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;
  final String title;
  const VerticalScreen({ this.listMovieFlux,  this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataStore(
                                  listMovieFlux: listMovieFlux,
                                  title: title,
                                )));
                  },
                  child: const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 25.0))
            ],
          ),
        ),
        SizedBox(
            height: 230.0,
            child: StreamBuilder(
                initialData: const <MovieEntity>[],
                stream: listMovieFlux,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                      height: 1,
                      width: 1,
                    );
                  }
                  List<MovieEntity> movies = snapshot.data;
                  return listView(movies);
                }))
      ]),
    );
  }

  listView(List<MovieEntity> movies) => ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailScreen(
                              movie: movies[index], title: title,
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/placeholder.png",
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: movies[index].image),
              ),
            ));
      });
}

import 'package:flutter/material.dart';
import 'package:magic_world/Screens/detail.screens/detail_screen.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';

class DataStore extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;
  final String title;
  const DataStore({Key key,  this.listMovieFlux,  this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Column(children: <Widget>[
        StreamBuilder(
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
            })
      ]),
    );
  }

  listView(List<MovieEntity> movies) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3.0,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                movie: movies[index],
                                title: title,
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
              );
            }),
      );
}

import 'package:flutter/material.dart';
import 'package:magic_world/Screens/detail.screens/detail_screen.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';

class StoreGridScreen extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;

  final String title;

  const StoreGridScreen({ this.listMovieFlux,  this.title})
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        StreamBuilder(
            initialData: <MovieEntity>[],
            stream: listMovieFlux,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return showError(snapshot.error.toString());
              }
              if (!snapshot.hasData) return Container(height: 1, width: 1);

              List<MovieEntity> movies = snapshot.data;
              return listView(movies);
            }),
      ],
    );
  }

  listView(List<MovieEntity> movies) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3.0,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailScreen(
                          movie: movies[index],
                          title: title,
                        )),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.png',
                  height: 190.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: movies[index].image,
                ),
              ),
            );
          },
        ),
      );
}

Widget showError(message) {
  return Center(
    child: Text(message),
  );
}

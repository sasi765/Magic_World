import 'package:flutter/material.dart';
import 'package:magic_world/Screens/detail.screens/detail_screen.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';

import '../data_store.dart';

class CardScreen extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;
  final String title;
  CardScreen({
    Key key,
     this.title,
     this.listMovieFlux,
  }) : super(key: key);

  final PageController _pageController = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataStore(
                                  listMovieFlux: listMovieFlux, title: title)));
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25.0,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
              height: 250.0,
              width: double.infinity,
              child: StreamBuilder(
                  initialData: const <MovieEntity>[],
                  stream: listMovieFlux,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) {
                    if (!snapshot.hasData) {
                      return const SizedBox(
                        height: 1,
                        width: 1,
                      );
                    }
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _itemHeadMovie(
                            snapshot.data[index], context, index);
                      },
                    );
                  })),
        ],
      ),
    );
  }

  _itemHeadMovie(MovieEntity movie, BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext contex, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 450.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailScreen(
                        movie: movie,
                        title: title,
                      )));
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/placeholder.png",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: movie.image,
                  )),
            ),
            Positioned(
                left: 30.0,
                bottom: 40.0,
                child: Align(
                    child: SizedBox(
                        width: 250.0,
                        child: Text(movie.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)))))
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magic_world/Screens/detail.screens/detail_screen.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import '../data_store.dart';

class Carousel extends StatefulWidget {
  final Stream<List<MovieEntity>> listMovieFlux;
  final String title;
  const Carousel({
    Key key,
     this.listMovieFlux,
     this.title,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataStore(
                                    listMovieFlux: widget.listMovieFlux,
                                    title: widget.title,
                                  )));
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25.0,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 230.0,
            child: StreamBuilder(
              initialData: const <MovieEntity>[],
              stream: widget.listMovieFlux,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(height: 1, width: 1);
                }
                List<MovieEntity> movies = snapshot.data;
                return listView(movies);
              },
            ),
          ),
        ],
      ),
    );
  }

  listView(List<MovieEntity> movies) => CarouselSlider.builder(
        options: CarouselOptions(
          height: 180,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, index, int a) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailScreen(
                            movie: movies[index],
                            title: widget.title,
                          )));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: movies[index].image,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          );
        },
      );
}

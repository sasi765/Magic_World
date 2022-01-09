import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import 'package:magic_world/Screens/viideo.screens/time_ine.dart';
import 'package:magic_world/Screens/viideo.screens/video_player.dart';

Color color = Colors.white;

class VideoGrid extends StatefulWidget {
  final MovieEntity movie;
  VideoGrid({Key key,  this.movie});
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<VideoGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: <Widget>[
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height),
                crossAxisSpacing: 20,
                mainAxisSpacing: 1,
              ),
              itemCount: widget.movie.screenShots.length,
              itemBuilder: (_, index) {
                ("yes");
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(children: [
                        Stack(
                          children: <Widget>[
                            FadeInImage.assetNetwork(
                                placeholder: "assets/images/placeholder.png",
                                height: 120,
                                width: 250,
                                fit: BoxFit.cover,
                                image: widget.movie.screenShots[index].image),
                            Positioned.fill(
                                bottom: 30.0,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RawMaterialButton(
                                    padding: const EdgeInsets.all(8.0),
                                    elevation: 5.0,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayerScreen(
                                                      videoData: widget
                                                          .movie
                                                          .screenShots[index]
                                                          .video)));
                                    },
                                    shape: const CircleBorder(),
                                    fillColor: Colors.white,
                                    child: const Icon(Icons.play_arrow,
                                        size: 30.0, color: Colors.red),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.all(10).copyWith(bottom: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.movie.screenShots[index].title,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(8),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TimeLineScreen(
                                                movie: widget.movie,
                                              )));
                                },
                                icon: const Icon(Icons.arrow_forward_rounded),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ));
              }),
        ],
      ),
    );
  }
}

class Lock extends StatelessWidget {
  const Lock({Key key,  VideoGrid widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.lock),
          color: Colors.white,
          iconSize: 200,
        ),
      ),
    );
  }
}

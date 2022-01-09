import 'package:flutter/material.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import 'package:timelines/timelines.dart';

class TimeLineScreen extends StatefulWidget {
  final MovieEntity movie;

  const TimeLineScreen({Key key,  this.movie});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.movie.title),
      ),
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Card(
            color: Colors.lightBlueAccent,
            elevation: 20,
            shadowColor: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                widget.movie.screenShots[index].title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          itemCount: widget.movie.screenShots.length,
        ),
      ),
    );
  }
}

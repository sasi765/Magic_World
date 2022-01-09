import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  const VideoScreen(
      { this.videoPlayerController,  this.loop, Key key})
      : super(key: key);
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
   ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      allowPlaybackSpeedChanging: true,
      autoPlay: true,
      fullScreenByDefault: true,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoData;
  const VideoPlayerScreen({ this.videoData});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: VideoScreen(
            videoPlayerController:
                VideoPlayerController.network(widget.videoData),
            loop: true,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


// Stateful widget to fetch and then display video content.
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/TikTok_recording.MP4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause()
            : _controller.play();
        });
        },
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(),
          ),
        ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

import 'package:bdb_challenge/src/core/models/hotels_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants/constants.dart';

class HotelVideo extends StatefulWidget {
  final Hotel hotel;

  const HotelVideo({Key? key, required this.hotel}) : super(key: key);

  @override
  State<HotelVideo> createState() => _HotelVideoState();
}

class _HotelVideoState extends State<HotelVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.hotel.url)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(Keys.videoKey),
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Center(
        child: _controller.value.isInitialized
            ? Stack(
          children: [
            Positioned.fill(
              // aspectRatio: _controller.value.aspectRatio / ,
              child: VideoPlayer(
                _controller,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                widget.hotel.name,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400.withOpacity(0.4)),
                child: IconButton(
                    iconSize: 17,
                    icon: _controller.value.volume == 0.0
                        ? const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                    )
                        : const Icon(
                      Icons.volume_up_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      _controller.value.volume == 0.0
                          ? setState(() {
                        _controller.setVolume(100.0);
                      })
                          : setState(() {
                        _controller.setVolume(0.0);
                      });
                    }),
              ),
            )
          ],
        )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

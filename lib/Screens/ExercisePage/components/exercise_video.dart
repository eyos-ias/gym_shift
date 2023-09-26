import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  VideoPlayerWidget({required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown and set state
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = _controller.value.isPlaying;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        GestureDetector(
          onTap: () {
            if (_isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          },
        ),
        if (!_isPlaying)
          GestureDetector(
            onTap: () {
              _controller.play();
            },
            child: const CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.play_arrow,
                size: 40.0,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

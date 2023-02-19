import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:video_player/video_player.dart';

class RCVideoPlayerScreen extends StatefulWidget {
  const RCVideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _RCVideoPlayerScreenState createState() => _RCVideoPlayerScreenState();
}

class _RCVideoPlayerScreenState extends State<RCVideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    setOrientationLandscape();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    setOrientationPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: context.width() / context.height(),
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                  top: context.statusBarHeight + 20,
                  left: 20,
                  child: RCBackComponent(color: Colors.white, borderColor: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.white,
                    size: 70,
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

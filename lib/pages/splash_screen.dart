import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// this video for splash screen will not work on iOS emulators. works fine on physical devices.

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
    startTimer();
  }

  void startTimer() async {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/SignUp');
    });
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(Images.splashAnim);
    await _videoPlayerController!.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      showControls: false,
      autoInitialize: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styling.mainYellow,
      body: Center(
        child: Container(
          child: (_chewieController == null)
              ? const SizedBox()
              : Chewie(
                  controller: _chewieController!,
                ),
        ),
      ),
    );
  }
}

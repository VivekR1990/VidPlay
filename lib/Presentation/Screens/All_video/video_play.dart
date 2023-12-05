import 'package:flutter/material.dart';

class VideoPlay extends StatelessWidget {
  const VideoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Video title'),
      ),
    );
  }
}

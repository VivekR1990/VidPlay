import 'package:flutter/material.dart';
import 'package:video_vid_play/Presentation/bottom_tab_bar.dart';
import 'package:video_vid_play/funtions/fetch_video_paths.dart';

class SplashScreenLoader extends StatefulWidget {
  const SplashScreenLoader({Key? key}) : super(key: key);

  @override
  State<SplashScreenLoader> createState() => _SplashScreenLoaderState();
}

class _SplashScreenLoaderState extends State<SplashScreenLoader> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadVideosAndNavigate();
  }

  Future<void> loadVideosAndNavigate() async {
    await FetchVideos.getVideos(); 
    setState(() {
      _isLoading = false;
    });
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    if (!_isLoading) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomTabBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
          child: Text(
            'VidPlay',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

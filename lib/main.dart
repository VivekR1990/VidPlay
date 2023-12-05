import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_vid_play/Database/recenlly_played_videos.dart';
import 'package:video_vid_play/Presentation/Screens/splash_screen_loader.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RecentlyPlayedDataAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VidPlay',
      debugShowCheckedModeBanner: false,
      home: SplashScreenLoader(),
    );
  }
}

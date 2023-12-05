import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_vid_play/Database/recenlly_played_videos.dart';

class RecentlyPlayedVideosPage extends StatefulWidget {
  const RecentlyPlayedVideosPage({Key? key}) : super(key: key);

  @override
  State<RecentlyPlayedVideosPage> createState() =>
      _RecentlyPlayedVideosPageState();
}

class _RecentlyPlayedVideosPageState extends State<RecentlyPlayedVideosPage> {
  List<RecentlyPlayedData> recentlyPlayedVideos = [];
  List<File> files = [];
  // // void loadRecentlyPlayedVideos() async {
  // //   recentlyPlayedVideos = RecentlyPlayed.getRecentlyPlayedVideos();
  // //   setState(() {});
  // // }

  // @override
  // // void initState() {
  // //   loadRecentlyPlayedVideos();
  // //   super.initState();
  // // }

  // // void getfiles() {
  // //   files = recentlyPlayedVideos.map((e) => File(e.videoPath)).toList();
  // // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            )),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
                child: Text(
              'Recent Videos',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            )),
          ),
        ],
      ),
    );
  }
}

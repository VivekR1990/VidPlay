import 'package:flutter/material.dart';
import 'package:video_vid_play/Presentation/Screens/Playlist/recently_played_page.dart';
import 'package:video_vid_play/widgets/playlist_menu.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  void initState() {
    // Add your initialization logic here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: const [PopupMenuButtonPlaylist()],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100, bottom: 90),
            child: Center(
              child: Text(
                'Playlist',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RecentlyPlayedVideosPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Recently Played Videos',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                // Add more InkWell widgets for other playlist items
              ],
            ),
          ),
        ],
      ),
    );
  }
}

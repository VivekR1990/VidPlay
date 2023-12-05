import 'package:flutter/material.dart';
import 'package:list_all_videos/list_all_videos.dart';
import 'package:video_vid_play/Presentation/Screens/All_video/search.dart';
import 'package:video_vid_play/widgets/video_menu.dart';
import 'package:video_vid_play/widgets/video_options.dart';
import 'video_play.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  ),
              icon: const Icon(Icons.search, color: Colors.black, size: 25)),

          const PopupMenuVideoOption(),
         
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100, bottom: 100),
            child: Text(
              'Videos',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ListAllVideos().getAllVideos(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          VideoDetails currentVideo = snapshot.data![index];
                          return ListTile(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const VideoPlay(),
                            )),
                            title: Text(currentVideo.videoName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            subtitle: Text(currentVideo.videoSize,
                            style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            leading: const Icon(Icons.video_file_rounded,
                                color: Colors.black, size: 25),
                            trailing: const PopupMenuButtonVideo(),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: snapshot.data!.length,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_vid_play/Presentation/Screens/All_video/video_play.dart';
import 'package:video_vid_play/widgets/folder_options.dart';
import 'package:video_vid_play/widgets/video_menu.dart';

class FolderVideos extends StatelessWidget {
  final Set<String> videoName;

  const FolderVideos({
    super.key,
    required this.videoName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: const [PopupMenuFolderOption()],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            child: ListView.builder(
              itemCount: videoName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VideoPlay(),
                  )),
                  title: Text(videoName.elementAt(index),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  leading: const Icon(Icons.video_file_rounded,
                      color: Colors.black, size: 25),
                  trailing: const PopupMenuButtonVideo(),
                );
              },
            ),
          )
        ]));
  }
}

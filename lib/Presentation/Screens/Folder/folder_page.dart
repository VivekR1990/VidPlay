import 'package:flutter/material.dart';
import 'package:list_all_videos/list_all_videos.dart';
import 'package:video_vid_play/funtions/fetch_directories.dart';
import 'package:video_vid_play/funtions/fetch_video_paths.dart';
import 'package:video_vid_play/widgets/video_menu.dart';
import 'package:video_vid_play/widgets/folder_options.dart';

import 'folder_videos.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  late List<String> directories = []; // Stores directory paths
  final DirectoryFetcher directoryFetcher = DirectoryFetcher();
  List<String> videoPaths = [];

  @override
  void initState() {
    // Initialize directories when the page is loaded
    super.initState();
    fetchDirectories();
    fetchVideoPaths();
  }

  Future<void> fetchDirectories() async {
    try {
      List<String> fetchedDirectories =
          await directoryFetcher.getAllDirectories();
      setState(() {
        directories = fetchedDirectories;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching directories: $e');
    }
  }

  Future<void> fetchVideoPaths() async {
    try {
      final fetchedDirectories = await FetchVideos.getVideos();

      for (VideoDetails data in fetchedDirectories) {
        videoPaths.add(data.videoName);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching directories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: const [PopupMenuFolderOption()]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100, bottom: 100),
            child: Center(
              child: Text(
                'Folders',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: directories.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      String currentDirectory = directories[index];
                      return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FolderVideos(
                                videoName: videoPaths.toSet(),
                              ),
                            ));
                          },
                          title: Text(currentDirectory.split('/').last,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.black)), 
                          leading: const Icon(
                            Icons.folder,
                            color: Colors.black,
                            size: 25,
                          ),
                          trailing: const PopupMenuButtonVideo());
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: directories.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}

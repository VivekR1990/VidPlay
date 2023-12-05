import 'package:flutter/material.dart';
import 'package:list_all_videos/list_all_videos.dart';
import 'package:video_vid_play/widgets/video_menu.dart';
import 'package:video_vid_play/widgets/video_options.dart';
import 'video_play.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<VideoDetails>> _allVideos;
  List<VideoDetails> _filteredVideos = [];

  @override
  void initState() {
    super.initState();
    _allVideos = ListAllVideos().getAllVideos();
  }

  void _filterVideos(String searchText) {
    _allVideos.then((videos) {
      setState(() {
        _filteredVideos = videos
            .where((video) =>
                video.videoName.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
        ),
        title: TextField(
          onChanged: _filterVideos,
          decoration: const InputDecoration(
            hintText: 'Search videos...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          PopupMenuVideoOption(),
        ],
      ),
      body: _buildVideoList(),
    );
  }

  Widget _buildVideoList() {
    return FutureBuilder<List<VideoDetails>>(
      future: _allVideos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && _filteredVideos.isEmpty) {
          return const Center(child: Text('No matching videos'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: _filteredVideos.length,
            itemBuilder: (context, index) {
              VideoDetails currentVideo = _filteredVideos[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VideoPlay(),
                  ));
                },
                title: Text(
                  currentVideo.videoName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  currentVideo.videoSize,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: const Icon(
                  Icons.video_file_rounded,
                  color: Colors.black,
                  size: 25,
                ),
                trailing: const PopupMenuButtonVideo(),
              );
            },
          );
        } else {
          return const Center(child: Text('No videos available'));
        }
      },
    );
  }
}

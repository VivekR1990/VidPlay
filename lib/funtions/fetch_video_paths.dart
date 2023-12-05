import 'package:list_all_videos/list_all_videos.dart';

class FetchVideos {
  static Future<List<VideoDetails>> getVideos() async {
    ListAllVideos object = ListAllVideos();
    //lists all videos in the device
    List<VideoDetails> videos = await object.getAllVideos();
    return videos;
  }
}

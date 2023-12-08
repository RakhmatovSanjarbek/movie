import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String movieName;
  final String movieDiscretion;

  const YouTubePlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.movieName,
    required this.movieDiscretion,
  }) : super(key: key);

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;
  String _selectedQuality = 'auto'; // Default video quality

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _changeVideoQuality(String quality) {
    setState(() {
      _selectedQuality = quality;
      double currentPosition = _controller.value.position.inSeconds.toDouble();
      _controller.load(_controller.initialVideoId,
          startAt: currentPosition.toInt());
    });
  }

  Future<void> _saveVideoToGallery() async {
    final videoId = _controller.initialVideoId;
    if (videoId != null) {
      final videoUrl = 'https://www.youtube.com/watch?v=$videoId';
      final result = await GallerySaver.saveVideo(videoUrl);
      print(
          result); // Print the result to indicate if the video was saved successfully
    }
  }

  void _launchVideoUrl() async {
    final videoId = _controller.initialVideoId;
    if (videoId != null) {
      final videoUrl = 'https://www.youtube.com/watch?v=$videoId';

      final telegramUrl =
          'https://t.me/share/url?url=${Uri.encodeFull(videoUrl)}';
      if (await canLaunch(telegramUrl)) {
        await launch(telegramUrl);
      } else {
        throw 'Telegram ilovasini ochishda xatolik yuz berdi';
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   backgroundColor: const Color(0xff0509d3),
      //   actions: [],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0,),
          Expanded(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              topActions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      initialValue: _selectedQuality,
                      onSelected: _changeVideoQuality,
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'auto',
                          child: Text('Auto'),
                        ),
                        const PopupMenuItem(
                          value: '144',
                          child: Text('144p'),
                        ),
                        const PopupMenuItem(
                          value: '240',
                          child: Text('240p'),
                        ),
                        const PopupMenuItem(
                          value: '360',
                          child: Text('360p'),
                        ),
                        const PopupMenuItem(
                          value: '480',
                          child: Text('480p'),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      onPressed: _saveVideoToGallery,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      onPressed: _launchVideoUrl,
                    ),
                  ],
                )
              ],
              progressColors: const ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
            ),
          ),
          SizedBox(height: 16.0,),
          // Container(
          //   margin: const EdgeInsets.all(16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         widget.movieName,
          //         style: const TextStyle(
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Text(
          //         widget.movieDiscretion,
          //         style: const TextStyle(
          //           color: Color(0xff9b9ea9),
          //           fontSize: 14.0,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerWidget extends StatelessWidget {
  final String videoId;
  const WatchTrailerWidget({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trailer"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: YoutubePlayer(
            controlsTimeOut: const Duration(seconds: 1),
            controller: controller,
            showVideoProgressIndicator: false,
          ),
        ),
      ),
    );
  }
}

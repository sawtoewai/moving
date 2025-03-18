import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Trailerwatch extends StatefulWidget {
    var trailerid;
    Trailerwatch(this.trailerid);
  
    @override
    State<Trailerwatch> createState() => _TrailerwatchState();
  }
  
  class _TrailerwatchState extends State<Trailerwatch> {
    late YoutubePlayerController _controller;

    @override
    void initState(){
      final videoid = YoutubePlayer.convertUrlToId(widget.trailerid);
    _controller = YoutubePlayerController(
      initialVideoId: videoid.toString(),
      flags: YoutubePlayerFlags(
        enableCaption: true,
        autoPlay: false,
        mute: false,
        // controlsVisibleAtStart: true,
        forceHD: true,
      ),
    );
  }



    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: YoutubePlayer(
          thumbnail: Image.network(
            "https://img.youtube.com/vi/" + widget.trailerid + "/hqdefault.jpg",
          fit: BoxFit.cover,
          ),
          controlsTimeOut: Duration(milliseconds: 1500),
          aspectRatio: 16 / 9,
          controller: _controller,
          showVideoProgressIndicator: true,
          bufferIndicator: const Center(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              )),
          ),
          progressIndicatorColor: Colors.amber,
          bottomActions: [
            CurrentPosition(),
              ProgressBar(
                isExpanded: true,
              colors: ProgressBarColors(
                playedColor: Colors.white,
                handleColor: Colors.amber,
              )),
            RemainingDuration(),
            FullScreenButton(),
          ],
        ),
      );
    }
  }
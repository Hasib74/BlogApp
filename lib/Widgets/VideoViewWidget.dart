import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/Widgets/LargeDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class VideoViewWidget extends StatefulWidget {
  final String videoUrl;
  bool leftTopPadding;

  bool rightTopPadding;

  bool leftBottomPadding;

  bool rightBottomPadding;

  VideoViewWidget(
      {this.videoUrl,
      this.rightBottomPadding = false,
      this.rightTopPadding = false,
      this.leftTopPadding = false,
      this.leftBottomPadding = false});

  @override
  _VideoViewWidgetState createState() => _VideoViewWidgetState();
}

class _VideoViewWidgetState extends State<VideoViewWidget>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController _controller;

  List<String> video_list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    video_list.add(widget.videoUrl);

    _controller = VideoPlayerController.network('${widget.videoUrl}')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      }).catchError((err) => print("Error  is ${err}"));
  }

  @override
  Widget build(BuildContext context) {
    return view_video();
  }

  Widget view_video() {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            //  bottomLeft: Radius.circular(25),
            bottomLeft: widget.leftBottomPadding
                ? Radius.circular(25)
                : Radius.circular(0),
            topLeft: widget.leftTopPadding
                ? Radius.circular(25)
                : Radius.circular(0),
            topRight: widget.rightTopPadding
                ? Radius.circular(25)
                : Radius.circular(0),
            bottomRight: widget.rightBottomPadding
                ? Radius.circular(25)
                : Radius.circular(0)),
        child: Stack(
          children: [
            VideoPlayer(_controller),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(VideoViewOverlay(video_url: video_list));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.Primary_Lite.withOpacity(0.7)),
                  child: Icon(
                    Icons.play_circle_outline_sharp,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

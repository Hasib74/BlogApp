import 'package:blog_app/Widgets/AnimatedVideoPlayerWidget/AnimationPayerDataManager.dart';
import 'package:blog_app/Widgets/AnimatedVideoPlayerWidget/AnimationPlayerLandscapeControls.dart';
import 'package:blog_app/Widgets/AnimatedVideoPlayerWidget/AnimationPlayerPortraitVideoControls.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimationPlayer extends StatefulWidget {
  final List<String> video_url_list;

  AnimationPlayer({Key key, this.video_url_list}) : super(key: key);

  @override
  _AnimationPlayerState createState() => _AnimationPlayerState();
}

class _AnimationPlayerState extends State<AnimationPlayer> {
  FlickManager flickManager;
  AnimationPlayerDataManager dataManager;
  List items;
  bool _pauseOnTap = true;

  @override
  void initState() {
    super.initState();

    items = widget.video_url_list;

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(items[0]),
      //onVideoEnd: () => ,
    );

    dataManager = AnimationPlayerDataManager(flickManager, items);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager.autoResume();
        }
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: AnimationPlayerPortraitVideoControls(
                      dataManager: dataManager, pauseOnTap: _pauseOnTap),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    controls: AnimationPlayerLandscapeControls(
                      animationPlayerDataManager: dataManager,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            /* RaisedButton(
              child: Text('Next video'),
              onPressed: () => dataManager.playNextVideo(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('On tap action -- '),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _pauseOnTap = true;
                          });
                        },
                        child: Text('Pause')),
                    Switch(
                      value: !_pauseOnTap,
                      onChanged: (value) {
                        setState(() {
                          _pauseOnTap = !value;
                        });
                      },
                      activeColor: Colors.red,
                      inactiveThumbColor: Colors.blue,
                      inactiveTrackColor: Colors.blue[200],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pauseOnTap = false;
                        });
                      },
                      child: Text(
                        'Mute',
                      ),
                    )
                  ],
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}

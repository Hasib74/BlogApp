import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class AnimationPlayerDataManager {
  bool inAnimation = false;
  final FlickManager flickManager;
  final List items;
  int currentIndex = 0;
  Timer videoChangeTimer;

  AnimationPlayerDataManager(this.flickManager, this.items);

  playNextVideo([Duration duration]) {
    if (currentIndex >= items.length - 1) {
      currentIndex = -1;
    }

    String nextVideoUrl = items[currentIndex + 1];

    if (currentIndex != items.length - 1) {
      if (duration != null) {
        videoChangeTimer = Timer(duration, () {
          currentIndex++;
        });
      } else {
        currentIndex++;
      }

      flickManager.handleChangeVideo(
          VideoPlayerController.network(nextVideoUrl),
          videoChangeDuration: duration, timerCancelCallback: (bool playNext) {
        videoChangeTimer.cancel();
        if (playNext) {
          currentIndex++;
        }
      });
    }
  }

  String getCurrentVideoTitle() {
    if (currentIndex != -1) {
      return items[currentIndex];
    } else {
      return items[items.length - 1];
    }
  }

  String getNextVideoTitle() {
    if (currentIndex != items.length - 1) {
      return items[currentIndex + 1];
    } else {
      return items[0];
    }
  }

  String getCurrentPoster() {
    if (currentIndex != -1) {
      return items[currentIndex];
    } else {
      return items[items.length - 1];
    }
  }
}

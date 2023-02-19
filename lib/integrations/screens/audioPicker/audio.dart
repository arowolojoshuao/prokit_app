import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioManager {
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);
  late AudioPlayer player;

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  AudioManager({required this.player}) {
    init(player);
  }

  void init(AudioPlayer player) async {
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.loading || playerState.processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!playerState.playing) {
        buttonNotifier.value = ButtonState.paused;
      } else if (playerState.processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        player.seek(Duration.zero);
        player.pause();
      }
    });

    player.positionStream.listen((position) {
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: progressNotifier.value.buffered,
        total: progressNotifier.value.total,
      );
    });

    player.durationStream.listen((totalDuration) {
      progressNotifier.value = ProgressBarState(
        current: progressNotifier.value.current,
        buffered: progressNotifier.value.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }
}

class ProgressBarState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  ProgressBarState({required this.current, required this.buffered, required this.total});
}

enum ButtonState { paused, playing, loading }

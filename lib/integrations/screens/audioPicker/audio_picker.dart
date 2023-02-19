import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/audioPicker/audio.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class AudioPickerScreen extends StatefulWidget {
  static String tag = '/AudioPickerScreen';

  @override
  AudioPickerScreenState createState() => AudioPickerScreenState();
}

class AudioPickerScreenState extends State<AudioPickerScreen> {
  late final AudioManager audioManager;
  late final AudioPlayer player;

  PickedFile? pickAudio;
  List<String> playList = [];

  bool hasLoop = false;
  bool hasShuffle = false;
  int currAudioIndex = 0;

  @override
  void initState() {
    player = AudioPlayer();
    audioManager = AudioManager(player: player);
    super.initState();
  }

  Future getAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.audio);

    if (result != null) {
      final ConcatenatingAudioSource playlist = ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: [for (String? audioPath in result.paths.validate()) AudioSource.uri(Uri.parse(audioPath.validate()))],
      );

      playList.clear();
      for (String? audioPath in result.paths.validate()) playList.add(audioPath.validate());

      player.playbackEventStream.listen(onError: onError, (event) {
        currAudioIndex = event.currentIndex.validate();
        setState(() {});
      });

      await player.setAudioSource(playlist, initialIndex: currAudioIndex, initialPosition: Duration.zero);
      setState(() {});
    } else {
      toast('Something gone wrong');
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Audio Picker"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Audio Name:  \n${(playList.isNotEmpty) ? playList[currAudioIndex].split('/').last : ''}", style: primaryTextStyle(size: 18)),
                  8.width,
                ],
              ).paddingAll(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Audio Path:  \n${(playList.isNotEmpty) ? playList[currAudioIndex] : ''}", style: primaryTextStyle(size: 18)).expand(), 8.width],
              ).paddingAll(16),
              if (playList.isNotEmpty)
                Column(
                  children: [
                    ValueListenableBuilder<ProgressBarState>(
                      valueListenable: audioManager.progressNotifier,
                      builder: (_, value, __) {
                        return Column(
                          children: [
                            Slider(
                              min: 0,
                              max: value.total.inSeconds.toDouble(),
                              value: value.current.inSeconds.toDouble(),
                              onChanged: (e) {
                                player.seek(Duration(seconds: e.toInt()));
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${(value.total - value.current).toString().substring(2, 7)}"),
                                Text("${(value.total).toString().substring(2, 7)}"),
                              ],
                            ).paddingOnly(left: 32, right: 32),
                          ],
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            showSliderDialog(
                              context: context,
                              title: "Adjust volume",
                              divisions: 10,
                              min: 0.0,
                              max: 1.0,
                              value: player.volume,
                              stream: player.volumeStream,
                              onChanged: player.setVolume,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_previous_rounded),
                          iconSize: 32.0,
                          onPressed: () {
                            if (hasLoop) {
                              toast('disable');
                            } else {
                              player.seekToPrevious().then((value) {
                                currAudioIndex = player.currentIndex.validate();
                                setState(() {});
                              });
                            }
                          },
                        ),
                        ValueListenableBuilder<ButtonState>(
                          valueListenable: audioManager.buttonNotifier,
                          builder: (_, value, __) {
                            switch (value) {
                              case ButtonState.loading:
                                return CircularProgressIndicator();
                              case ButtonState.paused:
                                return IconButton(icon: Icon(Icons.play_arrow), iconSize: 32.0, onPressed: player.play);
                              case ButtonState.playing:
                                return IconButton(icon: Icon(Icons.pause), iconSize: 32.0, onPressed: player.pause);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next_rounded),
                          iconSize: 32.0,
                          onPressed: () {
                            if (hasLoop) {
                              toast('disable');
                            } else {
                              player.seekToNext().then((value) {
                                currAudioIndex = player.currentIndex.validate();
                                setState(() {});
                              });
                              setState(() {});
                            }
                          },
                        ),
                        StreamBuilder<double>(
                          stream: player.speedStream,
                          builder: (context, snapshot) {
                            return IconButton(
                              icon: Text("${snapshot.data?.toStringAsFixed(1)}x", style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () {
                                showSliderDialog(
                                  context: context,
                                  title: "Adjust speed",
                                  divisions: 10,
                                  min: 0.5,
                                  max: 1.5,
                                  value: player.speed,
                                  stream: player.speedStream,
                                  onChanged: player.setSpeed,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shuffle, color: (hasShuffle) ? Colors.blueAccent : Colors.black),
                          onPressed: () async {
                            await player.setShuffleModeEnabled(hasShuffle);
                            hasShuffle = !hasShuffle;
                            setState(() {});
                          },
                        ),
                        Text('PlayList'),
                        IconButton(
                          icon: Icon(Icons.loop_rounded, color: (hasLoop) ? Colors.blueAccent : Colors.black),
                          onPressed: () {
                            (!hasLoop) ? player.setLoopMode(LoopMode.one) : player.setLoopMode(LoopMode.all);
                            hasLoop = !hasLoop;
                            setState(() {});
                          },
                        ),
                      ],
                    ).paddingOnly(left: 16, right: 16),
                    Container(
                      height: context.height() / 5,
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(border: Border.all(color: Colors.blueAccent)),
                      child: ListView.builder(
                        itemCount: playList.length,
                        itemBuilder: (context, index) {
                          if (index == player.currentIndex) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_circle_right, color: Colors.blueAccent),
                                8.width,
                                Text(playList[index].split('/').last),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                32.width,
                                Text(playList[index].split('/').last),
                              ],
                            );
                          }
                        },
                      ),
                    ).paddingAll(16),
                  ],
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: appColorPrimary),
                child: Text("Pick Audio", style: boldTextStyle(size: 18, color: Colors.white)),
                onPressed: () async {
                  await getAudio();
                },
              ),
            ],
          ).center(),
        ),
      ),
    );
  }
}

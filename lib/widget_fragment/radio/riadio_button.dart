import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add this for audio playback
import 'package:islameapp/theming/my_them_data.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  AudioPlayer audioPlayer = AudioPlayer(); // Create an AudioPlayer instance
  bool isPlaying = false;
  final String soundURL = 'https://Qurango.net/radio/alzain_mohammad_ahmad';

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release audio resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          isPlaying = !isPlaying;
        });

        if (isPlaying) {
          // Handle errors during playback
          await audioPlayer.play(DeviceFileSource('https://Qurango.net/radio/alzain_mohammad_ahmad'))
              .catchError((error) {
            // Display an error message or handle it appropriately
            print('Error playing audio: $error');
          });
        } else {
          await audioPlayer.pause();
        }
      },
      child: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        size: 50.0,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150.0, 80.0),
        backgroundColor: ThemData.primryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:islameapp/theming/my_them_data.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class PlayButton extends StatefulWidget {
//   const PlayButton({Key? key}) : super(key: key);
//
//   @override
//   State<PlayButton> createState() => _PlayButtonState();
// }
//
// class _PlayButtonState extends State<PlayButton> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   bool isPlaying = false; // Track the button state (playing or paused)
//   final String soundURL ='https://Qurango.net/radio/alzain_mohammad_ahmad'; // Radio URL
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         setState(() {
//           isPlaying = !isPlaying; // Toggle the state on button press
//         });
//         if(isPlaying){
//           if(!await canLaunch(soundURL)){
//             await launch(soundURL);
//
//         }else{
//             throw'cant run URL';
//           }
//         }
//       },
//       child: Icon(
//         isPlaying ? Icons.pause : Icons.play_arrow, // Choose icon based on state
//         size: 50.0,
//         color: Colors.white,
//       ),
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(150.0, 80.0),
//         backgroundColor: ThemData.primryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(60.0),
//         ),
//       ),
//     );
//   }
// }

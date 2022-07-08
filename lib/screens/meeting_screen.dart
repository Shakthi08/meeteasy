import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meeteasy/resources/jitsi_meet_methods.dart';
import 'package:meeteasy/utils/colors.dart';
import 'package:meeteasy/widgets/homeMeetingButton.dart';
import 'dart:math';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();

    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: creatNewMeeting,
              text: 'New meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Join meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Schedule meeting',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Share screen',
              icon: Icons.arrow_upward_rounded,
            )
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create or join a meeting',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

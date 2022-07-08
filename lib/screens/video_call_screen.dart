import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meeteasy/resources/auth_methods.dart';
import 'package:meeteasy/resources/jitsi_meet_methods.dart';
import 'package:meeteasy/utils/colors.dart';
import 'package:meeteasy/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final AuthMethods _authMethods = AuthMethods();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethod.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            title: const Text(
              "Join a meeting",
              style: TextStyle(fontSize: 18),
            )),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Room number",
                  // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Display name",
                  // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: _joinMeeting,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MeetingOption(
              text: 'Connect to audio ',
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
            MeetingOption(
              text: 'Turn off my video',
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            )
          ],
        ));
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}

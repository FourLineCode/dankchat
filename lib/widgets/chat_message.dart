import 'package:dankchat/services/twitch_message.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final TwitchMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        child: RichText(
          text: TextSpan(
              text: '${message.user.displayName}: ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: message.user.userColor),
              children: <TextSpan>[
                TextSpan(
                    text: message.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14))
              ]),
        ));
  }
}

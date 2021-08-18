import 'package:dankchat/services/twitch_user.dart';

class TwitchMessage {
  String text;
  String channel;
  TwitchUser user;

  TwitchMessage(
      {required this.text, required this.user, required this.channel});
}

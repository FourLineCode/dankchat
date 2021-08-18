import 'package:dankchat/services/twitch_user.dart';

class TwitchMessage {
  final String text;
  final String channel;
  final TwitchUser user;

  TwitchMessage(
      {required this.text, required this.user, required this.channel});
}

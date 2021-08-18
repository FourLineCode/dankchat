// ignore: import_of_legacy_library_into_null_safe
import 'package:dankchat/services/twitch_message.dart';
import 'package:dankchat/services/twitch_user.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmi/tmi.dart' as tmi;

class TwitchService {
  TwitchService();

  static tmi.Client connect({required String channel}) {
    final client = tmi.Client(channels: channel, secure: true);
    client.connect();

    return client;
  }

  static TwitchMessage parseMessage(
      String channel, String message, Map userstate) {
    Color color;
    try {
      color = HexColor(userstate['color']);
    } catch (e) {
      color = Colors.grey;
    }

    TwitchUser user = TwitchUser(
        username: userstate['username'],
        displayName: userstate['display-name'],
        userId: userstate['user-id'],
        userColor: color,
        moderator: userstate['mod'],
        subscriber: userstate['subscriber']);
    return TwitchMessage(text: message, user: user, channel: channel);
  }
}

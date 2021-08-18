import 'package:flutter/rendering.dart';

class TwitchUser {
  final String username;
  final String displayName;
  final String userId;
  final Color userColor;
  bool moderator = false;
  bool subscriber = false;

  TwitchUser(
      {required this.username,
      required this.displayName,
      required this.userId,
      required this.userColor,
      moderator,
      subscriber}) {
    this.moderator = moderator ?? this.moderator;
    this.subscriber = subscriber ?? this.subscriber;
  }
}

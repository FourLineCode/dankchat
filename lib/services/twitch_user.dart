class TwitchUser {
  String username;
  String displayName;
  String userId;
  String userColor;
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

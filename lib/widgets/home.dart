import 'package:dankchat/services/twitch_message.dart';
import 'package:dankchat/services/twitch_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TwitchMessage> _messages = [];

  @override
  void initState() {
    super.initState();

    TwitchService ts = TwitchService();
    var client = ts.connect(channel: 'sodapoppin');

    client.on("message", (channel, userstate, message, self) {
      TwitchMessage msg =
          TwitchService.parseMessage(channel, message, userstate);

      setState(() {
        _messages.add(msg);

        if (_messages.length > 100) {
          _messages.removeAt(0);
        }
        print(_messages.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DankChat',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Twitch Chat Client',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

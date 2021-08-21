import 'package:dankchat/services/twitch_message.dart';
import 'package:dankchat/services/twitch_service.dart';
import 'package:dankchat/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _maxMessageCount = 200;
  final List<TwitchMessage> _messages = [];
  final GlobalKey _messagesKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final client = TwitchService.connect(channel: 'lilypichu');

    client.on("message", (channel, userstate, message, self) {
      TwitchMessage msg =
          TwitchService.parseMessage(channel, message, userstate);

      setState(() {
        _messages.add(msg);

        if (_messages.length > _maxMessageCount) {
          _messages.removeAt(0);
        }
      });

      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
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
            backgroundColor: Colors.black54),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4.0),
          decoration: const BoxDecoration(color: Colors.black87),
          width: double.infinity,
          height: double.infinity,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: ListView.builder(
                      itemCount: _messages.length,
                      key: _messagesKey,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        final message = _messages[index];
                        return ChatMessage(message: message);
                      }),
                ),
              ),
              TextField(
                controller: _textInputController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Send a message",
                    hintStyle: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ));
  }
}

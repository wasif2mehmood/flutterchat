import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chatapp/chat_window.dart';


class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> messages = [];
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void sendMessage() async{
    if (_controller.text.isEmpty) return;
    setState(() {
      messages.add(
        Message(
          text: _controller.text,
          // if sender is user, then message appear on rigth side if other then on left side
          sender: "user",
        ),
      );
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Your text box and other input widgets
                  TextField(
                    controller: _controller,
                    onSubmitted: (value) => sendMessage(),
                    decoration: InputDecoration(
                      hintText: "Enter your message",
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                  ),

                  // Add other input widgets here if needed
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
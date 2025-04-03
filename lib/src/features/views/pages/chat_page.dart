import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];
  bool isSender = true;

  void chat() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
        messageController.clear();
      });
    }

    if (messages.last.toLowerCase() == "hai" && isSender) {
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          messages.add("ya");
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.amber,
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    isSender = messages[index] == "ya";
                    return Align(
                      alignment:
                          !isSender ? Alignment.topRight : Alignment.topLeft,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          messages[index].trim(),
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        cursorHeight: 6,
                        cursorWidth: 1,
                        // onSubmitted: chat,
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusColor: Colors.transparent,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(2),
                        ),
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: chat,
                    child: Icon(Icons.send, size: 12),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

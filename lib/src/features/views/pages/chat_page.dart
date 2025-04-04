import 'package:f_smartwatch/src/shared/components/circle_profile.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          ///APPBAR
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.topLeft,
            color: black1,
            child: Row(
              children: [
                CircleProfile(
                  width: 17,
                  height: 17,
                  child: Center(
                    child: Icon(Icons.person, size: 8, color: black1),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.topLeft,
                      color: Colors.transparent,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          isSender = messages[index] == "ya";
                          return Column(
                            crossAxisAlignment:
                                !isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                              CircleProfile(
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                child: Icon(Icons.person, size: 8),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 2,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black1.withAlpha(20),
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                      spreadRadius: 0.22,
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  messages[index].trim(),
                                  style: TextStyle(fontSize: 7),
                                ),
                              ),
                            ],
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
                              border: Border.all(width: 0.5, color: black1),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent,
                            ),
                            child: TextField(
                              cursorColor: black1,
                              cursorHeight: 6,
                              cursorWidth: 1,
                              controller: messageController,
                              decoration: InputDecoration(
                                hintText: "Chat..",
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
                          child: Icon(Icons.send, size: 12, color: black1),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

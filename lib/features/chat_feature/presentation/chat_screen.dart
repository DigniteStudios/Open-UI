

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/text_theme_extension.dart';
import '../../../shared/widgets/chat_bubble.dart';
import '../data/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message = TextEditingController();
  ScrollController scroll = ScrollController();

  List<Message> messages = [
    Message(
      createdAt: DateTime.now(),
      msg: "Hello",
      uid: 1.toString()
    ),
    Message(
        createdAt: DateTime.now(),
        msg: "Hy!!",
        uid: 0.toString()
    ),
  ];

  Future<void> handleSubmit() async {
    if (message.text.isNotEmpty) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
              ),
              const SizedBox.square(dimension: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Name",
                    style: context.titleMedium?.copyWith(height: 1),
                  ),
                    Text(
                      "Online",
                      style: context.labelSmall?.copyWith(
                        color: Colors.green,
                      ),
                    )
                ],
              ),
              const SizedBox.square(dimension: 10),
            ],
          ),
        ),
      ),
      body: GroupedListView<Message, DateTime?>(
        controller: scroll,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        elements: messages,
        groupBy: (element) {
          if (element.createdAt != null) {
            DateTime d = element.createdAt!;
            return DateTime(d.year, d.month, d.day);
          } else {
            DateTime.now();
          }
          return null;
        },
        itemComparator: (item1, item2) {
          if (item1.createdAt == null || item2.createdAt == null) {
            return 1;
          }
          return item1.createdAt!.compareTo(item2.createdAt!);
        },
        floatingHeader: true, // optional
        order: GroupedListOrder.DESC,
        padding:
        const EdgeInsets.symmetric(vertical: 20).copyWith(bottom: 80),
        groupSeparatorBuilder: (DateTime? groupByValue) {
          if (groupByValue == null) {
            return const SizedBox.shrink();
          }
          DateTime now = DateTime.now();
          DateTime twentyFourHoursAgo = now.subtract(const Duration(days: 1));

          String t = groupByValue.isAfter(twentyFourHoursAgo)
              ? 'Today'
              : DateFormat.yMMMEd().format(groupByValue);
          return Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                    // color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5)),
                padding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(t)),
          );
        },
        separator: const SizedBox.square(dimension: 10,),
        itemBuilder: (context, Message element) {
          return ChatBubble(
            text: element.msg ?? "",
            bottomText: element.createdAt != null
                ? DateFormat.jmv().format(element.createdAt!)
                : "",
            isSender: element.uid == "0",
            textStyle: context.bodyMedium!,
            tail: true,
          );
        }, // optional
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            TextField(
                controller: message,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                // maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                  floatingLabelBehavior: null,
                  isDense: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  hintText: "Type your message",
                  hintStyle:
                  context.bodySmall?.copyWith(color: const Color(0xFFA2A2A2)),
                  // filled: true,
                  // fillColor: Colors.white,
                  // prefixIcon: const SizedBox.shrink(),
                  suffixIcon: const SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                )),
            // Positioned(
            //   bottom: 0,
            //   child: IconButton(
            //     onPressed: () => null,
            //     alignment: Alignment.bottomCenter,
            //     icon: const Icon(CupertinoIcons.paperclip),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: handleSubmit,
                icon: const Icon(CupertinoIcons.paperplane_fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

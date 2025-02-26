import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String text;
  final String bottomText;
  final bool tail;
  final Color color;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const ChatBubble({
    super.key,
    this.isSender = true,
    this.constraints,
    required this.text,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ), required this.bottomText,
  });

  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        child: Container(
          constraints: constraints ??
              BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .7,
              ),
          margin: isSender
              ? stateTick
              ? const EdgeInsets.fromLTRB(7, 7, 14, 7)
              : const EdgeInsets.fromLTRB(18, 7, 15, 7)
              : const EdgeInsets.fromLTRB(15, 7, 18, 7),
          child: Column(
            crossAxisAlignment: isSender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: isSender
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(15)
                ),
                padding: stateTick
                    ? const EdgeInsets.only(right: 20)
                    : const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      text,
                      style: textStyle.copyWith(
                        color: isSender ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    // Gap(25),
                  ],
                ),
              ),
              const SizedBox.square(dimension: 5,),
              Text(
                bottomText,
                style: context.bodySmall?.copyWith(
                    color: const Color(0xFF666666)
                ),
                textAlign: TextAlign.right,
              ),
              // stateIcon != null && stateTick
              //     ? Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: stateIcon,
              // )
              //     : SizedBox(
              //   width: 1,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
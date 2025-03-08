import 'package:flutter/material.dart';

class ChatBotIcon extends StatelessWidget {
  final double size;
  final Color color;

  ChatBotIcon({this.size = 30.0, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Handle chatbot tap
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Image.asset(
                'lib/assets/images/chatBotIcon.png', // Path to your PNG file
                width: size,
                height: size,
                color: color,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

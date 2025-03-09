import 'dart:math';

import 'package:flutter/material.dart';
import '../screens/mainChat.dart'; // Import the ChatScreen

class ChatBotIcon extends StatefulWidget {
  final double size;
  final Color color;

  ChatBotIcon({this.size = 30.0, this.color = Colors.white});

  @override
  _ChatBotIconState createState() => _ChatBotIconState();
}

class _ChatBotIconState extends State<ChatBotIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to chat screen when animation completes
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChatScreen(accessToken: 'your_access_token_here'),
          ),
        ).then((_) {
          // Reset animation when returning from chat screen
          _animationController.reset();
          setState(() {
            _isPressed = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _isPressed = true;
          });
          _animationController.forward();
        },
        onLongPressUp: () {
          if (!_animationController.isCompleted) {
            setState(() {
              _isPressed = false;
            });
            _animationController.reverse();
          }
        },
        onTap: () {
          // Simple tap still navigates directly
          if (!_isPressed) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        ChatScreen(accessToken: 'your_access_token_here'),
              ),
            );
          }
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
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return _isPressed ? _buildShatteringEffect(child) : child!;
                },
                child: Image.asset(
                  'lib/assets/images/chatBotIcon.png',
                  width: widget.size,
                  height: widget.size,
                  color: widget.color,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShatteringEffect(Widget? child) {
    return Stack(
      children: List.generate(8, (index) {
        final angle = index * 45.0 * (3.14159 / 180); // Convert to radians
        final distance = _animationController.value * 20.0;

        return Positioned(
          left: distance * 0.5 * (index % 2 == 0 ? -1 : 1) * cos(angle),
          top: distance * 0.5 * (index % 2 == 0 ? -1 : 1) * sin(angle),
          child: Opacity(
            opacity: 1.0 - _animationController.value,
            child: Transform.scale(
              scale: 1.0 - (_animationController.value * 0.5),
              child: Transform.rotate(
                angle: _animationController.value * angle,
                child: ClipPath(
                  clipper: ShatterClipper(
                    index: index,
                    pieces: 8,
                    progress: _animationController.value,
                  ),
                  child: SizedBox(
                    width: widget.size,
                    height: widget.size,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ShatterClipper extends CustomClipper<Path> {
  final int index;
  final int pieces;
  final double progress;

  ShatterClipper({
    required this.index,
    required this.pieces,
    required this.progress,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Calculate angles for this piece
    final startAngle = (index / pieces) * 2 * 3.14159;
    final endAngle = ((index + 1) / pieces) * 2 * 3.14159;

    // Add center point
    path.moveTo(centerX, centerY);

    // Add first edge point
    path.lineTo(
      centerX + size.width * 0.5 * cos(startAngle),
      centerY + size.height * 0.5 * sin(startAngle),
    );

    // Add arc
    final radius = size.width * 0.5;
    path.arcTo(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      endAngle - startAngle,
      false,
    );

    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

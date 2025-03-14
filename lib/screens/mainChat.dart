// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'menu.dart';
// import '../widgets/theme_notifier.dart';

// // Helper function to adjust opacity.
// Color adjustOpacity(Color? color, double opacity) {
//   final baseColor = color ?? Colors.transparent;
//   return Color.fromRGBO(
//     baseColor.red,
//     baseColor.green,
//     baseColor.blue,
//     opacity,
//   );
// }

// class ChatScreen extends StatefulWidget {
//   final String accessToken; // Access token passed from login

//   const ChatScreen({super.key, required this.accessToken});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;

//   final String _baseUrl = 'https://game-parrot-trivially.ngrok-free.app/chat';

//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // Scroll to the bottom after new messages are added.
//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   // Send the user's message to the server and process the response.
//   Future<void> _sendMessage() async {
//     if (_messageController.text.trim().isEmpty) return;

//     final userMessage = _messageController.text;

//     setState(() {
//       _messages.add(ChatMessage(text: userMessage, isUser: true));
//       _isLoading = true;
//       _messageController.clear();
//     });

//     _scrollToBottom();

//     try {
//       final response = await http.post(
//         Uri.parse(_baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${widget.accessToken}',
//         },
//         body: jsonEncode({'message': userMessage}),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         try {
//           final data = jsonDecode(response.body);

//           String botReply = '';

//           // If response contains a messages array, iterate and extract the AI reply.
//           if (data is Map && data.containsKey('messages')) {
//             List<dynamic> messages = data['messages'];

//             // Find the last message of type 'ai' that has non-empty content.
//             for (var msg in messages.reversed) {
//               if (msg['type'] == 'ai' &&
//                   msg['content'] != null &&
//                   (msg['content'] as String).trim().isNotEmpty) {
//                 botReply = msg['content'];
//                 break;
//               }
//             }
//           }

//           // Fallback: if botReply is still empty, try to use common keys.
//           if (botReply.trim().isEmpty) {
//             if (data is Map) {
//               botReply =
//                   data['message'] ??
//                   data['reply'] ??
//                   data['response'] ??
//                   data['content'] ??
//                   data.toString();
//             } else if (data is String) {
//               botReply = data;
//             } else {
//               botReply = 'Unexpected response format';
//             }
//           }

//           setState(() {
//             _messages.add(ChatMessage(text: botReply, isUser: false));
//           });
//         } catch (parseError) {
//           print('Error parsing response: $parseError');
//           setState(() {
//             _messages.add(
//               ChatMessage(
//                 text:
//                     response.body.isNotEmpty
//                         ? response.body
//                         : 'Empty response from server',
//                 isUser: false,
//               ),
//             );
//           });
//         }
//       } else if (response.statusCode == 401) {
//         // 401 indicates an invalid token.
//         setState(() {
//           _messages.add(
//             ChatMessage(
//               text: 'Invalid authentication token. Please log in again.',
//               isUser: false,
//             ),
//           );
//         });
//         // Optionally, you can navigate back to the login screen here.
//       } else {
//         setState(() {
//           _messages.add(
//             ChatMessage(
//               text: 'Server error: ${response.statusCode}\n${response.body}',
//               isUser: false,
//             ),
//           );
//         });
//       }
//     } catch (e) {
//       print('Network error: $e');
//       setState(() {
//         _messages.add(
//           ChatMessage(text: 'Connection error: ${e.toString()}', isUser: false),
//         );
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//       _scrollToBottom();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const MenuDrawer(),
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         elevation: 0,
//         title: const Text('Chat'),
//         centerTitle: true,
//         leading: Builder(
//           builder:
//               (context) => IconButton(
//                 icon: Icon(
//                   Icons.menu,
//                   color: Theme.of(context).iconTheme.color,
//                 ),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.edit_square,
//               color: Theme.of(context).iconTheme.color,
//             ),
//             onPressed: () {
//               // Reload the ChatScreen with the same token.
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:
//                       (context) => ChatScreen(accessToken: widget.accessToken),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.notifications_outlined,
//               color: Theme.of(context).iconTheme.color,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // When there are no messages, show a placeholder layout.
//           _messages.isEmpty
//               ? Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'How can I help you?',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SuggestionButton(
//                           icon: Icons.calendar_today,
//                           label: 'Today leaves',
//                           iconColor: Colors.blue,
//                           onPressed: () {
//                             _messageController.text = "Show me today's leaves";
//                             _sendMessage();
//                           },
//                         ),
//                         const SizedBox(width: 12),
//                         SuggestionButton(
//                           icon: Icons.people_outline,
//                           label: 'Employee Records',
//                           iconColor: Colors.purple,
//                           onPressed: () {
//                             _messageController.text =
//                                 "Show me employee records";
//                             _sendMessage();
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SuggestionButton(
//                           icon: Icons.description_outlined,
//                           label: 'Payroll Report',
//                           iconColor: Colors.green,
//                           onPressed: () {
//                             _messageController.text = "Show me payroll report";
//                             _sendMessage();
//                           },
//                         ),
//                         const SizedBox(width: 12),
//                         SuggestionButton(
//                           icon: Icons.more_horiz,
//                           label: 'More',
//                           iconColor: Colors.white,
//                           onPressed: () {
//                             _messageController.text =
//                                 "What else can you help with?";
//                             _sendMessage();
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               : Expanded(
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.all(16.0),
//                   itemCount: _messages.length,
//                   itemBuilder: (context, index) {
//                     final message = _messages[index];
//                     return _buildMessageBubble(message);
//                   },
//                 ),
//               ),
//           if (_isLoading)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(child: Loader()),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).inputDecorationTheme.fillColor,
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(
//                   color: Theme.of(context).dividerColor.withOpacity(0.1),
//                   width: 1,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: TextField(
//                         controller: _messageController,
//                         style: TextStyle(
//                           color: Theme.of(context).textTheme.bodyLarge?.color,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: 'Type your message ...',
//                           hintStyle: TextStyle(
//                             color: adjustOpacity(
//                               Theme.of(context).textTheme.bodyLarge?.color,
//                               0.5,
//                             ),
//                             fontSize: 14,
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 16,
//                           ),
//                         ),
//                         onSubmitted: (_) => _sendMessage(),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       Icons.send,
//                       color: adjustOpacity(
//                         Theme.of(context).iconTheme.color,
//                         0.5,
//                       ),
//                     ),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Build a chat bubble for each message.
//   Widget _buildMessageBubble(ChatMessage message) {
//     return Align(
//       alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//         decoration: BoxDecoration(
//           color:
//               message.isUser
//                   ? Theme.of(context).colorScheme.primary
//                   : Theme.of(context).inputDecorationTheme.fillColor,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width * 0.75,
//         ),
//         child:
//             message.isUser
//                 ? Text(
//                   message.text,
//                   style: const TextStyle(color: Colors.white),
//                 )
//                 : SelectableText(
//                   message.text,
//                   style: TextStyle(
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ),
//                 ),
//       ),
//     );
//   }
// }

// // Chat message model.
// class ChatMessage {
//   final String text;
//   final bool isUser;
//   ChatMessage({required this.text, required this.isUser});
// }

// // --------------------------------------------------------------------------
// // Loader Widget: Blinking dots animation.
// // --------------------------------------------------------------------------
// class Loader extends StatefulWidget {
//   const Loader({Key? key}) : super(key: key);
//   @override
//   _LoaderState createState() => _LoaderState();
// }

// class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final int numDots = 5;
//   final List<Color> colors = [
//     Color(0xFF4285F4),
//     Color(0xFFEA4335),
//     Color(0xFFFBBC05),
//     Color(0xFF34A853),
//     Color(0xFF4285F4),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(numDots, (index) {
//         double offset = index / numDots;
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             double progress = (_controller.value + offset) % 1.0;
//             double opacity = progress < 0.5 ? 1.0 : 0.2;
//             return Container(
//               width: 8,
//               height: 8,
//               margin: const EdgeInsets.symmetric(horizontal: 2),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: colors[index].withOpacity(opacity),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// // --------------------------------------------------------------------------
// // SuggestionButton Widget for quick message options.
// // --------------------------------------------------------------------------
// class SuggestionButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color iconColor;
//   final VoidCallback onPressed;

//   const SuggestionButton({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.iconColor,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Theme.of(context).dividerColor),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: InkWell(
//         onTap: onPressed,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, color: iconColor, size: 20),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 color: Theme.of(context).textTheme.bodyLarge?.color,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'menu.dart';
import '../widgets/theme_notifier.dart';

// Helper function to adjust opacity.
Color adjustOpacity(Color? color, double opacity) {
  final baseColor = color ?? Colors.transparent;
  return Color.fromRGBO(
    baseColor.red,
    baseColor.green,
    baseColor.blue,
    opacity,
  );
}

class ChatScreen extends StatefulWidget {
  final String accessToken; // Access token passed from login
  const ChatScreen({super.key, required this.accessToken});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  final String _baseUrl = 'https://game-parrot-trivially.ngrok-free.app/chat';

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll to the bottom after new messages are added.
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Simulates typing effect by adding one word at a time.
  void _simulateTyping(String fullText) {
    // Split the full text into words.
    final words = fullText.split(' ');
    int currentIndex = 0;
    // Create a bot message that will be updated gradually.
    final botMessage = ChatMessage(text: "", isUser: false);
    setState(() {
      _messages.add(botMessage);
    });
    _scrollToBottom();

    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (currentIndex < words.length) {
        setState(() {
          // Append each word with a preceding space if needed.
          botMessage.text +=
              (botMessage.text.isEmpty ? '' : ' ') + words[currentIndex];
        });
        currentIndex++;
        _scrollToBottom();
      } else {
        timer.cancel();
      }
    });
  }

  // Send the user's message to the server and process the response.
  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text;

    // Add user's message.
    setState(() {
      _messages.add(ChatMessage(text: userMessage, isUser: true));
      _isLoading = true;
      _messageController.clear();
    });
    _scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.accessToken}',
        },
        body: jsonEncode({'message': userMessage}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String botReply = '';

        // Extract the final AI response from the "messages" array.
        if (data is Map && data.containsKey('messages')) {
          List<dynamic> messages = data['messages'];
          // Find the last message with type "ai" that has non-empty content.
          for (var msg in messages.reversed) {
            if (msg['type'] == 'ai' &&
                msg['content'] != null &&
                (msg['content'] as String).trim().isNotEmpty) {
              botReply = msg['content'];
              break;
            }
          }
        } else {
          // Fallback: use common keys if messages array isn't provided.
          if (data is Map) {
            botReply =
                data['message'] ??
                data['reply'] ??
                data['response'] ??
                data['content'] ??
                data.toString();
          } else if (data is String) {
            botReply = data;
          } else {
            botReply = 'Unexpected response format';
          }
        }
        // Simulate the typing effect with the final bot reply.
        _simulateTyping(botReply);
      } else if (response.statusCode == 401) {
        // Handle unauthorized.
        setState(() {
          _messages.add(
            ChatMessage(
              text: 'Invalid authentication token. Please log in again.',
              isUser: false,
            ),
          );
        });
      } else {
        setState(() {
          _messages.add(
            ChatMessage(
              text: 'Server error: ${response.statusCode}\n${response.body}',
              isUser: false,
            ),
          );
        });
      }
    } catch (e) {
      print('Network error: $e');
      setState(() {
        _messages.add(
          ChatMessage(text: 'Connection error: ${e.toString()}', isUser: false),
        );
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: const Text('Chat'),
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_square,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              // Reload the ChatScreen with the same token.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChatScreen(accessToken: widget.accessToken),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Show a placeholder layout when there are no messages.
          _messages.isEmpty
              ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'How can I help you?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SuggestionButton(
                          icon: Icons.calendar_today,
                          label: 'Today leaves',
                          iconColor: Colors.blue,
                          onPressed: () {
                            _messageController.text = "Show me today's leaves";
                            _sendMessage();
                          },
                        ),
                        const SizedBox(width: 12),
                        SuggestionButton(
                          icon: Icons.people_outline,
                          label: 'Employee Records',
                          iconColor: Colors.purple,
                          onPressed: () {
                            _messageController.text =
                                "Show me employee records";
                            _sendMessage();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SuggestionButton(
                          icon: Icons.description_outlined,
                          label: 'Payroll Report',
                          iconColor: Colors.green,
                          onPressed: () {
                            _messageController.text = "Show me payroll report";
                            _sendMessage();
                          },
                        ),
                        const SizedBox(width: 12),
                        SuggestionButton(
                          icon: Icons.more_horiz,
                          label: 'More',
                          iconColor: Colors.white,
                          onPressed: () {
                            _messageController.text =
                                "What else can you help with?";
                            _sendMessage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return _buildMessageBubble(message);
                  },
                ),
              ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Loader()),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type your message ...',
                          hintStyle: TextStyle(
                            color: adjustOpacity(
                              Theme.of(context).textTheme.bodyLarge?.color,
                              0.5,
                            ),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: adjustOpacity(
                        Theme.of(context).iconTheme.color,
                        0.5,
                      ),
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a chat bubble for each message.
  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color:
              message.isUser
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child:
            message.isUser
                ? Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                )
                : SelectableText(
                  message.text,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
      ),
    );
  }
}

// Chat message model.
class ChatMessage {
  String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

// --------------------------------------------------------------------------
// Loader Widget: Blinking dots animation.
// --------------------------------------------------------------------------
class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int numDots = 5;
  final List<Color> colors = [
    const Color(0xFF4285F4),
    const Color(0xFFEA4335),
    const Color(0xFFFBBC05),
    const Color(0xFF34A853),
    const Color(0xFF4285F4),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numDots, (index) {
        double offset = index / numDots;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double progress = (_controller.value + offset) % 1.0;
            double opacity = progress < 0.5 ? 1.0 : 0.2;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[index].withOpacity(opacity),
              ),
            );
          },
        );
      }),
    );
  }
}

// --------------------------------------------------------------------------
// SuggestionButton Widget for quick message options.
// --------------------------------------------------------------------------
class SuggestionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onPressed;

  const SuggestionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

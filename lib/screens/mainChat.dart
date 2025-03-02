// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'menu.dart';
// import '../widgets/theme_notifier.dart';
// import 'mainChat.dart'; // Import the MainChat screen if needed

// // Helper function to adjust opacity without using the deprecated withOpacity.
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
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;

//   final String _baseUrl = 'https://f3bb-122-255-33-126.ngrok-free.app';

//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // Scroll the ListView to the bottom whenever a new message is added.
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
//       _isLoading = true; // Start loading animation
//       _messageController.clear();
//     });

//     _scrollToBottom();

//     try {
//       final response = await http.post(
//         Uri.parse('$_baseUrl/chat'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'message': userMessage}),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         try {
//           final data = jsonDecode(response.body);
//           print('Parsed API Response: $data');

//           // Extract the last message's "content" from the JSON response.
//           String botReply = '';
//           if (data is Map && data.containsKey('messages')) {
//             List<dynamic> messages = data['messages'];
//             if (messages.isNotEmpty) {
//               final lastMessage = messages.last;
//               botReply =
//                   lastMessage['content']?.toString() ?? 'No content found';
//             } else {
//               botReply = 'No messages in response.';
//             }
//           } else {
//             // Fallback extraction if the "messages" key is missing.
//             if (data is Map) {
//               botReply =
//                   data['response'] ??
//                   data['message'] ??
//                   data['reply'] ??
//                   data['text'] ??
//                   data['content'] ??
//                   data.toString();
//             } else if (data is String) {
//               botReply = data;
//             } else if (data is List && data.isNotEmpty) {
//               botReply = data.last.toString();
//             } else {
//               botReply = 'Unexpected response format';
//             }
//           }

//           setState(() {
//             _messages.add(ChatMessage(text: botReply, isUser: false));
//           });
//         } catch (parseError) {
//           print('Error parsing response: $parseError');
//           // If JSON parsing fails, display the raw response.
//           setState(() {
//             _messages.add(
//               ChatMessage(
//                 text:
//                     response.body.isNotEmpty
//                         ? response.body
//                         : 'Received empty response from server',
//                 isUser: false,
//               ),
//             );
//           });
//         }
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
//         _isLoading = false; // Stop loading animation
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
//               // Navigate to the MainChat screen (here we are reloading ChatScreen for demo)
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ChatScreen()),
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
//           // Display welcome and quick action buttons if no messages yet.
//           _messages.isEmpty
//               ? Expanded(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Center(
//                         child: Text(
//                           'How can I help you?',
//                           style: TextStyle(
//                             color: Theme.of(context).textTheme.bodyLarge?.color,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: _buildButton(
//                                     context: context,
//                                     icon: Icons.person_outline,
//                                     text: 'View Employee Records',
//                                     onPressed: () {
//                                       _messageController.text =
//                                           "Show me employee records";
//                                       _sendMessage();
//                                     },
//                                     iconColor: Colors.red,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: _buildButton(
//                                     context: context,
//                                     icon: Icons.trending_up,
//                                     text: 'AI grow',
//                                     onPressed: () {
//                                       _messageController.text =
//                                           "Tell me about AI growth";
//                                       _sendMessage();
//                                     },
//                                     iconColor: Colors.blue,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: _buildButton(
//                                     context: context,
//                                     icon: Icons.construction,
//                                     text: 'Constructions',
//                                     onPressed: () {
//                                       _messageController.text =
//                                           "Show construction projects";
//                                       _sendMessage();
//                                     },
//                                     iconColor: Colors.green,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: _buildButton(
//                                     context: context,
//                                     icon: Icons.inventory_2_outlined,
//                                     text: 'Inventory',
//                                     onPressed: () {
//                                       _messageController.text =
//                                           "Check inventory status";
//                                       _sendMessage();
//                                     },
//                                     iconColor: Colors.orange,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: _buildButton(
//                                     context: context,
//                                     icon: Icons.more_horiz,
//                                     text: 'More',
//                                     onPressed: () {
//                                       _messageController.text =
//                                           "What else can you help with?";
//                                       _sendMessage();
//                                     },
//                                     iconColor:
//                                         Theme.of(context).iconTheme.color ??
//                                         Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
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
//           // Display our custom Loader when loading.
//           if (_isLoading)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(child: Loader()),
//             ),
//           // Chat input area.
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

//   // Builds individual chat message bubbles.
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

//   // Builds a button with an icon and text.
//   Widget _buildButton({
//     required BuildContext context,
//     required IconData icon,
//     required String text,
//     required VoidCallback onPressed,
//     required Color iconColor,
//   }) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//           side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor, size: 20),
//           const SizedBox(width: 8),
//           Text(
//             text,
//             style: TextStyle(
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Model for chat messages.
// class ChatMessage {
//   final String text;
//   final bool isUser;

//   ChatMessage({required this.text, required this.isUser});
// }

// // --------------------------------------------------------------------------
// // Custom Loader Widget with on/off blinking lights and very small circles.
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
//     Color(0xFF4285F4), // Blue
//     Color(0xFFEA4335), // Red
//     Color(0xFFFBBC05), // Yellow
//     Color(0xFF34A853), // Green
//     Color(0xFF4285F4), // Blue (repeat for continuity)
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Create an AnimationController that repeats every 1 second.
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
//         // Each dot gets an offset so they blink sequentially.
//         double offset = index / numDots;
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             // Calculate progress with the offset, wrapping using modulo.
//             double progress = (_controller.value + offset) % 1.0;
//             // Dot is "on" (fully opaque) for the first half of its cycle, otherwise dim.
//             double opacity = progress < 0.5 ? 1.0 : 0.2;
//             return Container(
//               width:
//                   8, // Further reduced size for an ultra-small, premium look.
//               height:
//                   8, // Further reduced size for an ultra-small, premium look.
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 2,
//               ), // Tighter spacing.
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

  final String _baseUrl = 'https://99aa-122-255-33-126.ngrok-free.app/chat';

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

  // Send the user's message to the server and process the response.
  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text;

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
        try {
          final data = jsonDecode(response.body);

          String botReply = '';

          // If response contains a messages array, iterate and extract the AI reply.
          if (data is Map && data.containsKey('messages')) {
            List<dynamic> messages = data['messages'];

            // Find the last message of type 'ai' that has non-empty content.
            for (var msg in messages.reversed) {
              if (msg['type'] == 'ai' &&
                  msg['content'] != null &&
                  (msg['content'] as String).trim().isNotEmpty) {
                botReply = msg['content'];
                break;
              }
            }
          }

          // Fallback: if botReply is still empty, try to use common keys.
          if (botReply.trim().isEmpty) {
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

          setState(() {
            _messages.add(ChatMessage(text: botReply, isUser: false));
          });
        } catch (parseError) {
          print('Error parsing response: $parseError');
          setState(() {
            _messages.add(
              ChatMessage(
                text:
                    response.body.isNotEmpty
                        ? response.body
                        : 'Empty response from server',
                isUser: false,
              ),
            );
          });
        }
      } else if (response.statusCode == 401) {
        // 401 indicates an invalid token.
        setState(() {
          _messages.add(
            ChatMessage(
              text: 'Invalid authentication token. Please log in again.',
              isUser: false,
            ),
          );
        });
        // Optionally, you can navigate back to the login screen here.
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
          // When there are no messages, show a placeholder layout.
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
  final String text;
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
    Color(0xFF4285F4),
    Color(0xFFEA4335),
    Color(0xFFFBBC05),
    Color(0xFF34A853),
    Color(0xFF4285F4),
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

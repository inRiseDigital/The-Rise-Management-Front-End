// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'menu.dart';
// import '../widgets/theme_notifier.dart';

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
//       // Using the exact URL that worked in Postman
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

//           // Extract only the last message's "content" from the JSON
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
//             // Fallback extraction logic if "messages" key is not present.
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
//           // If not valid JSON, use the raw response
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
//             onPressed: () {},
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
//           if (_isLoading)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
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
//                             color: Theme.of(
//                               context,
//                             ).textTheme.bodyLarge?.color?.withOpacity(0.5),
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
//                       color: Theme.of(
//                         context,
//                       ).iconTheme.color?.withOpacity(0.5),
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
//         child: Text(
//           message.text,
//           style: TextStyle(
//             color:
//                 message.isUser
//                     ? Colors.white
//                     : Theme.of(context).textTheme.bodyLarge?.color,
//           ),
//         ),
//       ),
//     );
//   }

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

// class ChatMessage {
//   final String text;
//   final bool isUser;

//   ChatMessage({required this.text, required this.isUser});
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'menu.dart';
// import '../widgets/theme_notifier.dart';
// import 'mainChat.dart'; // Import the MainChat screen

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

//           // Extract only the last message's "content" from the JSON
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
//             // Fallback extraction logic if "messages" key is not present.
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
//           // If not valid JSON, use the raw response
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
//               // Navigate to the MainChat screen
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
//           if (_isLoading)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
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
//                             color: Theme.of(
//                               context,
//                             ).textTheme.bodyLarge?.color?.withOpacity(0.5),
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
//                       color: Theme.of(
//                         context,
//                       ).iconTheme.color?.withOpacity(0.5),
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
//         child: Text(
//           message.text,
//           style: TextStyle(
//             color:
//                 message.isUser
//                     ? Colors.white
//                     : Theme.of(context).textTheme.bodyLarge?.color,
//           ),
//         ),
//       ),
//     );
//   }

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

// class ChatMessage {
//   final String text;
//   final bool isUser;

//   ChatMessage({required this.text, required this.isUser});
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'menu.dart';
import '../widgets/theme_notifier.dart';
import 'mainChat.dart'; // Import the MainChat screen

// Helper function to adjust opacity without using the deprecated withOpacity.
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
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  final String _baseUrl = 'https://f3bb-122-255-33-126.ngrok-free.app';

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

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
        Uri.parse('$_baseUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': userMessage}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          final data = jsonDecode(response.body);
          print('Parsed API Response: $data');

          // Extract only the last message's "content" from the JSON
          String botReply = '';
          if (data is Map && data.containsKey('messages')) {
            List<dynamic> messages = data['messages'];
            if (messages.isNotEmpty) {
              final lastMessage = messages.last;
              botReply =
                  lastMessage['content']?.toString() ?? 'No content found';
            } else {
              botReply = 'No messages in response.';
            }
          } else {
            // Fallback extraction logic if "messages" key is not present.
            if (data is Map) {
              botReply =
                  data['response'] ??
                  data['message'] ??
                  data['reply'] ??
                  data['text'] ??
                  data['content'] ??
                  data.toString();
            } else if (data is String) {
              botReply = data;
            } else if (data is List && data.isNotEmpty) {
              botReply = data.last.toString();
            } else {
              botReply = 'Unexpected response format';
            }
          }

          setState(() {
            _messages.add(ChatMessage(text: botReply, isUser: false));
          });
        } catch (parseError) {
          print('Error parsing response: $parseError');
          // If not valid JSON, use the raw response
          setState(() {
            _messages.add(
              ChatMessage(
                text:
                    response.body.isNotEmpty
                        ? response.body
                        : 'Received empty response from server',
                isUser: false,
              ),
            );
          });
        }
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
              // Navigate to the MainChat screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
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
          _messages.isEmpty
              ? Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'How can I help you?',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _buildButton(
                                    context: context,
                                    icon: Icons.person_outline,
                                    text: 'View Employee Records',
                                    onPressed: () {
                                      _messageController.text =
                                          "Show me employee records";
                                      _sendMessage();
                                    },
                                    iconColor: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildButton(
                                    context: context,
                                    icon: Icons.trending_up,
                                    text: 'AI grow',
                                    onPressed: () {
                                      _messageController.text =
                                          "Tell me about AI growth";
                                      _sendMessage();
                                    },
                                    iconColor: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildButton(
                                    context: context,
                                    icon: Icons.construction,
                                    text: 'Constructions',
                                    onPressed: () {
                                      _messageController.text =
                                          "Show construction projects";
                                      _sendMessage();
                                    },
                                    iconColor: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildButton(
                                    context: context,
                                    icon: Icons.inventory_2_outlined,
                                    text: 'Inventory',
                                    onPressed: () {
                                      _messageController.text =
                                          "Check inventory status";
                                      _sendMessage();
                                    },
                                    iconColor: Colors.orange,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildButton(
                                    context: context,
                                    icon: Icons.more_horiz,
                                    text: 'More',
                                    onPressed: () {
                                      _messageController.text =
                                          "What else can you help with?";
                                      _sendMessage();
                                    },
                                    iconColor:
                                        Theme.of(context).iconTheme.color ??
                                        Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
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
        // Use Text for user messages and SelectableText for chatbot responses.
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

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    required Color iconColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

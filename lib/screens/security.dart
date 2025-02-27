// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/inputField.dart'; // Import the CustomInputField
// import 'package:flutter_application_1/screens/menu.dart'; // Import the MenuDrawer

// class SecurityScreen extends StatelessWidget {
//   const SecurityScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF131314),
//         elevation: 0,
//         leading: Builder(
//           builder:
//               (context) => IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.white),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//         ),
//         title: const Column(
//           children: [
//             Text(
//               'CCTV',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               '& Security',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit_square, color: Colors.white),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications_outlined, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: const MenuDrawer(), // Use the MenuDrawer
//       body: Column(
//         children: [
//           const Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'How can I help you?',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SuggestionButton(
//                       icon: Icons.warning_amber_rounded,
//                       label: 'Alert',
//                       iconColor: Color(0xFFFFA500),
//                     ),
//                     SizedBox(width: 12),
//                     SuggestionButton(
//                       icon: Icons.videocam_outlined,
//                       label: 'View Live Feeds',
//                       iconColor: Colors.white,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SuggestionButton(
//                       icon: Icons.lock_outline,
//                       label: 'Access Control Logs',
//                       iconColor: Color(0xFF2196F3),
//                     ),
//                     SizedBox(width: 12),
//                     SuggestionButton(
//                       icon: Icons.more_horiz,
//                       label: 'More',
//                       iconColor: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: CustomInputField(
//               hintText: 'Type your message ...',
//               controller: TextEditingController(),
//               onPressed: () {
//                 // Define the action for the send button
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton({
//     required IconData icon,
//     required String text,
//     required Color iconColor,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: iconColor, size: 20),
//             const SizedBox(width: 8),
//             Text(
//               text,
//               style: const TextStyle(color: Colors.white, fontSize: 13),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SuggestionButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color iconColor;

//   const SuggestionButton({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color(0xFFABABAB)),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: iconColor, size: 20),
//           const SizedBox(width: 8),
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/inputField.dart'; // Import the CustomInputField
import 'package:flutter_application_1/screens/menu.dart'; // Import the MenuDrawer
import 'package:provider/provider.dart';
import '../widgets/theme_notifier.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Column(
          children: [
            Text(
              'CCTV',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '& Security',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_square,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
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
      drawer: const MenuDrawer(), // Use the MenuDrawer
      body: Column(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How can I help you?',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SuggestionButton(
                      icon: Icons.warning_amber_rounded,
                      label: 'Alert',
                      iconColor: Color(0xFFFFA500),
                    ),
                    SizedBox(width: 12),
                    SuggestionButton(
                      icon: Icons.videocam_outlined,
                      label: 'View Live Feeds',
                      iconColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SuggestionButton(
                      icon: Icons.lock_outline,
                      label: 'Access Control Logs',
                      iconColor: Color(0xFF2196F3),
                    ),
                    SizedBox(width: 12),
                    SuggestionButton(
                      icon: Icons.more_horiz,
                      label: 'More',
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CustomInputField(
              hintText: 'Type your message ...',
              controller: TextEditingController(),
              onPressed: () {
                // Define the action for the send button
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const SuggestionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}

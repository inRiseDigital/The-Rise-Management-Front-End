// import 'package:flutter/material.dart';
// import 'menu.dart';
// import 'package:flutter_application_1/widgets/inputField.dart'; // Import the CustomInputField

// class FinanceScreen extends StatelessWidget {
//   const FinanceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//               'Finance',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               'Department',
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
//             icon: const Icon(Icons.notifications_outlined, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: const MenuDrawer(),
//       backgroundColor: const Color(0xFF131314),
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
//                       icon: Icons.attach_money,
//                       label: 'Expenditure',
//                       iconColor: Colors.orange,
//                     ),
//                     SizedBox(width: 12),
//                     SuggestionButton(
//                       icon: Icons.insert_chart_outlined,
//                       label: 'Financial reports',
//                       iconColor: Colors.green,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SuggestionButton(
//                       icon: Icons.account_balance_wallet_outlined,
//                       label: 'Current budget allocation',
//                       iconColor: Colors.purple,
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
//                 // Handle send button press
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton({
//     required IconData icon,
//     required Color iconColor,
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFF222224),
//         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min, // Allows button to expand based on text
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor, size: 18),
//           const SizedBox(width: 6),
//           Flexible(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 overflow:
//                     TextOverflow.ellipsis, // Prevents text from overflowing
//               ),
//             ),
//           ),
//         ],
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
import 'package:provider/provider.dart';
import 'menu.dart';
import 'package:flutter_application_1/widgets/inputField.dart'; // Import the CustomInputField
import '../widgets/theme_notifier.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Finance',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Department',
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
              Icons.notifications_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      icon: Icons.attach_money,
                      label: 'Expenditure',
                      iconColor: Colors.orange,
                    ),
                    SizedBox(width: 12),
                    SuggestionButton(
                      icon: Icons.insert_chart_outlined,
                      label: 'Financial reports',
                      iconColor: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SuggestionButton(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Current budget allocation',
                      iconColor: Colors.purple,
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
                // Handle send button press
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
    required Color iconColor,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Allows button to expand based on text
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 12,
                overflow:
                    TextOverflow.ellipsis, // Prevents text from overflowing
              ),
            ),
          ),
        ],
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

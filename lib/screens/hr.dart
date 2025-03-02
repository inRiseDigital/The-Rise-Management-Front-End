// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application_1/widgets/inputField.dart';
// import 'menu.dart';
// import '../widgets/theme_notifier.dart';

// class HRScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   HRScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         elevation: 0,
//         leading: Builder(
//           builder:
//               (context) => IconButton(
//                 icon: Icon(
//                   Icons.menu,
//                   color: Theme.of(context).iconTheme.color,
//                 ),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//         ),
//         title: Column(
//           children: [
//             Text(
//               'Human',
//               style: TextStyle(
//                 color: Theme.of(context).textTheme.bodyLarge?.color,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               'Resources',
//               style: TextStyle(
//                 color: Theme.of(context).textTheme.bodyLarge?.color,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
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
//       drawer: const MenuDrawer(),
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: Column(
//         children: [
//           const Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'How can I help you?',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SuggestionButton(
//                       icon: Icons.calendar_today,
//                       label: 'Today leaves',
//                       iconColor: Colors.blue,
//                     ),
//                     SizedBox(width: 12),
//                     SuggestionButton(
//                       icon: Icons.people_outline,
//                       label: 'Employee Records',
//                       iconColor: Colors.purple,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SuggestionButton(
//                       icon: Icons.description_outlined,
//                       label: 'Payroll Report',
//                       iconColor: Colors.green,
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
//               controller: _controller,
//               onPressed: () {
//                 // Handle send button press
//               },
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
//         border: Border.all(color: Theme.of(context).dividerColor),
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
//             style: TextStyle(
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/widgets/inputField.dart';
import 'menu.dart';
import '../widgets/theme_notifier.dart';

class HRScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HRScreen({super.key});

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
              'Human',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Resources',
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
                      icon: Icons.calendar_today,
                      label: 'Today leaves',
                      iconColor: Colors.blue,
                    ),
                    SizedBox(width: 12),
                    SuggestionButton(
                      icon: Icons.people_outline,
                      label: 'Employee Records',
                      iconColor: Colors.purple,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SuggestionButton(
                      icon: Icons.description_outlined,
                      label: 'Payroll Report',
                      iconColor: Colors.green,
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
              controller: _controller,
              onPressed: () {
                // Handle send button press
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavBarIcon(icon: Icons.home_outlined),
            NavBarIcon(icon: Icons.group_outlined),
            NavBarIcon(icon: Icons.arrow_forward_outlined),
            NavBarIcon(icon: Icons.chat_bubble_outline_rounded),
            // NavBarIcon(icon: Icons.description_outlined),
          ],
        ),
      ),
    );
  }
}

// Add this new class for the navigation bar icons
class NavBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const NavBarIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: 30),
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

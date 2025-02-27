// // import 'package:flutter/material.dart';

// // class CustomInputField extends StatelessWidget {
// //   final String hintText;
// //   final TextEditingController controller;
// //   final VoidCallback onPressed;

// //   const CustomInputField({
// //     super.key,
// //     required this.hintText,
// //     required this.controller,
// //     required this.onPressed,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: const Color(0xFF222224),
// //           borderRadius: BorderRadius.circular(25),
// //           border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
// //         ),
// //         child: Row(
// //           children: [
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                 child: TextField(
// //                   controller: controller,
// //                   style: const TextStyle(color: Colors.white),
// //                   decoration: InputDecoration(
// //                     hintText: hintText,
// //                     hintStyle: TextStyle(
// //                       color: Colors.white.withOpacity(0.5),
// //                       fontSize: 14,
// //                     ),
// //                     border: InputBorder.none,
// //                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(
// //                 right: .0,
// //               ), // Adjusted padding value
// //               child: IconButton(
// //                 icon: Icon(Icons.send, color: Colors.white.withOpacity(0.5)),
// //                 onPressed: onPressed,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class CustomInputField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final VoidCallback onPressed;

//   const CustomInputField({
//     super.key,
//     required this.hintText,
//     required this.controller,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFF222224),
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: TextField(
//                   controller: controller,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     hintStyle: TextStyle(
//                       color: Colors.white.withOpacity(0.5),
//                       fontSize: 14,
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send, color: Colors.white.withOpacity(0.5)),
//               onPressed: onPressed,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback onPressed;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  controller: controller,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.color?.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
              ),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

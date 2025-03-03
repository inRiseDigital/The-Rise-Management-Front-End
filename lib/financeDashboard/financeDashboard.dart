// import 'package:flutter/material.dart';

// class FinanceDashboard extends StatefulWidget {
//   const FinanceDashboard({Key? key}) : super(key: key);

//   @override
//   _FinanceDashboardState createState() => _FinanceDashboardState();
// }

// class _FinanceDashboardState extends State<FinanceDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Finance Header
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(24.0),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     margin: const EdgeInsets.all(16.0),
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Finance',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Total Budget',
//                           style: TextStyle(
//                             color: Color(0xFF666666),
//                             fontSize: 24,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           '\$10M',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 48,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Spent Budget Card
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(24.0),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF2A2A2A),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Spent Budget',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               '\$29k',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 36,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               'Remaining: \$18M',
//                               style: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Budget Details
//                   Container(
//                     margin: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         _buildBudgetCard('Total Budget', '\$100K'),
//                         const SizedBox(height: 16),
//                         _buildBudgetCard('Remaining Budget', '\$100K'),
//                         const SizedBox(height: 16),
//                         _buildBudgetCard('Spent Budget', '\$100K'),
//                         const SizedBox(height: 80),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 80,
//               right: 20,
//               child: GestureDetector(
//                 onTap: () {
//                   // Handle chatbot tap
//                 },
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     child: const Icon(
//                       Icons.chat_bubble_outline,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: const Color(0xFF666666),
//           type: BottomNavigationBarType.fixed,
//           currentIndex: 0,
//           onTap: (index) {
//             if (index == 0) {
//               Navigator.pop(context);
//             }
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 24,
//                 child: Icon(Icons.home_outlined, color: Colors.black, size: 20),
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people_outline, size: 24),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.send_outlined, size: 24),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_outlined, size: 24),
//               label: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBudgetCard(String title, String value) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FinanceDashboard extends StatefulWidget {
  const FinanceDashboard({Key? key}) : super(key: key);

  @override
  _FinanceDashboardState createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Finance Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    margin: const EdgeInsets.all(16.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Finance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Total Budget',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$10M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spent Budget Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Spent Budget',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '\$29k',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Remaining: \$18M',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Budget Details
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildBudgetCard('Total Budget', '\$100K'),
                        const SizedBox(height: 16),
                        _buildBudgetCard('Remaining Budget', '\$100K'),
                        const SizedBox(height: 16),
                        _buildBudgetCard('Spent Budget', '\$100K'),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
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
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF666666),
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.pop(context);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
                child: Icon(Icons.home_outlined, color: Colors.black, size: 20),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send_outlined, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined, size: 24),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetCard(String title, String value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
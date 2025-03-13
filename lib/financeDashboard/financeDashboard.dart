// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/financeDashboard/widgets/monitoringNav/monitoringNav.dart';
// import 'dart:ui' as ui;
// import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget
// import 'widgets/budgetNav.dart'; // Import the BudgetNav widget
// import 'widgets/allocationNav/allocationNav.dart'; // Import the AllocationNav widget

// class FinanceDashboard extends StatefulWidget {
//   const FinanceDashboard({Key? key}) : super(key: key);

//   @override
//   _FinanceDashboardState createState() => _FinanceDashboardState();
// }

// class _FinanceDashboardState extends State<FinanceDashboard> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const FinanceDashboard(),
//     const BudgetNav(),
//     const MonitoringNav(),
//     const AllocationNav(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const BudgetNav()),
//       );
//     } else if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const AllocationNav()),
//       );
//     }
//   }

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
//                     padding: const EdgeInsets.all(32),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     margin: const EdgeInsets.all(16.0),
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Finance',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 32,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Total Budget',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Color(0xFF666666),
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           '\$10M',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Color(0xFFB0AFFF),
//                             fontSize: 48,
//                             fontWeight: FontWeight.w500,
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
//                       color: const Color(0xFFABABAB),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Spent Budget',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               '\$29k',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 36,
//                                 fontWeight: FontWeight.w500,
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
//             ChatBotIcon(), // Replace the existing chatbot icon with the new ChatBotIcon widget
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
//           currentIndex: _selectedIndex,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 0
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.description_outlined,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.description_outlined, size: 24),
//               label: 'Overview',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 1
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.pie_chart_outline,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.pie_chart_outline, size: 24),
//               label: 'Budget',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 2
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.credit_card_outlined,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.credit_card_outlined, size: 24),
//               label: 'Monitoring',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 3
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.hourglass_empty,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.hourglass_empty, size: 24),
//               label: 'Allocation',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBudgetCard(String title, String value) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/financeDashboard/widgets/monitoringNav/monitoringNav.dart';
import 'dart:ui' as ui;
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget
import 'widgets/budgetNav.dart'; // Import the BudgetNav widget
import 'widgets/allocationNav/allocationNav.dart'; // Import the AllocationNav widget
import 'widgets/financeNavigation.dart'; // Import the new FinanceNavigation widget

class FinanceDashboard extends StatefulWidget {
  const FinanceDashboard({Key? key}) : super(key: key);

  @override
  _FinanceDashboardState createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const FinanceDashboard(),
    const BudgetNav(),
    const MonitoringNav(),
    const AllocationNav(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BudgetNav()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AllocationNav()),
      );
    }
  }

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
                      color: const Color.fromARGB(255, 0, 0, 0),
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
                            color: Color(0xFFB0AFFF),
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
                      color: const Color(0xFFABABAB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Spent Budget',
                          style: TextStyle(
                            color: Colors.black,
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
                                color: Colors.black,
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
            ChatBotIcon(), // Existing ChatBotIcon remains
          ],
        ),
      ),
      bottomNavigationBar: FinanceNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
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

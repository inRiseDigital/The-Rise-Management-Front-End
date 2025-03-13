// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/financeDashboard/financeDashboard.dart';
// import '../addBudget.dart'; // Import the AddBudget widget
// import '../editBudget.dart'; // Import the EditBudget widget
// import '../deleteBudget.dart'; // Import the DeleteBudget widget
// import '../budgetNav.dart'; // Import the BudgetNav widget
// import 'spendingBudget.dart'; // Import the SpendingBudget widget
// import '../budgetInsights.dart'; // Import the BudgetInsights widget
// import '../allocationNav/allocationNav.dart'; // Import the AllocationNav widget

// class MonitoringNav extends StatefulWidget {
//   const MonitoringNav({Key? key}) : super(key: key);

//   @override
//   State<MonitoringNav> createState() => _MonitoringNavState();
// }

// class _MonitoringNavState extends State<MonitoringNav> {
//   int _selectedIndex = 2; // Monitoring is selected by default
//   int _selectedTabIndex = 0; // Default tab index
//   final List<String> _tabs = ['Overview', 'Spending', 'Insights'];

//   void _onItemTapped(int index, BuildContext context) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Handle navigation based on the tapped index
//     switch (index) {
//       case 0:
//         // Navigate to Overview page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const FinanceDashboard()),
//         );
//         break;
//       case 1:
//         // Navigate to Budget page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const BudgetNav()),
//         );
//         break;
//       case 2:
//         // Already on Monitoring page
//         break;
//       case 3:
//         // Navigate to Allocation page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const AllocationNav()),
//         );
//         break;
//     }
//   }

//   void _onTabTapped(int index, BuildContext context) {
//     setState(() {
//       _selectedTabIndex = index;
//     });

//     // Handle navigation based on the tapped tab
//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const SpendingBudget()),
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const BudgetInsights()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A1A1A),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               const Center(
//                 child: Text(
//                   'Financial Monitoring',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Tab bar
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     children: List.generate(_tabs.length, (index) {
//                       return Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             _onTabTapped(index, context);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             decoration: BoxDecoration(
//                               color:
//                                   _selectedTabIndex == index
//                                       ? Colors.white
//                                       : Colors.transparent,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               _tabs[index],
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color:
//                                     _selectedTabIndex == index
//                                         ? Colors.black
//                                         : Colors.grey,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Monthly Summary Card
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF252525),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Monthly Summary',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Total Budget column
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Total Budget',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '\$12,000',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // Total Spent column
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Total Spent',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '\$8,700',
//                               style: TextStyle(
//                                 color: Color(0xFF9D80EF),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Remaining column
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Remaining',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '\$3,300',
//                               style: TextStyle(
//                                 color: Color(0xFF4CAF50),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // Savings Rate column
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Savings Rate',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '28%',
//                               style: TextStyle(
//                                 color: Color(0xFFFFD700),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Quick Stats Section
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF252525),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Quick Stats',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Active Budgets
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(16.0),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF2A2A2A),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.access_time,
//                                   color: Colors.blue,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Active Budgets',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       '3',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         // Monthly Change
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(16.0),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF2A2A2A),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.trending_up,
//                                   color: Colors.green,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Monthly\nChange',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       '+2.4%',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Biggest Expense
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(16.0),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF2A2A2A),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.bar_chart,
//                                   color: Colors.redAccent,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Biggest Expense',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       'Housing',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         // Transactions
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.all(16.0),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF2A2A2A),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.bolt,
//                                   color: Colors.amber,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Transactions',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       '28',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               // Bottom Navigation
//               Theme(
//                 data: ThemeData(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                 ),
//                 child: BottomNavigationBar(
//                   backgroundColor: Colors.black,
//                   selectedItemColor: Colors.white,
//                   unselectedItemColor: const Color(0xFF666666),
//                   type: BottomNavigationBarType.fixed,
//                   currentIndex: _selectedIndex,
//                   showSelectedLabels: true,
//                   showUnselectedLabels: true,
//                   onTap: (index) {
//                     _onItemTapped(index, context);
//                   },
//                   items: [
//                     BottomNavigationBarItem(
//                       icon:
//                           _selectedIndex == 0
//                               ? const CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 24,
//                                 child: Icon(
//                                   Icons.description_outlined,
//                                   color: Colors.black,
//                                   size: 20,
//                                 ),
//                               )
//                               : const Icon(
//                                 Icons.description_outlined,
//                                 size: 24,
//                               ),
//                       label: 'Overview',
//                     ),
//                     BottomNavigationBarItem(
//                       icon:
//                           _selectedIndex == 1
//                               ? const CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 24,
//                                 child: Icon(
//                                   Icons.pie_chart_outline,
//                                   color: Colors.black,
//                                   size: 20,
//                                 ),
//                               )
//                               : const Icon(Icons.pie_chart_outline, size: 24),
//                       label: 'Budget',
//                     ),
//                     BottomNavigationBarItem(
//                       icon:
//                           _selectedIndex == 2
//                               ? const CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 24,
//                                 child: Icon(
//                                   Icons.credit_card_outlined,
//                                   color: Colors.black,
//                                   size: 20,
//                                 ),
//                               )
//                               : const Icon(
//                                 Icons.credit_card_outlined,
//                                 size: 24,
//                               ),
//                       label: 'Monitoring',
//                     ),
//                     BottomNavigationBarItem(
//                       icon:
//                           _selectedIndex == 3
//                               ? const CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 24,
//                                 child: Icon(
//                                   Icons.hourglass_empty,
//                                   color: Colors.black,
//                                   size: 20,
//                                 ),
//                               )
//                               : const Icon(Icons.hourglass_empty, size: 24),
//                       label: 'Allocation',
//                     ),
//                   ],
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
import 'package:flutter_application_1/financeDashboard/financeDashboard.dart';
import 'package:flutter_application_1/financeDashboard/widgets/financeNavigation.dart';
import '../addBudget.dart'; // Import the AddBudget widget
import '../editBudget.dart'; // Import the EditBudget widget
import '../deleteBudget.dart'; // Import the DeleteBudget widget
import '../budgetNav.dart'; // Import the BudgetNav widget
import 'spendingBudget.dart'; // Import the SpendingBudget widget
import '../budgetInsights.dart'; // Import the BudgetInsights widget
import '../allocationNav/allocationNav.dart'; // Import the AllocationNav widget
import '../financeNavigation.dart'; // Import the reusable FinanceNavigation widget

class MonitoringNav extends StatefulWidget {
  const MonitoringNav({Key? key}) : super(key: key);

  @override
  State<MonitoringNav> createState() => _MonitoringNavState();
}

class _MonitoringNavState extends State<MonitoringNav> {
  int _selectedIndex = 2; // Monitoring is selected by default
  int _selectedTabIndex = 0; // Default tab index
  final List<String> _tabs = ['Overview', 'Spending', 'Insights'];

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the tapped index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FinanceDashboard()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BudgetNav()),
        );
        break;
      case 2:
        // Already on Monitoring page
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AllocationNav()),
        );
        break;
    }
  }

  void _onTabTapped(int index, BuildContext context) {
    setState(() {
      _selectedTabIndex = index;
    });

    // Handle navigation based on the tapped tab
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SpendingBudget()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BudgetInsights()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Center(
                child: Text(
                  'Financial Monitoring',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tab bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: List.generate(_tabs.length, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _onTabTapped(index, context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  _selectedTabIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _tabs[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    _selectedTabIndex == index
                                        ? Colors.black
                                        : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Monthly Summary Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Monthly Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Total Budget column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Budget',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$12,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Total Spent column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Spent',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$8,700',
                              style: TextStyle(
                                color: Color(0xFF9D80EF),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remaining column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Remaining',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$3,300',
                              style: TextStyle(
                                color: Color(0xFF4CAF50),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Savings Rate column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Savings Rate',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '28%',
                              style: TextStyle(
                                color: Color(0xFFFFD700),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Quick Stats Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Stats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Active Budgets
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Active Budgets',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Monthly Change
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Monthly\nChange',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '+2.4%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Biggest Expense
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bar_chart,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Biggest Expense',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Housing',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Transactions
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bolt,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Transactions',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '28',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
              const Spacer(),
              // Reusable Bottom Navigation Bar
              FinanceNavigation(
                selectedIndex: _selectedIndex,
                onItemTapped: (index) => _onItemTapped(index, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

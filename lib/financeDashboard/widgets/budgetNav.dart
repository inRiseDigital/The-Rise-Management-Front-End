// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/financeDashboard/widgets/allocationNav/allocationNav.dart';
// import '../financeDashboard.dart'; // Import the FinanceDashboard widget
// import 'addBudget.dart'; // Import the AddBudget widget
// import 'editBudget.dart'; // Import the EditBudget widget
// import 'deleteBudget.dart'; // Import the DeleteBudget widget
// import './monitoringNav/monitoringNav.dart'; // Import the MonitoringNav widget

// class BudgetNav extends StatefulWidget {
//   const BudgetNav({Key? key}) : super(key: key);

//   @override
//   State<BudgetNav> createState() => _BudgetNavState();
// }

// class _BudgetNavState extends State<BudgetNav> {
//   int _selectedIndex = 1; // Budget is selected by default

//   void _onItemTapped(int index) {
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
//         // Already on Budget page
//         break;
//       case 2:
//         // Navigate to Monitoring page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MonitoringNav()),
//         );
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
//               // Header Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Budget',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         'Management',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   OutlinedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const AddBudget(),
//                         ),
//                       );
//                     },
//                     icon: const Icon(Icons.add, color: Colors.white),
//                     label: const Text(
//                       'Add Budget',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.white),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24.0),
//               // Budgets Title
//               const Text(
//                 'Budgets',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               // Budget Cards
//               _buildBudgetCard(
//                 "Monthly Expenses",
//                 "Jan 1, 2023 - Dec 31, 2023",
//                 "\$10,000,000",
//                 "Personal",
//                 Colors.deepPurple.shade300,
//               ),
//               const SizedBox(height: 16.0),
//               _buildBudgetCard(
//                 "Project Alpha",
//                 "Jan 1, 2023 - Jul 30, 2023",
//                 "\$100,000",
//                 "Work",
//                 Colors.deepPurple.shade300,
//               ),
//               const SizedBox(height: 16.0),
//               _buildBudgetCard(
//                 "Vacation Fund",
//                 "Jan 1, 2023 - Sep 30, 2023",
//                 "\$50,000",
//                 "Travel",
//                 Colors.deepPurple.shade300,
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
//                   onTap: _onItemTapped,
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

//   Widget _buildBudgetCard(
//     String title,
//     String dateRange,
//     String amount,
//     String category,
//     Color iconColor, {
//     bool showAddButton = false,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFF252525),
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               color: iconColor.withOpacity(0.2),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.account_balance_wallet_outlined,
//               color: iconColor,
//             ),
//           ),
//           const SizedBox(width: 16.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   dateRange,
//                   style: const TextStyle(color: Colors.grey, fontSize: 12.0),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 amount,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 category,
//                 style: TextStyle(
//                   color:
//                       category == "Personal"
//                           ? Colors.white
//                           : category == "Work"
//                           ? Colors.white
//                           : Colors.yellow[700],
//                   fontSize: 12.0,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 8.0),
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: IconButton(
//                   icon: const Icon(Icons.edit, color: Colors.white, size: 18.0),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const EditBudget(),
//                       ),
//                     );
//                   },
//                   constraints: const BoxConstraints(
//                     minWidth: 32,
//                     minHeight: 32,
//                   ),
//                   padding: EdgeInsets.zero,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.red),
//                 ),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                     size: 18.0,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const DeleteBudget(),
//                       ),
//                     );
//                   },
//                   constraints: const BoxConstraints(
//                     minWidth: 32,
//                     minHeight: 32,
//                   ),
//                   padding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/financeDashboard/widgets/allocationNav/allocationNav.dart';
import '../financeDashboard.dart'; // Import the FinanceDashboard widget
import 'addBudget.dart'; // Import the AddBudget widget
import 'editBudget.dart'; // Import the EditBudget widget
import 'deleteBudget.dart'; // Import the DeleteBudget widget
import './monitoringNav/monitoringNav.dart'; // Import the MonitoringNav widget
import './financeNavigation.dart'; // Import the separate bottom navigation widget

class BudgetNav extends StatefulWidget {
  const BudgetNav({Key? key}) : super(key: key);

  @override
  State<BudgetNav> createState() => _BudgetNavState();
}

class _BudgetNavState extends State<BudgetNav> {
  int _selectedIndex = 1; // Budget is selected by default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the tapped index
    switch (index) {
      case 0:
        // Navigate to Overview (FinanceDashboard) page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FinanceDashboard()),
        );
        break;
      case 1:
        // Already on Budget page
        break;
      case 2:
        // Navigate to Monitoring page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MonitoringNav()),
        );
        break;
      case 3:
        // Navigate to Allocation page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AllocationNav()),
        );
        break;
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
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Budget',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Management',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddBudget(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Budget',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              // Budgets Title
              const Text(
                'Budgets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // Budget Cards
              _buildBudgetCard(
                "Monthly Expenses",
                "Jan 1, 2023 - Dec 31, 2023",
                "\$10,000,000",
                "Personal",
                Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 16.0),
              _buildBudgetCard(
                "Project Alpha",
                "Jan 1, 2023 - Jul 30, 2023",
                "\$100,000",
                "Work",
                Colors.deepPurple.shade300,
              ),
              const SizedBox(height: 16.0),
              _buildBudgetCard(
                "Vacation Fund",
                "Jan 1, 2023 - Sep 30, 2023",
                "\$50,000",
                "Travel",
                Colors.deepPurple.shade300,
              ),
              const Spacer(),
              // Use the FinanceNavigation widget for the bottom navigation
              FinanceNavigation(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetCard(
    String title,
    String dateRange,
    String amount,
    String category,
    Color iconColor, {
    bool showAddButton = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateRange,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  color:
                      category == "Personal"
                          ? Colors.white
                          : category == "Work"
                          ? Colors.white
                          : Colors.yellow[700],
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8.0),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white, size: 18.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditBudget(),
                      ),
                    );
                  },
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeleteBudget(),
                      ),
                    );
                  },
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

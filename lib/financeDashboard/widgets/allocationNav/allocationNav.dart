// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/financeDashboard/financeDashboard.dart';
// import '../budgetNav.dart'; // Import the BudgetNav widget
// import '../monitoringNav/monitoringNav.dart'; // Import the MonitoringNav widget

// class AllocationNav extends StatefulWidget {
//   const AllocationNav({Key? key}) : super(key: key);

//   @override
//   State<AllocationNav> createState() => _AllocationNavState();
// }

// class _AllocationNavState extends State<AllocationNav> {
//   int _selectedIndex = 3; // Allocation is selected by default

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
//         // Navigate to Budget page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const BudgetNav()),
//         );
//         break;
//       case 2:
//         // Navigate to Monitoring page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MonitoringNav()),
//         );
//         break;
//       case 3:
//         // Already on Allocation page
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Budget Allocation',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Manage and optimize your budget allocations',
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Overview',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Categories',
//                         style: TextStyle(
//                           color: Color(0xFF6B7280),
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Planning',
//                         style: TextStyle(
//                           color: Color(0xFF6B7280),
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildBudgetCard(
//                       title: 'Total Budget',
//                       icon: Icons.attach_money,
//                       iconColor: Colors.indigo,
//                       amount: '\$10k',
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: _buildBudgetCard(
//                       title: 'Allocated',
//                       icon: Icons.pie_chart,
//                       iconColor: Colors.purple,
//                       amount: '\$8k',
//                       subtitle: '75% of total',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildUnallocatedFunds(),
//             const SizedBox(height: 16),
//             _buildAllocationDistribution(),
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

//   Widget _buildBudgetCard({
//     required String title,
//     required IconData icon,
//     required Color iconColor,
//     required String amount,
//     String? subtitle,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF222222),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//               Icon(icon, color: iconColor, size: 16),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             amount,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           if (subtitle != null)
//             Text(
//               subtitle,
//               style: const TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildUnallocatedFunds() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF222222),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Unallocated Funds',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     '\$2,500',
//                     style: TextStyle(
//                       color: Color(0xFF4ADE80),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Available to allocate',
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF8B5CF6),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     Icon(Icons.add, size: 16),
//                     SizedBox(width: 4),
//                     Text('Allocate Funds'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAllocationDistribution() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF222222),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Allocation Distribution',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF333333),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Row(
//                   children: const [
//                     Text(
//                       'Monthly',
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           _buildCategoryItem('Housing', '\$3k', 0.4),
//           const SizedBox(height: 12),
//           _buildCategoryItem('Food', '\$2k', 0.2),
//           const SizedBox(height: 12),
//           _buildCategoryItem('Transport', '\$1k', 0.16),
//           const SizedBox(height: 12),
//           _buildCategoryItem('Entertainment', '\$600', 0.12),
//           const SizedBox(height: 12),
//           _buildCategoryItem('Savings', '\$600', 0.12),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryItem(String category, String amount, double percentage) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 3,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 category,
//                 style: const TextStyle(color: Colors.white, fontSize: 14),
//               ),
//               Text(
//                 amount,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 6,
//           child: Stack(
//             children: [
//               Container(
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade800,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               FractionallySizedBox(
//                 widthFactor: percentage,
//                 child: Container(
//                   height: 8,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF8B5CF6),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Text(
//             '${(percentage * 100).toInt()}%',
//             textAlign: TextAlign.right,
//             style: const TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/financeDashboard/financeDashboard.dart';
import '../budgetNav.dart'; // Import the BudgetNav widget
import '../monitoringNav/monitoringNav.dart'; // Import the MonitoringNav widget
import '../financeNavigation.dart'; // Import the reusable FinanceNavigation widget

class AllocationNav extends StatefulWidget {
  const AllocationNav({Key? key}) : super(key: key);

  @override
  State<AllocationNav> createState() => _AllocationNavState();
}

class _AllocationNavState extends State<AllocationNav> {
  int _selectedIndex = 3; // Allocation is selected by default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the tapped index
    switch (index) {
      case 0:
        // Navigate to Overview page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FinanceDashboard()),
        );
        break;
      case 1:
        // Navigate to Budget page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BudgetNav()),
        );
        break;
      case 2:
        // Navigate to Monitoring page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MonitoringNav()),
        );
        break;
      case 3:
        // Already on Allocation page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Budget Allocation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Manage and optimize your budget allocations',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Overview',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Planning',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildBudgetCard(
                      title: 'Total Budget',
                      icon: Icons.attach_money,
                      iconColor: Colors.indigo,
                      amount: '\$10k',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildBudgetCard(
                      title: 'Allocated',
                      icon: Icons.pie_chart,
                      iconColor: Colors.purple,
                      amount: '\$8k',
                      subtitle: '75% of total',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildUnallocatedFunds(),
            const SizedBox(height: 16),
            _buildAllocationDistribution(),
          ],
        ),
      ),
      // Use the reusable FinanceNavigation widget for the bottom navigation bar
      bottomNavigationBar: FinanceNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index),
      ),
    );
  }

  Widget _buildBudgetCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String amount,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Icon(icon, color: iconColor, size: 16),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget _buildUnallocatedFunds() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Unallocated Funds',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '\$2,500',
                    style: TextStyle(
                      color: Color(0xFF4ADE80),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Available to allocate',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.add, size: 16),
                    SizedBox(width: 4),
                    Text('Allocate Funds'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAllocationDistribution() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Allocation Distribution',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: const [
                    Text(
                      'Monthly',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCategoryItem('Housing', '\$3k', 0.4),
          const SizedBox(height: 12),
          _buildCategoryItem('Food', '\$2k', 0.2),
          const SizedBox(height: 12),
          _buildCategoryItem('Transport', '\$1k', 0.16),
          const SizedBox(height: 12),
          _buildCategoryItem('Entertainment', '\$600', 0.12),
          const SizedBox(height: 12),
          _buildCategoryItem('Savings', '\$600', 0.12),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category, String amount, double percentage) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                amount,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${(percentage * 100).toInt()}%',
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class DashboardOverview extends StatefulWidget {
//   final String username;
//   final String accessToken;

//   const DashboardOverview({
//     Key? key,
//     required this.username,
//     required this.accessToken,
//   }) : super(key: key);

//   @override
//   _DashboardOverviewState createState() => _DashboardOverviewState();
// }

// class _DashboardOverviewState extends State<DashboardOverview> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // Welcome section with image
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(24.0),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1A1A1A),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   margin: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'lib/assets/images/ayubowan.png',
//                         height: 50, // Adjust the height as needed
//                         fit: BoxFit.contain,
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         widget.username,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         _getCurrentDate(),
//                         style: const TextStyle(
//                           color: Color(0xFF666666),
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Rest of the code remains the same...
//                 // Quick Overview section
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF2A2A2A),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Quick Overview',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Employee Productivity: 90%',
//                         style: TextStyle(
//                           color: Color(0xFFAAAAAA),
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Total Stock Value: \$50,000',
//                         style: TextStyle(
//                           color: Color(0xFFAAAAAA),
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Departments Grid
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1.0,
//                     padding: const EdgeInsets.all(16.0),
//                     mainAxisSpacing: 16.0,
//                     crossAxisSpacing: 16.0,
//                     children: [
//                       _buildDepartmentCard(
//                         'Human Resources',
//                         'Automate payroll, manage employee data...',
//                         Icons.people,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Finance & Budgeting',
//                         'budgeting, tax calculations...',
//                         Icons.attach_money,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'AI Grow',
//                         'Monitor greenhouse, Automate fertigation...',
//                         Icons.eco,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'CCTV Monitoring',
//                         'Monitor greenhouse, Automate fertigation...',
//                         Icons.camera_alt,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Inventory Management',
//                         'Track stock levels, automate replenishment...',
//                         Icons.inventory,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Sales and Marketing',
//                         'Manage customer relationships, sales orders...',
//                         Icons.trending_up,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Procurement',
//                         'Automate purchase order creation...',
//                         Icons.shopping_cart,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Cleaning and Maintenance',
//                         'Schedule and track cleaning tasks...',
//                         Icons.cleaning_services,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Kitchen Management',
//                         'Track food inventory, expiration dates...',
//                         Icons.restaurant,
//                         true,
//                       ),
//                       _buildDepartmentCard(
//                         'Construction Management',
//                         'Monitor ongoing projects, track milestones...',
//                         Icons.construction,
//                         true,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Chatbot Icon
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
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.send), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
//         ],
//       ),
//     );
//   }

//   Widget _buildDepartmentCard(
//     String title,
//     String description,
//     IconData icon,
//     bool isSelected,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFABABAB),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(icon, color: Colors.black, size: 32),
//                 const SizedBox(height: 16),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Expanded(
//                   child: Text(
//                     description,
//                     style: const TextStyle(
//                       color: Color(0xFF444444),
//                       fontSize: 14,
//                     ),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 16,
//             right: 16,
//             child: Container(
//               width: 24,
//               height: 24,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.black, width: 2),
//                 color: isSelected ? Colors.black : Colors.transparent,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getCurrentDate() {
//     final now = DateTime.now();
//     final months = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December',
//     ];
//     final days = [
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//       'Sunday',
//     ];

//     return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
//   }
// }

import 'package:flutter/material.dart';
import '../hrDashboard/hrDashboard.dart';
import '../financeDashboard/financeDashboard.dart';
import '../aiGrowDashboard/aiGrowDashboard.dart';
import '../cctvDashboard/cctvDashboard.dart';

class DashboardOverview extends StatefulWidget {
  final String username;
  final String accessToken;

  const DashboardOverview({
    Key? key,
    required this.username,
    required this.accessToken,
  }) : super(key: key);

  @override
  _DashboardOverviewState createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/ayubowan.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.username,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _getCurrentDate(),
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Overview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Employee Productivity: 90%',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Total Stock Value: \$50,000',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(16.0),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HRDashboard(),
                            ),
                          );
                        },
                        child: _buildDepartmentCard(
                          'Human Resources',
                          'Automate payroll, manage employee data...',
                          Icons.people,
                          true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FinanceDashboard(),
                            ),
                          );
                        },
                        child: _buildDepartmentCard(
                          'Finance & Budgeting',
                          'budgeting, tax calculations...',
                          Icons.attach_money,
                          true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AIGrowDashboard(),
                            ),
                          );
                        },
                        child: _buildDepartmentCard(
                          'AI Grow',
                          'Monitor greenhouse, Automate fertigation...',
                          Icons.eco,
                          true,
                        ),
                      ),
                      // _buildDepartmentCard(
                      //   'CCTV Monitoring',
                      //   'Monitor greenhouse, Automate fertigation...',
                      //   Icons.camera_alt,
                      //   true,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CCTVDashboard(),
                            ),
                          );
                        },
                        child: _buildDepartmentCard(
                          'CCTV Monitoring',
                          'Monitor greenhouse, Automate fertigation...',
                          Icons.camera_alt,
                          true,
                        ),
                      ),
                      _buildDepartmentCard(
                        'Inventory Management',
                        'Track stock levels, automate replenishment...',
                        Icons.inventory,
                        true,
                      ),
                      _buildDepartmentCard(
                        'Sales and Marketing',
                        'Manage customer relationships, sales orders...',
                        Icons.trending_up,
                        true,
                      ),
                      _buildDepartmentCard(
                        'Procurement',
                        'Automate purchase order creation...',
                        Icons.shopping_cart,
                        true,
                      ),
                      _buildDepartmentCard(
                        'Cleaning and Maintenance',
                        'Schedule and track cleaning tasks...',
                        Icons.cleaning_services,
                        true,
                      ),
                      _buildDepartmentCard(
                        'Kitchen Management',
                        'Track food inventory, expiration dates...',
                        Icons.restaurant,
                        true,
                      ),
                      _buildDepartmentCard(
                        'Construction Management',
                        'Monitor ongoing projects, track milestones...',
                        Icons.construction,
                        true,
                      ),
                    ],
                  ),
                ),
              ],
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }

  Widget _buildDepartmentCard(
    String title,
    String description,
    IconData icon,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFABABAB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.black, size: 32),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF444444),
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
                color: isSelected ? Colors.black : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
  }
}

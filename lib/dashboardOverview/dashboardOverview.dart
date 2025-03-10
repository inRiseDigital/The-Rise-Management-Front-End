// import 'package:flutter/material.dart';
// import 'dart:async';
// import '../hrDashboard/hrDashboard.dart';
// import '../financeDashboard/financeDashboard.dart';
// import '../aiGrowDashboard/aiGrowDashboard.dart';
// import '../cctvDashboard/cctvDashboard.dart';
// import '../inventoryDashboard/inventoryDashboard.dart';
// import '../procurmentDashboard/procurmentDashboard.dart';
// import '../cleaningDashboard/cleaningDashboard.dart';
// import '../kitchenDashboard/kitchenDashboard.dart';
// import '../constructionDashboard/constructionDashboard.dart';
// import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

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
//   int _selectedIndex = 0;

//   // Create a stream controller
//   final StreamController<List<Map<String, dynamic>>> _streamController =
//       StreamController<List<Map<String, dynamic>>>();

//   @override
//   void initState() {
//     super.initState();
//     // Simulate fetching data from an API
//     _fetchDepartmentData();
//   }

//   @override
//   void dispose() {
//     _streamController.close();
//     super.dispose();
//   }

//   // Simulate fetching data from an API
//   void _fetchDepartmentData() async {
//     await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
//     final List<Map<String, dynamic>> departments = [
//       {
//         'title': 'Human Resources',
//         'description': 'Automate payroll, manage employee data...',
//         'icon': Icons.people,
//         'isSelected': true,
//         'route': HRDashboard(accessToken: widget.accessToken),
//       },
//       {
//         'title': 'Finance & Budgeting',
//         'description': 'Budgeting, tax calculations...',
//         'icon': Icons.attach_money,
//         'isSelected': true,
//         'route': const FinanceDashboard(),
//       },
//       {
//         'title': 'AI Grow',
//         'description': 'Monitor greenhouse, Automate fertigation...',
//         'icon': Icons.eco,
//         'isSelected': true,
//         'route': const AIGrowDashboard(),
//       },
//       {
//         'title': 'CCTV Monitoring',
//         'description': 'Monitor greenhouse, Automate fertigation...',
//         'icon': Icons.camera_alt,
//         'isSelected': true,
//         'route': const CCTVDashboard(),
//       },
//       {
//         'title': 'Inventory Management',
//         'description': 'Track stock levels, automate replenishment...',
//         'icon': Icons.inventory,
//         'isSelected': true,
//         'route': const InventoryDashboard(),
//       },
//       {
//         'title': 'Sales and Marketing',
//         'description': 'Manage customer relationships, sales orders...',
//         'icon': Icons.trending_up,
//         'isSelected': true,
//         'route': null,
//       },
//       {
//         'title': 'Procurement',
//         'description': 'Automate purchase order creation...',
//         'icon': Icons.shopping_cart,
//         'isSelected': true,
//         'route': const ProcurementDashboard(),
//       },
//       {
//         'title': 'Cleaning and Maintenance',
//         'description': 'Schedule and track cleaning tasks...',
//         'icon': Icons.cleaning_services,
//         'isSelected': true,
//         'route': const CleaningDashboard(),
//       },
//       {
//         'title': 'Kitchen Management',
//         'description': 'Track food inventory, expiration dates...',
//         'icon': Icons.restaurant,
//         'isSelected': true,
//         'route': const KitchenDashboard(),
//       },
//       {
//         'title': 'Construction Management',
//         'description': 'Monitor ongoing projects, track milestones...',
//         'icon': Icons.construction,
//         'isSelected': true,
//         'route': const ConstructionDashboard(),
//       },
//     ];
//     _streamController.add(departments);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(24.0),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   margin: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'lib/assets/images/ayubowan.png',
//                         height: 50,
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
//                 Expanded(
//                   child: StreamBuilder<List<Map<String, dynamic>>>(
//                     stream: _streamController.stream,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Text(
//                             'Error: ${snapshot.error}',
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         );
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return const Center(
//                           child: Text(
//                             'No data available',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         );
//                       } else {
//                         final departments = snapshot.data!;
//                         return GridView.count(
//                           crossAxisCount: 2,
//                           childAspectRatio: 1.0,
//                           padding: const EdgeInsets.all(16.0),
//                           mainAxisSpacing: 16.0,
//                           crossAxisSpacing: 16.0,
//                           children:
//                               departments.map((department) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     if (department['route'] != null) {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder:
//                                               (context) => department['route'],
//                                         ),
//                                       );
//                                     }
//                                   },
//                                   child: _buildDepartmentCard(
//                                     department['title'],
//                                     department['description'],
//                                     department['icon'],
//                                     department['isSelected'],
//                                   ),
//                                 );
//                               }).toList(),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             ChatBotIcon(), // Replace the existing chatbot icon with the new ChatBotIcon widget
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon:
//                 _selectedIndex == 0
//                     ? const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 24,
//                       child: Icon(Icons.home, color: Colors.black, size: 20),
//                     )
//                     : const Icon(Icons.home, size: 24),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 _selectedIndex == 1
//                     ? const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 24,
//                       child: Icon(Icons.people, color: Colors.black, size: 20),
//                     )
//                     : const Icon(Icons.people, size: 24),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 _selectedIndex == 2
//                     ? const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 24,
//                       child: Icon(Icons.person, color: Colors.black, size: 20),
//                     )
//                     : const Icon(Icons.person, size: 24),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 _selectedIndex == 3
//                     ? const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 24,
//                       child: Icon(
//                         Icons.notifications,
//                         color: Colors.black,
//                         size: 20,
//                       ),
//                     )
//                     : const Icon(Icons.notifications, size: 24),
//             label: '',
//           ),
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
import 'dart:async';
import 'dart:math'; // Needed for circle math calculations
import '../hrDashboard/hrDashboard.dart';
import '../financeDashboard/financeDashboard.dart';
import '../aiGrowDashboard/aiGrowDashboard.dart';
import '../cctvDashboard/cctvDashboard.dart';
import '../inventoryDashboard/inventoryDashboard.dart';
import '../procurmentDashboard/procurmentDashboard.dart';
import '../cleaningDashboard/cleaningDashboard.dart';
import '../kitchenDashboard/kitchenDashboard.dart';
import '../constructionDashboard/constructionDashboard.dart';
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

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

class _DashboardOverviewState extends State<DashboardOverview>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  // Stream controller for department data
  final StreamController<List<Map<String, dynamic>>> _streamController =
      StreamController<List<Map<String, dynamic>>>();

  // Loader animation properties for circular loader
  late AnimationController _loaderController;
  final int _numDots = 5;
  final List<Color> _loaderColors = [
    const Color(0xFF4285F4), // Blue
    const Color(0xFFEA4335), // Red
    const Color(0xFFFBBC05), // Yellow
    const Color(0xFF34A853), // Green
    const Color(0xFF4285F4), // Blue (repeat)
  ];

  @override
  void initState() {
    super.initState();
    _fetchDepartmentData();
    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _loaderController.dispose();
    _streamController.close();
    super.dispose();
  }

  // Simulate fetching department data from an API
  void _fetchDepartmentData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final List<Map<String, dynamic>> departments = [
      {
        'title': 'Human Resources',
        'description': 'Automate payroll, manage employee data...',
        'icon': Icons.people,
        'isSelected': true,
        'route': HRDashboard(accessToken: widget.accessToken),
      },
      {
        'title': 'Finance & Budgeting',
        'description': 'Budgeting, tax calculations...',
        'icon': Icons.attach_money,
        'isSelected': true,
        'route': const FinanceDashboard(),
      },
      {
        'title': 'AI Grow',
        'description': 'Monitor greenhouse, Automate fertigation...',
        'icon': Icons.eco,
        'isSelected': true,
        'route': const AIGrowDashboard(),
      },
      {
        'title': 'CCTV Monitoring',
        'description': 'Monitor greenhouse, Automate fertigation...',
        'icon': Icons.camera_alt,
        'isSelected': true,
        'route': const CCTVDashboard(),
      },
      {
        'title': 'Inventory Management',
        'description': 'Track stock levels, automate replenishment...',
        'icon': Icons.inventory,
        'isSelected': true,
        'route': const InventoryDashboard(),
      },
      {
        'title': 'Sales and Marketing',
        'description': 'Manage customer relationships, sales orders...',
        'icon': Icons.trending_up,
        'isSelected': true,
        'route': null,
      },
      {
        'title': 'Procurement',
        'description': 'Automate purchase order creation...',
        'icon': Icons.shopping_cart,
        'isSelected': true,
        'route': const ProcurementDashboard(),
      },
      {
        'title': 'Cleaning and Maintenance',
        'description': 'Schedule and track cleaning tasks...',
        'icon': Icons.cleaning_services,
        'isSelected': true,
        'route': const CleaningDashboard(),
      },
      {
        'title': 'Kitchen Management',
        'description': 'Track food inventory, expiration dates...',
        'icon': Icons.restaurant,
        'isSelected': true,
        'route': const KitchenDashboard(),
      },
      {
        'title': 'Construction Management',
        'description': 'Monitor ongoing projects, track milestones...',
        'icon': Icons.construction,
        'isSelected': true,
        'route': const ConstructionDashboard(),
      },
    ];
    _streamController.add(departments);
  }

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
                    color: Colors.black,
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
                    children: const [
                      Text(
                        'Quick Overview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Employee Productivity: 90%',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
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
                  child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Inline custom circular loader effect
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: AnimatedBuilder(
                              animation: _loaderController,
                              builder: (context, child) {
                                List<Widget> dots = [];
                                double radius = 20;
                                for (int i = 0; i < _numDots; i++) {
                                  double angle = (2 * pi / _numDots) * i;
                                  double progress =
                                      (_loaderController.value + i / _numDots) %
                                      1.0;
                                  double opacity = progress < 0.5 ? 1.0 : 0.2;
                                  double x = radius * cos(angle);
                                  double y = radius * sin(angle);
                                  dots.add(
                                    Positioned(
                                      left:
                                          25 +
                                          x -
                                          4, // center adjustments (dot width=8)
                                      top: 25 + y - 4,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _loaderColors[i].withOpacity(
                                            opacity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Stack(children: dots);
                              },
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No data available',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        final departments = snapshot.data!;
                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          padding: const EdgeInsets.all(16.0),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          children:
                              departments.map((department) {
                                return GestureDetector(
                                  onTap: () {
                                    if (department['route'] != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => department['route'],
                                        ),
                                      );
                                    }
                                  },
                                  child: _buildDepartmentCard(
                                    department['title'],
                                    department['description'],
                                    department['icon'],
                                    department['isSelected'],
                                  ),
                                );
                              }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            ChatBotIcon(), // Existing ChatBotIcon remains
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 0
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.home, color: Colors.black, size: 20),
                    )
                    : const Icon(Icons.home, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 1
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.people, color: Colors.black, size: 20),
                    )
                    : const Icon(Icons.people, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 2
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.person, color: Colors.black, size: 20),
                    )
                    : const Icon(Icons.person, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 3
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                    : const Icon(Icons.notifications, size: 24),
            label: '',
          ),
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

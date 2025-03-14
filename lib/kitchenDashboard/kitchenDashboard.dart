// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

// class KitchenDashboard extends StatefulWidget {
//   const KitchenDashboard({Key? key}) : super(key: key);

//   @override
//   _KitchenDashboardState createState() => _KitchenDashboardState();
// }

// class _KitchenDashboardState extends State<KitchenDashboard> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const KitchenDashboardScreen(),
//     const CategoriesScreen(),
//     const MaintenanceScreen(),
//     const StockScreen(),
//     const OrdersScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E1E),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             _screens[_selectedIndex],
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
//           backgroundColor: const Color(0xFF1E1E1E),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 0
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.category,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.category, size: 24),
//               label: 'Categories',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 1
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(Icons.build, color: Colors.black, size: 20),
//                       )
//                       : const Icon(Icons.build, size: 24),
//               label: 'Maintenance',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 2
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.storage,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.storage, size: 24),
//               label: 'Menu',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 3
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.shopping_cart,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.shopping_cart, size: 24),
//               label: 'Orders',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class KitchenDashboardScreen extends StatelessWidget {
//   const KitchenDashboardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: const Color(0xFF2A2A2A),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: const [
//                 Text(
//                   'Kitchen',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Total Orders Prepared',
//                   style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   '03',
//                   style: TextStyle(
//                     color: Color(0xFFB0AFFF),
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 child: _buildMetricCard('Daily Meals', '03', Icons.restaurant),
//               ),
//               const SizedBox(width: 16), // Add horizontal spacing
//               Expanded(
//                 child: _buildMetricCard('Low Stocks', '20', Icons.people),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Today's Schedule",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle_outline, color: Colors.white),
//                 onPressed: () {
//                   // Handle add schedule
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildScheduleItemCard(
//                   'Breakfast',
//                   '10.00 A.M',
//                   Icons.breakfast_dining,
//                 ),
//                 const SizedBox(height: 16), // Add vertical spacing
//                 _buildScheduleItemCard(
//                   'Lunch',
//                   '12.00 P.M',
//                   Icons.lunch_dining,
//                 ),
//                 const SizedBox(height: 16), // Add vertical spacing
//                 _buildScheduleItemCard(
//                   'Dinner',
//                   '08.00 P.M',
//                   Icons.dinner_dining,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMetricCard(String title, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFF3A3A3A),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               const Spacer(),
//               Icon(icon, color: Colors.white),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScheduleItemCard(String title, String time, IconData icon) {
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
//             children: [
//               Container(
//                 width: 48,
//                 height: 48,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, color: Colors.black, size: 24),
//               ),
//               const SizedBox(width: 16),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 time,
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

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Categories Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// class MaintenanceScreen extends StatelessWidget {
//   const MaintenanceScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Maintenance Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// class StockScreen extends StatelessWidget {
//   const StockScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Stock Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Orders Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../widgets/chatBotIcon.dart';
import './widgets//menuNav/menuNav.dart'; // Import the MenuNav widget

class KitchenDashboard extends StatefulWidget {
  const KitchenDashboard({Key? key}) : super(key: key);

  @override
  _KitchenDashboardState createState() => _KitchenDashboardState();
}

class _KitchenDashboardState extends State<KitchenDashboard> {
  // We use three dashboard screens:
  // Index 0: KitchenDashboardScreen
  // Index 1: MaintenanceScreen
  // Index 2: OrdersScreen
  // The bottom navigation bar has 4 items. The middle (index 2) is reserved for Menu navigation.
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const KitchenDashboardScreen(),
    const MaintenanceScreen(),
    const OrdersScreen(),
  ];

  /// Handles taps on the bottom navigation items.
  void _onItemTapped(int tappedIndex) {
    // BottomNavigationBar items:
    // 0: Categories (mapped to KitchenDashboardScreen)
    // 1: Maintenance (mapped to MaintenanceScreen)
    // 2: Menu (external navigation)
    // 3: Orders (mapped to OrdersScreen)
    if (tappedIndex == 2) {
      // Navigate to the MenuNav screen when "Menu" is tapped.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuNav()),
      );
    } else {
      setState(() {
        // Map bottom nav bar index to our _screens list.
        // For items after the Menu (index 2), subtract one.
        _selectedIndex = tappedIndex > 2 ? tappedIndex - 1 : tappedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the bottom navigation bar's current index.
    // If _selectedIndex is 2 (OrdersScreen) then bottom nav index should be 3.
    int currentBottomIndex =
        _selectedIndex < 2 ? _selectedIndex : _selectedIndex + 1;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Stack(
          children: [
            // Display the selected screen.
            _screens[_selectedIndex],
            // The chatbot icon overlays all screens.
            ChatBotIcon(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentBottomIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon:
                  currentBottomIndex == 0
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.category,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.category, size: 24),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon:
                  currentBottomIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(Icons.build, color: Colors.black, size: 20),
                      )
                      : const Icon(Icons.build, size: 24),
              label: 'Maintenance',
            ),
            BottomNavigationBarItem(
              // For Menu we simply show the icon – tapping it navigates externally.
              icon: const Icon(Icons.storage, size: 24),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon:
                  currentBottomIndex == 3
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.shopping_cart, size: 24),
              label: 'Orders',
            ),
          ],
        ),
      ),
    );
  }
}

class KitchenDashboardScreen extends StatelessWidget {
  const KitchenDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The dashboard content with a header, metrics, and schedule.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Kitchen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Orders Prepared',
                  style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '03',
                  style: TextStyle(
                    color: Color(0xFFB0AFFF),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard('Daily Meals', '03', Icons.restaurant),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard('Low Stocks', '20', Icons.people),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Schedule",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                onPressed: () {
                  // Handle add schedule action
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                _buildScheduleItemCard(
                  'Breakfast',
                  '10.00 A.M',
                  Icons.breakfast_dining,
                ),
                const SizedBox(height: 16),
                _buildScheduleItemCard(
                  'Lunch',
                  '12.00 P.M',
                  Icons.lunch_dining,
                ),
                const SizedBox(height: 16),
                _buildScheduleItemCard(
                  'Dinner',
                  '08.00 P.M',
                  Icons.dinner_dining,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Icon(icon, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItemCard(String title, String time, IconData icon) {
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
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                time,
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

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Maintenance Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

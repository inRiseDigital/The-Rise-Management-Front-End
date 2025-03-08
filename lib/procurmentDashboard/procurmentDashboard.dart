// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// class ProcurementDashboard extends StatefulWidget {
//   const ProcurementDashboard({Key? key}) : super(key: key);

//   @override
//   _ProcurementDashboardState createState() => _ProcurementDashboardState();
// }

// class _ProcurementDashboardState extends State<ProcurementDashboard> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const ProcurementDashboardScreen(),
//     const RequestsScreen(),
//     const SuppliersScreen(),
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
//                           Icons.dashboard,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.dashboard, size: 24),
//               label: 'Overview',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 1
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.request_page,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.request_page, size: 24),
//               label: 'Requests',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 2
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.people,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.people, size: 24),
//               label: 'Suppliers',
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

// class ProcurementDashboardScreen extends StatelessWidget {
//   const ProcurementDashboardScreen({Key? key}) : super(key: key);

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
//                   'Procurement',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Total Purchase Value',
//                   style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   '\$5M',
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
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: _buildMetricCard(
//                   'Pending Orders',
//                   '15',
//                   Icons.hourglass_empty,
//                 ),
//               ),
//               const SizedBox(width: 16), // Add horizontal spacing
//               Expanded(
//                 child: _buildMetricCard('Suppliers', '20', Icons.people),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildProcurementItemCard('Laptops', '\$100K', Icons.laptop),
//                 const SizedBox(height: 16), // Add vertical spacing
//                 _buildProcurementItemCard(
//                   'Fabrics',
//                   '\$100K',
//                   Icons.shopping_cart,
//                 ),
//                 const SizedBox(height: 16), // Add vertical spacing
//                 _buildProcurementItemCard('Monitors', '\$100K', Icons.tv),
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

//   Widget _buildProcurementItemCard(String title, String value, IconData icon) {
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

// class RequestsScreen extends StatelessWidget {
//   const RequestsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Requests Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// class SuppliersScreen extends StatelessWidget {
//   const SuppliersScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Suppliers Screen',
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
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

class ProcurementDashboard extends StatefulWidget {
  const ProcurementDashboard({Key? key}) : super(key: key);

  @override
  _ProcurementDashboardState createState() => _ProcurementDashboardState();
}

class _ProcurementDashboardState extends State<ProcurementDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ProcurementDashboardScreen(),
    const RequestsScreen(),
    const SuppliersScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Stack(
          children: [
            _screens[_selectedIndex],
            ChatBotIcon(), // Replace the existing chatbot icon with the new ChatBotIcon widget
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
                        child: Icon(
                          Icons.dashboard,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.dashboard, size: 24),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.request_page,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.request_page, size: 24),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 2
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.people,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.people, size: 24),
              label: 'Suppliers',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 3
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

class ProcurementDashboardScreen extends StatelessWidget {
  const ProcurementDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Procurement',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Purchase Value',
                  style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '\$5M',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Pending Orders',
                  '15',
                  Icons.hourglass_empty,
                ),
              ),
              const SizedBox(width: 16), // Add horizontal spacing
              Expanded(
                child: _buildMetricCard('Suppliers', '20', Icons.people),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildProcurementItemCard('Laptops', '\$100K', Icons.laptop),
                const SizedBox(height: 16), // Add vertical spacing
                _buildProcurementItemCard(
                  'Fabrics',
                  '\$100K',
                  Icons.shopping_cart,
                ),
                const SizedBox(height: 16), // Add vertical spacing
                _buildProcurementItemCard('Monitors', '\$100K', Icons.tv),
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

  Widget _buildProcurementItemCard(String title, String value, IconData icon) {
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

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Requests Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Suppliers Screen',
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

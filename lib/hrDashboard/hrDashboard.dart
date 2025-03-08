// import 'package:flutter/material.dart';
// import 'dart:ui';
// import '../hrDashboard/hrLeave.dart'; // Import the LeaveScreen
// import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

// class HRDashboard extends StatefulWidget {
//   const HRDashboard({Key? key}) : super(key: key);

//   @override
//   _HRDashboardState createState() => _HRDashboardState();
// }

// class _HRDashboardState extends State<HRDashboard> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const HRDashboardScreen(),
//     const TeamScreen(), // Placeholder for Team screen
//     const LeaveScreen(),
//     const NotificationsScreen(), // Placeholder for Notifications screen
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(child: _screens[_selectedIndex]),
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
//                           Icons.home_outlined,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.home_outlined, size: 24),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 1
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.group_outlined,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.group_outlined, size: 24),
//               label: 'Employees',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 2
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.exit_to_app,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.exit_to_app, size: 24),
//               label: 'Leave',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 3
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.notifications_outlined,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.notifications_outlined, size: 24),
//               label: 'Notifications',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HRDashboardScreen extends StatelessWidget {
//   const HRDashboardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   padding: const EdgeInsets.all(32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'HR',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         'Total Employees',
//                         style: TextStyle(
//                           color: Color(0xFF666666),
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         '255',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 48,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 _buildMetricCard(
//                   icon: Icons.account_balance_wallet_outlined,
//                   title: 'Payroll Due',
//                   value: '\$100K',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.event_note_outlined,
//                   title: 'Leave Request',
//                   value: '10',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.business_center_outlined,
//                   title: 'Employees on site',
//                   value: '200',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.person_outline_outlined,
//                   title: 'Employees on Leave',
//                   value: '50',
//                 ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ),
//         ChatBotIcon(), // Replace the existing chatbot icon with the new ChatBotIcon widget
//       ],
//     );
//   }

//   Widget _buildMetricCard({
//     required String title,
//     required String value,
//     required IconData icon,
//   }) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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

// class TeamScreen extends StatelessWidget {
//   const TeamScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Team Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Notifications Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui';
import '../hrDashboard/hrLeave.dart'; // Import the LeaveScreen
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget
import 'widgets/employeesNav/employeesNav.dart'; // Import the EmployeesNav widget

class HRDashboard extends StatefulWidget {
  const HRDashboard({Key? key}) : super(key: key);

  @override
  _HRDashboardState createState() => _HRDashboardState();
}

class _HRDashboardState extends State<HRDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HRDashboardScreen(),
    const EmployeesNav(), // Add EmployeesNav screen
    const LeaveScreen(),
    const NotificationsScreen(), // Placeholder for Notifications screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(child: _screens[_selectedIndex]),
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
                          Icons.home_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.home_outlined, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.group_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.group_outlined, size: 24),
              label: 'Employees',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 2
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.exit_to_app, size: 24),
              label: 'Leave',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 3
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.notifications_outlined, size: 24),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}

class HRDashboardScreen extends StatelessWidget {
  const HRDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'HR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Total Employees',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '255',
                        style: TextStyle(
                          color: Color(0xFFB0AFFF),
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildMetricCard(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Payroll Due',
                  value: '\$100K',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.event_note_outlined,
                  title: 'Leave Request',
                  value: '10',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.business_center_outlined,
                  title: 'Employees on site',
                  value: '200',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.person_outline_outlined,
                  title: 'Employees on Leave',
                  value: '50',
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        ChatBotIcon(), // Replace the existing chatbot icon with the new ChatBotIcon widget
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Team Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

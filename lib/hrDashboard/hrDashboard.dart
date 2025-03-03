// import 'package:flutter/material.dart';

// class HRDashboard extends StatelessWidget {
//   const HRDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'HR',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Total Employees Card
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF222224),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         'Total Employees',
//                         style: TextStyle(color: Colors.grey, fontSize: 16),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         '255',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 48,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Metric Cards
//                 _buildMetricCard(
//                   icon: Icons.attach_money_rounded,
//                   title: 'Payroll Due',
//                   value: '\$100K',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.calendar_today_rounded,
//                   title: 'Leave Request',
//                   value: '10',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.people_rounded,
//                   title: 'Employees on site',
//                   value: '200',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.person_off_rounded,
//                   title: 'Employees on Leave',
//                   value: '50',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: 0,
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.pop(context);
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.send), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
//         ],
//       ),
//     );
//   }

//   Widget _buildMetricCard({
//     required IconData icon,
//     required String title,
//     required String value,
//   }) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF222224),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: Colors.white, size: 24),
//           ),
//           const SizedBox(width: 16),
//           Text(title, style: const TextStyle(color: Colors.grey, fontSize: 16)),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui';

class HRDashboard extends StatelessWidget {
  const HRDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(
        child: Stack(
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
                        color: const Color(0xFF1A1A1A),
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
                              color: Colors.white,
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
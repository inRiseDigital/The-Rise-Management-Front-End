// import 'package:flutter/material.dart';
// import 'dart:async';
// import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

// class AIGrowDashboard extends StatefulWidget {
//   const AIGrowDashboard({Key? key}) : super(key: key);

//   @override
//   _AIGrowDashboardState createState() => _AIGrowDashboardState();
// }

// class _AIGrowDashboardState extends State<AIGrowDashboard> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isScrollingForward = true;
//   bool _userScrolling = false;

//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();

//     _scrollController.addListener(() {
//       if (!_userScrolling) {
//         if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent) {
//           setState(() => _isScrollingForward = false);
//         } else if (_scrollController.position.pixels == 0) {
//           setState(() => _isScrollingForward = true);
//         }
//       }
//     });
//   }

//   void _startAutoScroll() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
//       if (!_userScrolling && _scrollController.hasClients) {
//         final double maxScroll = _scrollController.position.maxScrollExtent;
//         final double currentScroll = _scrollController.position.pixels;
//         final double delta = 1.0;

//         if (_isScrollingForward) {
//           final double newScroll = currentScroll + delta;
//           if (newScroll >= maxScroll) {
//             _scrollController.jumpTo(0);
//           } else {
//             _scrollController.jumpTo(newScroll);
//           }
//         } else {
//           final double newScroll = currentScroll - delta;
//           if (newScroll <= 0) {
//             _scrollController.jumpTo(maxScroll);
//           } else {
//             _scrollController.jumpTo(newScroll);
//           }
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
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
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(24.0),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     margin: const EdgeInsets.all(16.0),
//                     child: const Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'AI Grow',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Total Budget',
//                           style: TextStyle(
//                             color: Color(0xFF666666),
//                             fontSize: 24,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           '\$10M',
//                           style: TextStyle(
//                             color: Color(0xFFB0AFFF),
//                             fontSize: 48,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 150,
//                     child: GestureDetector(
//                       onPanDown: (_) {
//                         setState(() => _userScrolling = true);
//                         _timer?.cancel();
//                       },
//                       onPanEnd: (_) {
//                         setState(() => _userScrolling = false);
//                         _startAutoScroll();
//                       },
//                       child: SingleChildScrollView(
//                         controller: _scrollController,
//                         scrollDirection: Axis.horizontal,
//                         physics: const BouncingScrollPhysics(),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             children: [
//                               _buildMonitoringCard(
//                                 'Humidity',
//                                 '75%',
//                                 Icons.water_drop,
//                               ),
//                               const SizedBox(width: 16),
//                               _buildMonitoringCard(
//                                 'Temperature',
//                                 '24°C',
//                                 Icons.thermostat,
//                               ),
//                               const SizedBox(width: 16),
//                               _buildMonitoringCard(
//                                 'Light',
//                                 '850',
//                                 Icons.light_mode,
//                               ),
//                               const SizedBox(width: 16),
//                               _buildMonitoringCard(
//                                 'CO2',
//                                 '400ppm',
//                                 Icons.cloud_outlined,
//                               ),
//                               const SizedBox(width: 16),
//                               _buildMonitoringCard(
//                                 'pH Level',
//                                 '6.5',
//                                 Icons.water,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     margin: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Fertigation Schedule',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         _buildScheduleCard('NPX Mix', '8.00 a.m'),
//                         const SizedBox(height: 16),
//                         _buildScheduleCard('Micro nutrients', '9.00 a.m'),
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
//           currentIndex: 0,
//           onTap: (index) {
//             if (index == 0) {
//               Navigator.pop(context);
//             }
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 24,
//                 child: Icon(Icons.home_outlined, color: Colors.black, size: 20),
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people_outline, size: 24),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.send_outlined, size: 24),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_outlined, size: 24),
//               label: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMonitoringCard(String title, String value, IconData icon) {
//     return Container(
//       width: 160,
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFFABABAB),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: Colors.black, size: 24),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScheduleCard(String title, String time) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFF2A2A2A),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.grey[800],
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(
//               Icons.attach_money,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           const Spacer(),
//           Text(
//             time,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget
import '../hrDashboard/hrDashboard.dart'; // Import the HRDashboard for navigation

class AIGrowDashboard extends StatefulWidget {
  const AIGrowDashboard({Key? key}) : super(key: key);

  @override
  _AIGrowDashboardState createState() => _AIGrowDashboardState();
}

class _AIGrowDashboardState extends State<AIGrowDashboard> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  bool _isScrollingForward = true;
  bool _userScrolling = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();

    _scrollController.addListener(() {
      if (!_userScrolling) {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          setState(() => _isScrollingForward = false);
        } else if (_scrollController.position.pixels == 0) {
          setState(() => _isScrollingForward = true);
        }
      }
    });
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!_userScrolling && _scrollController.hasClients) {
        final double maxScroll = _scrollController.position.maxScrollExtent;
        final double currentScroll = _scrollController.position.pixels;
        final double delta = 1.0;

        if (_isScrollingForward) {
          final double newScroll = currentScroll + delta;
          if (newScroll >= maxScroll) {
            _scrollController.jumpTo(0);
          } else {
            _scrollController.jumpTo(newScroll);
          }
        } else {
          final double newScroll = currentScroll - delta;
          if (newScroll <= 0) {
            _scrollController.jumpTo(maxScroll);
          } else {
            _scrollController.jumpTo(newScroll);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AIGrowDashboard()),
      );
    }
    // Add other navigation actions if needed
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.all(16.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AI Grow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Total Budget',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$10M',
                          style: TextStyle(
                            color: Color(0xFFB0AFFF),
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    child: GestureDetector(
                      onPanDown: (_) {
                        setState(() => _userScrolling = true);
                        _timer?.cancel();
                      },
                      onPanEnd: (_) {
                        setState(() => _userScrolling = false);
                        _startAutoScroll();
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              _buildMonitoringCard(
                                'Humidity',
                                '75%',
                                Icons.water_drop,
                              ),
                              const SizedBox(width: 16),
                              _buildMonitoringCard(
                                'Temperature',
                                '24°C',
                                Icons.thermostat,
                              ),
                              const SizedBox(width: 16),
                              _buildMonitoringCard(
                                'Light',
                                '850',
                                Icons.light_mode,
                              ),
                              const SizedBox(width: 16),
                              _buildMonitoringCard(
                                'CO2',
                                '400ppm',
                                Icons.cloud_outlined,
                              ),
                              const SizedBox(width: 16),
                              _buildMonitoringCard(
                                'pH Level',
                                '6.5',
                                Icons.water,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Fertigation Schedule',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildScheduleCard('NPX Mix', '8.00 a.m'),
                        const SizedBox(height: 16),
                        _buildScheduleCard('Micro nutrients', '9.00 a.m'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF666666),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.people_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.people_outline, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 2
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.send_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.send_outlined, size: 24),
              label: '',
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
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonitoringCard(String title, String value, IconData icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFABABAB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String title, String time) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

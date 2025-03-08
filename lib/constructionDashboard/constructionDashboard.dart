// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// class ConstructionDashboard extends StatefulWidget {
//   const ConstructionDashboard({Key? key}) : super(key: key);

//   @override
//   _ConstructionDashboardState createState() => _ConstructionDashboardState();
// }

// class _ConstructionDashboardState extends State<ConstructionDashboard> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const ConstructionDashboardScreen(),
//     const ProjectsScreen(),
//     const TeamScreen(),
//     const MaterialsScreen(),
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
//                         child: Icon(Icons.task, color: Colors.black, size: 20),
//                       )
//                       : const Icon(Icons.task, size: 24),
//               label: 'Tasks',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 1
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(
//                           Icons.business,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       )
//                       : const Icon(Icons.business, size: 24),
//               label: 'Projects',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 2
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(Icons.group, color: Colors.black, size: 20),
//                       )
//                       : const Icon(Icons.group, size: 24),
//               label: 'Team',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   _selectedIndex == 3
//                       ? const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 24,
//                         child: Icon(Icons.build, color: Colors.black, size: 20),
//                       )
//                       : const Icon(Icons.build, size: 24),
//               label: 'Materials',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConstructionDashboardScreen extends StatelessWidget {
//   const ConstructionDashboardScreen({Key? key}) : super(key: key);

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
//                   'Construction',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Project Overview',
//                   style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   '06',
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
//                 child: _buildMetricCard(
//                   'Active Projects',
//                   '03',
//                   Icons.construction,
//                 ),
//               ),
//               const SizedBox(width: 16), // Add horizontal spacing
//               Expanded(child: _buildMetricCard('Workers', '60', Icons.people)),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Active Projects',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle_outline, color: Colors.white),
//                 onPressed: () {
//                   // Handle add project
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildProjectItemCard(
//                   context,
//                   'New Office Block',
//                   '25/03/05',
//                   69,
//                 ),
//                 const SizedBox(height: 16), // Add vertical spacing
//                 _buildProjectItemCard(
//                   context,
//                   'New Office Block',
//                   '25/03/05',
//                   29,
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

//   Widget _buildProjectItemCard(
//     BuildContext context,
//     String title,
//     String dueDate,
//     int progress,
//   ) {
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
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Text(
//                     'Due: $dueDate',
//                     style: const TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Progress: $progress%',
//                 style: const TextStyle(color: Colors.white, fontSize: 14),
//               ),
//               const SizedBox(height: 4),
//               // Custom striped progress bar
//               Container(
//                 height: 10,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.grey,
//                 ),
//                 child: CustomPaint(
//                   painter: StripedProgressBarPainter(progress: progress),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StripedProgressBarPainter extends CustomPainter {
//   final int progress;

//   StripedProgressBarPainter({required this.progress});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..style = PaintingStyle.fill;

//     final stripeWidth = 10.0;
//     final stripeHeight = size.height;
//     final numStripes = (size.width / stripeWidth).ceil();

//     for (int i = 0; i < numStripes; i++) {
//       paint.color = i % 2 == 0 ? Colors.yellow : Colors.black;
//       final xOffset = i * stripeWidth;
//       canvas.drawRect(
//         Rect.fromLTWH(xOffset, 0, stripeWidth, stripeHeight),
//         paint,
//       );
//     }

//     // Clip the progress
//     canvas.save();
//     canvas.clipRect(
//       Rect.fromLTWH(0, 0, size.width * (progress / 100), size.height),
//     );
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class ProjectsScreen extends StatelessWidget {
//   const ProjectsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Projects Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
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

// class MaterialsScreen extends StatelessWidget {
//   const MaterialsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Materials Screen',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

class ConstructionDashboard extends StatefulWidget {
  const ConstructionDashboard({Key? key}) : super(key: key);

  @override
  _ConstructionDashboardState createState() => _ConstructionDashboardState();
}

class _ConstructionDashboardState extends State<ConstructionDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ConstructionDashboardScreen(),
    const ProjectsScreen(),
    const TeamScreen(),
    const MaterialsScreen(),
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
                        child: Icon(Icons.task, color: Colors.black, size: 20),
                      )
                      : const Icon(Icons.task, size: 24),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.business,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.business, size: 24),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 2
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(Icons.group, color: Colors.black, size: 20),
                      )
                      : const Icon(Icons.group, size: 24),
              label: 'Team',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 3
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(Icons.build, color: Colors.black, size: 20),
                      )
                      : const Icon(Icons.build, size: 24),
              label: 'Materials',
            ),
          ],
        ),
      ),
    );
  }
}

class ConstructionDashboardScreen extends StatelessWidget {
  const ConstructionDashboardScreen({Key? key}) : super(key: key);

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
                  'Construction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Project Overview',
                  style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '06',
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
                child: _buildMetricCard(
                  'Active Projects',
                  '03',
                  Icons.construction,
                ),
              ),
              const SizedBox(width: 16), // Add horizontal spacing
              Expanded(child: _buildMetricCard('Workers', '60', Icons.people)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Active Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                onPressed: () {
                  // Handle add project
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                _buildProjectItemCard(
                  context,
                  'New Office Block',
                  '25/03/05',
                  69,
                ),
                const SizedBox(height: 16), // Add vertical spacing
                _buildProjectItemCard(
                  context,
                  'New Office Block',
                  '25/03/05',
                  29,
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

  Widget _buildProjectItemCard(
    BuildContext context,
    String title,
    String dueDate,
    int progress,
  ) {
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
                  Text(
                    'Due: $dueDate',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Progress: $progress%',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 4),
              // Custom striped progress bar
              Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                child: CustomPaint(
                  painter: StripedProgressBarPainter(progress: progress),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StripedProgressBarPainter extends CustomPainter {
  final int progress;

  StripedProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final stripeWidth = 10.0;
    final stripeHeight = size.height;
    final numStripes = (size.width / stripeWidth).ceil();

    for (int i = 0; i < numStripes; i++) {
      paint.color = i % 2 == 0 ? Colors.yellow : Colors.black;
      final xOffset = i * stripeWidth;
      canvas.drawRect(
        Rect.fromLTWH(xOffset, 0, stripeWidth, stripeHeight),
        paint,
      );
    }

    // Clip the progress
    canvas.save();
    canvas.clipRect(
      Rect.fromLTWH(0, 0, size.width * (progress / 100), size.height),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Projects Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
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

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Materials Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

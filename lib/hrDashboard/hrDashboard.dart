// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class HRDashboard extends StatelessWidget {
//   const HRDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isSmallScreen = screenSize.width < 600;

//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: Column(
//         children: [
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20.0,
//                 vertical: 10.0,
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed:
//                         () =>
//                             Navigator.pop(context), // Back button functionality
//                   ),
//                   const SizedBox(width: 10),
//                   Text(
//                     'HR Dashboard',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: isSmallScreen ? 24 : 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Text(
//             'Total Employees : 255',
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: isSmallScreen ? 14 : 16,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey[800]!, width: 1),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildInfoCard(
//                         Colors.purple,
//                         'Payroll Due',
//                         '\$100K',
//                       ),
//                     ),
//                     Expanded(
//                       child: _buildInfoCard(
//                         Colors.orange,
//                         'Leave Request',
//                         '10',
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildInfoCard(
//                         Colors.green,
//                         'Employees on site',
//                         '200',
//                       ),
//                     ),
//                     Expanded(
//                       child: _buildInfoCard(Colors.red, 'On leave', '55'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: isSmallScreen ? 180 : 220,
//                     height: isSmallScreen ? 180 : 220,
//                     child: CustomPaint(painter: DonutChartPainter()),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildLegendItem('Employees on site', Colors.green),
//                       const SizedBox(width: 20),
//                       _buildLegendItem('On leave', Colors.red),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               border: Border(
//                 top: BorderSide(color: Colors.grey[900]!, width: 1),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildNavItem(
//                   Icons.home_outlined,
//                   () => _onNavItemTap(context, 'Home'),
//                 ),
//                 _buildNavItem(
//                   Icons.people_outline,
//                   () => _onNavItemTap(context, 'Employees'),
//                 ),
//                 _buildNavItem(
//                   Icons.logout,
//                   () => _onNavItemTap(context, 'Logout'),
//                 ),
//                 _buildNavItem(
//                   Icons.insert_drive_file_outlined,
//                   () => _onNavItemTap(context, 'Documents'),
//                 ),
//                 _buildNavItem(Icons.menu, () => _onNavItemTap(context, 'Menu')),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard(Color dotColor, String title, String value) {
//     return GestureDetector(
//       onTap: () {
//         debugPrint('$title card tapped!');
//       },
//       child: Container(
//         margin: const EdgeInsets.all(8.0),
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.grey[900],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 8,
//                   height: 8,
//                   decoration: BoxDecoration(
//                     color: dotColor,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: const TextStyle(color: Colors.grey, fontSize: 14),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             FittedBox(
//               fit: BoxFit.scaleDown,
//               child: Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLegendItem(String text, Color color) {
//     return Row(
//       children: [
//         Container(
//           width: 8,
//           height: 8,
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//         ),
//         const SizedBox(width: 8),
//         Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
//       ],
//     );
//   }

//   Widget _buildNavItem(IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Icon(icon, color: Colors.white, size: 24),
//     );
//   }

//   void _onNavItemTap(BuildContext context, String destination) {
//     debugPrint('Navigating to $destination');
//   }
// }

// class DonutChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;

//     final total = 255.0, onLeave = 55.0;
//     final greenPaint =
//         Paint()
//           ..color = Colors.green
//           ..style = PaintingStyle.fill;
//     final redPaint =
//         Paint()
//           ..color = Colors.red
//           ..style = PaintingStyle.fill;
//     final holePaint =
//         Paint()
//           ..color = Colors.black
//           ..style = PaintingStyle.fill;

//     final startAngle = -math.pi / 2;
//     final redAngle = (onLeave / total) * 2 * math.pi;
//     final greenAngle = (200 / total) * 2 * math.pi;

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       redAngle,
//       true,
//       redPaint,
//     );
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle + redAngle,
//       greenAngle,
//       true,
//       greenPaint,
//     );
//     canvas.drawCircle(center, radius * 0.35, holePaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HRDashboard extends StatelessWidget {
  const HRDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'HR Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Total Employees : 255',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            Colors.purple,
                            'Payroll Due',
                            '\$100K',
                          ),
                        ),
                        Expanded(
                          child: _buildInfoCard(
                            Colors.orange,
                            'Leave Request',
                            '10',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            Colors.blue,
                            'Employees on site',
                            '200',
                          ),
                        ),
                        Expanded(
                          child: _buildInfoCard(Colors.red, 'On leave', '55'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: isSmallScreen ? 90 : 110,
                              lineWidth: 13.0,
                              percent: 200 / 255,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Employees on site",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "78%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: Colors.grey.shade800,
                              linearGradient: const LinearGradient(
                                colors: [Colors.blue, Colors.red],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildLegendItem(
                                  'Employees on site',
                                  Colors.blue,
                                ),
                                const SizedBox(width: 20),
                                _buildLegendItem('On leave', Colors.red),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(Color dotColor, String title, String value) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.grey[900]!, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_outlined),
          _buildNavItem(Icons.people_outline),
          _buildNavItem(Icons.logout),
          _buildNavItem(Icons.insert_drive_file_outlined),
          _buildNavItem(Icons.menu),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}

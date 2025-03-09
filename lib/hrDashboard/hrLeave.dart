// import 'package:flutter/material.dart';
// import 'dart:ui'; // Import the dart:ui package for ImageFilter
// import 'widgets/requestLeaveScreen.dart';
// import 'widgets/viewAllLeavesScreen.dart';
// import 'widgets/approveLeaveScreen.dart';
// import 'widgets/updateLeaveScreen.dart';
// import 'widgets/leavesByDateScreen.dart';

// class LeaveScreen extends StatelessWidget {
//   const LeaveScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF131314),
//         title: const Text('Leave'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 24),
//                 _buildMetricCard(
//                   icon: Icons.event_note_outlined,
//                   title: 'Leave Requests',
//                   value: '10',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.person_outline_outlined,
//                   title: 'Employees on Leave',
//                   value: '50',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.check_circle_outline,
//                   title: 'Approved Leaves',
//                   value: '45',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.cancel_outlined,
//                   title: 'Rejected Leaves',
//                   value: '5',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMetricCard(
//                   icon: Icons.pending_actions_outlined,
//                   title: 'Pending Approvals',
//                   value: '3',
//                 ),
//                 const SizedBox(height: 24),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Request Leave',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const RequestLeaveScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'View All Leaves',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ViewAllLeavesScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Approve Leave',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ApproveLeaveScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Update Leave',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const UpdateLeaveScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Leaves By Date',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LeavesByDateScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ),
//       ),
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

//   Widget _buildActionButton({
//     required BuildContext context,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         gradient: const LinearGradient(
//           colors: [Color(0xFF2E2E30), Color(0xFF1A1A1C)],
//         ),
//         border: Border.all(color: Colors.white24),
//       ),
//       child: TextButton(
//         onPressed: onPressed,
//         child: Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui'; // Import the dart:ui package for ImageFilter
import 'widgets/requestLeaveScreen.dart';
import 'widgets/viewAllLeavesScreen.dart';
import 'widgets/approveLeaveScreen.dart';
import 'widgets/updateLeaveScreen.dart';
import 'widgets/leavesByDateScreen.dart';
// import 'widgets/dailyUpdateScreen.dart'; // New widget for daily update

// Endpoints used:
// POST    /leaves/request           - Request Leave
// GET     /leaves/{leave_id}         - Get Leave
// GET     /leaves/                  - Get All Leaves
// PUT     /leaves/update/{leave_id}   - Update Leave
// PUT     /leaves/approve/{leave_id}  - Approve Leave
// GET     /leaves/date/{query_date}   - Leaves By Date
// POST    /leaves/daily_update/add    - Add Daily Update

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131314),
        title: const Text('Leave'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _buildMetricCard(
                  icon: Icons.event_note_outlined,
                  title: 'Leave Requests',
                  value: '10',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.person_outline_outlined,
                  title: 'Employees on Leave',
                  value: '50',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.check_circle_outline,
                  title: 'Approved Leaves',
                  value: '45',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.cancel_outlined,
                  title: 'Rejected Leaves',
                  value: '5',
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  icon: Icons.pending_actions_outlined,
                  title: 'Pending Approvals',
                  value: '3',
                ),
                const SizedBox(height: 24),
                _buildActionButton(
                  context: context,
                  label: 'Request Leave',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RequestLeaveScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  context: context,
                  label: 'View All Leaves',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewAllLeavesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  context: context,
                  label: 'Approve Leave',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApproveLeaveScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  context: context,
                  label: 'Update Leave',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateLeaveScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  context: context,
                  label: 'Leaves By Date',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeavesByDateScreen(),
                      ),
                    );
                  },
                ),
                // const SizedBox(height: 16),
                // _buildActionButton(
                //   context: context,
                //   label: 'Add Daily Update',
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const DailyUpdateScreen(),
                //       ),
                //     );
                //   },
                // ),
                const SizedBox(height: 80),
              ],
            ),
          ),
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

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF2E2E30), Color(0xFF1A1A1C)],
        ),
        border: Border.all(color: Colors.white24),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

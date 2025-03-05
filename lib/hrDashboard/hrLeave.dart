// import 'package:flutter/material.dart';
// import 'dart:ui'; // Import the dart:ui package for ImageFilter
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class LeaveScreen extends StatelessWidget {
//   const LeaveScreen({Key? key}) : super(key: key);

//   final String _baseUrl = 'https://game-parrot-trivially.ngrok-free.app/leaves';

//   Future<void> _requestLeave(BuildContext context) async {
//     // Implement request leave logic
//     final response = await http.post(
//       Uri.parse('$_baseUrl/request'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'leave_type': 'sick', 'duration': '2 days'}),
//     );

//     if (response.statusCode == 200) {
//       _showDialog(context, 'Success', 'Leave requested successfully.');
//     } else {
//       _showDialog(context, 'Error', 'Failed to request leave.');
//     }
//   }

//   Future<void> _viewAllLeaves(BuildContext context) async {
//     // Implement view all leaves logic
//     final response = await http.get(
//       Uri.parse(_baseUrl),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       _showDialog(context, 'All Leaves', data.toString());
//     } else {
//       _showDialog(context, 'Error', 'Failed to fetch leaves.');
//     }
//   }

//   Future<void> _approveLeave(BuildContext context, String leaveId) async {
//     // Implement approve leave logic
//     final response = await http.put(
//       Uri.parse('$_baseUrl/approve/$leaveId'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       _showDialog(context, 'Success', 'Leave approved successfully.');
//     } else {
//       _showDialog(context, 'Error', 'Failed to approve leave.');
//     }
//   }

//   Future<void> _updateLeave(BuildContext context, String leaveId) async {
//     // Implement update leave logic
//     final response = await http.put(
//       Uri.parse('$_baseUrl/update/$leaveId'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'leave_type': 'vacation', 'duration': '5 days'}),
//     );

//     if (response.statusCode == 200) {
//       _showDialog(context, 'Success', 'Leave updated successfully.');
//     } else {
//       _showDialog(context, 'Error', 'Failed to update leave.');
//     }
//   }

//   Future<void> _leavesByDate(BuildContext context, String queryDate) async {
//     // Implement leaves by date logic
//     final response = await http.get(
//       Uri.parse('$_baseUrl/date/$queryDate'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       _showDialog(context, 'Leaves on $queryDate', data.toString());
//     } else {
//       _showDialog(context, 'Error', 'Failed to fetch leaves by date.');
//     }
//   }

//   void _showDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: Text(title),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//     );
//   }

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
//                   onPressed: () => _requestLeave(context),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'View All Leaves',
//                   onPressed: () => _viewAllLeaves(context),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Approve Leave',
//                   onPressed:
//                       () => _approveLeave(
//                         context,
//                         'leave_id',
//                       ), // Replace 'leave_id' with actual leave ID
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Update Leave',
//                   onPressed:
//                       () => _updateLeave(
//                         context,
//                         'leave_id',
//                       ), // Replace 'leave_id' with actual leave ID
//                 ),
//                 const SizedBox(height: 16),
//                 _buildActionButton(
//                   context: context,
//                   label: 'Leaves By Date',
//                   onPressed:
//                       () => _leavesByDate(
//                         context,
//                         '2025-03-05',
//                       ), // Replace '2025-03-05' with actual query date
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

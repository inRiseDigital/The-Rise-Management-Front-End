// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ViewAllLeavesScreen extends StatefulWidget {
//   const ViewAllLeavesScreen({Key? key}) : super(key: key);

//   @override
//   _ViewAllLeavesScreenState createState() => _ViewAllLeavesScreenState();
// }

// class _ViewAllLeavesScreenState extends State<ViewAllLeavesScreen> {
//   final String _baseUrl =
//       'https://game-parrot-trivially.ngrok-free.app/leaves/';
//   List<dynamic> _leaveRequests = [];
//   bool _isLoading = false;

//   Future<void> _viewAllLeaves() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse(_baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization':
//               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2ZWVuYXRodyIsInJvbGUiOiJIUiIsImVtYWlsIjoidmVlbmF0aHdAZ21haWwuY29tIiwic2Vzc2lvbl9pZCI6IjY4NGFmOWJhLTA2MDktNDA0Ny1hMDE5LWQ2NzUzMjA0OGY0OCIsImV4cCI6MTc0MTUxNTgxNX0.h_mFof1GLtO-sKSVZDzSHetq1KTIXXN5FVqhcjceueI',
//         },
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           _leaveRequests = jsonDecode(response.body);
//         });
//       } else {
//         print('Failed to fetch leaves. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         _showDialog(
//           context,
//           'Error',
//           'Failed to fetch leaves. Status code: ${response.statusCode}\nResponse body: ${response.body}',
//         );
//       }
//     } catch (e) {
//       print('An error occurred: $e');
//       _showDialog(context, 'Error', 'An error occurred: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
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
//   void initState() {
//     super.initState();
//     _viewAllLeaves();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF131314),
//         title: const Text('View All Leaves'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child:
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : _leaveRequests.isEmpty
//                 ? const Center(
//                   child: Text(
//                     'No leave requests found.',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//                 : ListView.builder(
//                   padding: const EdgeInsets.all(16.0),
//                   itemCount: _leaveRequests.length,
//                   itemBuilder: (context, index) {
//                     final leave = _leaveRequests[index];
//                     return _buildLeaveCard(leave);
//                   },
//                 ),
//       ),
//     );
//   }

//   Widget _buildLeaveCard(Map<String, dynamic> leave) {
//     return Card(
//       color: const Color(0xFF1A1A1C),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Leave ID: ${leave['leave_id']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Leave Type: ${leave['leave_type']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Reason: ${leave['reason']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Start Date: ${leave['start_date']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'End Date: ${leave['end_date']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Number of Days: ${leave['number_of_days']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Status: ${leave['status']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Employee Name: ${leave['employee']['employee_name']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Employee Address: ${leave['employee']['employee_address']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Employee Contact: ${leave['employee']['employee_contact']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Employee DOB: ${leave['employee']['employee_dob']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Employee NIC No: ${leave['employee']['employee_nic_no']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Department: ${leave['employee']['department']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Occupation: ${leave['employee']['occupation']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Created At: ${leave['created_at']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewAllLeavesScreen extends StatefulWidget {
  const ViewAllLeavesScreen({Key? key}) : super(key: key);

  @override
  _ViewAllLeavesScreenState createState() => _ViewAllLeavesScreenState();
}

class _ViewAllLeavesScreenState extends State<ViewAllLeavesScreen> {
  final String _baseUrl =
      'https://game-parrot-trivially.ngrok-free.app/leaves/';
  List<dynamic> _leaveRequests = [];
  bool _isLoading = false;

  Future<void> _viewAllLeaves() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2ZWVuYXRodyIsInJvbGUiOiJIUiIsImVtYWlsIjoidmVlbmF0aHdAZ21haWwuY29tIiwic2Vzc2lvbl9pZCI6IjY4NGFmOWJhLTA2MDktNDA0Ny1hMDE5LWQ2NzUzMjA0OGY0OCIsImV4cCI6MTc0MTUxNTgxNX0.h_mFof1GLtO-sKSVZDzSHetq1KTIXXN5FVqhcjceueI',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _leaveRequests = jsonDecode(response.body);
        });
      } else {
        print('Failed to fetch leaves. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        _showDialog(
          context,
          'Error',
          'Failed to fetch leaves. Status code: ${response.statusCode}\nResponse body: ${response.body}',
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      _showDialog(context, 'Error', 'An error occurred: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewAllLeaves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131314),
        title: const Text('View All Leaves'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _leaveRequests.isEmpty
                ? const Center(
                  child: Text(
                    'No leave requests found.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _leaveRequests.length,
                  itemBuilder: (context, index) {
                    final leave = _leaveRequests[index];
                    return _buildLeaveCard(leave);
                  },
                ),
      ),
    );
  }

  Widget _buildLeaveCard(Map<String, dynamic> leave) {
    return Card(
      color: const Color(0xFF1A1A1C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLeaveDetail('Leave Type', leave['leave_type']),
            _buildLeaveDetail('Reason', leave['reason']),
            _buildLeaveDetail('Start Date', leave['start_date']),
            _buildLeaveDetail('End Date', leave['end_date']),
            _buildLeaveDetail(
              'Number of Days',
              leave['number_of_days'].toString(),
            ),
            _buildLeaveDetail('Status', leave['status']),
            _buildLeaveDetail(
              'Employee Name',
              leave['employee']['employee_name'],
            ),
            _buildLeaveDetail(
              'Employee Address',
              leave['employee']['employee_address'],
            ),
            _buildLeaveDetail(
              'Employee Contact',
              leave['employee']['employee_contact'],
            ),
            _buildLeaveDetail(
              'Employee DOB',
              leave['employee']['employee_dob'],
            ),
            _buildLeaveDetail(
              'Employee NIC No',
              leave['employee']['employee_nic_no'],
            ),
            _buildLeaveDetail('Department', leave['employee']['department']),
            _buildLeaveDetail('Occupation', leave['employee']['occupation']),
            _buildLeaveDetail('Created At', leave['created_at']),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RequestLeaveScreen extends StatefulWidget {
//   const RequestLeaveScreen({Key? key}) : super(key: key);

//   @override
//   _RequestLeaveScreenState createState() => _RequestLeaveScreenState();
// }

// class _RequestLeaveScreenState extends State<RequestLeaveScreen> {
//   final String _baseUrl =
//       'https://game-parrot-trivially.ngrok-free.app/leaves/request';
//   List<dynamic> _leaveRequests = [];
//   bool _isLoading = false;

//   // Bearer token added here:
//   final String _bearerToken =
//       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2ZWVuYXRodyIsInJvbGUiOiJIUiIsImVtYWlsIjoidmVlbmF0aHdAZ21haWwuY29tIiwic2Vzc2lvbl9pZCI6IjY4NGFmOWJhLTA2MDktNDA0Ny1hMDE5LWQ2NzUzMjA0OGY0OCIsImV4cCI6MTc0MTUxNTgxNX0.h_mFof1GLtO-sKSVZDzSHetq1KTIXXN5FVqhcjceueI';

//   final TextEditingController _employeeIdController = TextEditingController();
//   final TextEditingController _leaveTypeController = TextEditingController();
//   final TextEditingController _reasonController = TextEditingController();
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _endDateController = TextEditingController();

//   Future<void> _requestLeave() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse(_baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': _bearerToken,
//       },
//       body: jsonEncode({
//         'employee_id': int.parse(_employeeIdController.text),
//         'leave_type': _leaveTypeController.text,
//         'reason': _reasonController.text,
//         'start_date': _startDateController.text,
//         'end_date': _endDateController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       _showDialog(
//         context,
//         'Success',
//         'Leave requested successfully.\n\nResponse Data:\n$data',
//       );
//       _fetchLeaveRequests();
//     } else {
//       _showDialog(context, 'Error', 'Failed to request leave.');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> _fetchLeaveRequests() async {
//     final response = await http.get(
//       Uri.parse(_baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': _bearerToken,
//       },
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         _leaveRequests = jsonDecode(response.body);
//       });
//     } else {
//       _showDialog(context, 'Error', 'Failed to fetch leave requests.');
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
//     _fetchLeaveRequests();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF131314),
//         title: const Text('Request Leave'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child:
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : SingleChildScrollView(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       _buildTextField(
//                         controller: _employeeIdController,
//                         label: 'Employee ID',
//                         keyboardType: TextInputType.number,
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: _leaveTypeController,
//                         label: 'Leave Type',
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: _reasonController,
//                         label: 'Reason',
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: _startDateController,
//                         label: 'Start Date (YYYY-MM-DD)',
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: _endDateController,
//                         label: 'End Date (YYYY-MM-DD)',
//                       ),
//                       const SizedBox(height: 24),
//                       _buildActionButton(
//                         context: context,
//                         label: 'Request Leave',
//                         onPressed: _requestLeave,
//                       ),
//                       const SizedBox(height: 24),
//                       const Text(
//                         'Leave Requests',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       const SizedBox(height: 16),
//                       _leaveRequests.isEmpty
//                           ? const Text(
//                             'No leave requests found.',
//                             style: TextStyle(color: Colors.white),
//                           )
//                           : ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: _leaveRequests.length,
//                             itemBuilder: (context, index) {
//                               final leave = _leaveRequests[index];
//                               return _buildLeaveCard(leave);
//                             },
//                           ),
//                     ],
//                   ),
//                 ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white54),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white24),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         filled: true,
//         fillColor: const Color(0xFF1A1A1C),
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
//               'Leave ID: ${leave['id']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Leave Type: ${leave['leave_type']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Duration: ${leave['duration']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Status: ${leave['status']}',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ],
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
import 'package:flutter_application_1/bearerToken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import ''; // Import the bearer token

class RequestLeaveScreen extends StatefulWidget {
  const RequestLeaveScreen({Key? key}) : super(key: key);

  @override
  _RequestLeaveScreenState createState() => _RequestLeaveScreenState();
}

class _RequestLeaveScreenState extends State<RequestLeaveScreen> {
  final String _baseUrl =
      'https://game-parrot-trivially.ngrok-free.app/leaves/request';
  List<dynamic> _leaveRequests = [];
  bool _isLoading = false;

  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  Future<void> _requestLeave() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': bearerToken, // Use the imported bearer token
      },
      body: jsonEncode({
        'employee_id': int.parse(_employeeIdController.text),
        'leave_type': _leaveTypeController.text,
        'reason': _reasonController.text,
        'start_date': _startDateController.text,
        'end_date': _endDateController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _showDialog(
        context,
        'Success',
        'Leave requested successfully.\n\nResponse Data:\n$data',
      );
      _fetchLeaveRequests();
    } else {
      _showDialog(context, 'Error', 'Failed to request leave.');
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _fetchLeaveRequests() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': bearerToken, // Use the imported bearer token
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _leaveRequests = jsonDecode(response.body);
      });
    } else {
      _showDialog(context, 'Error', 'Failed to fetch leave requests.');
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
    _fetchLeaveRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131314),
        title: const Text('Request Leave'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _employeeIdController,
                        label: 'Employee ID',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _leaveTypeController,
                        label: 'Leave Type',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _reasonController,
                        label: 'Reason',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _startDateController,
                        label: 'Start Date (YYYY-MM-DD)',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _endDateController,
                        label: 'End Date (YYYY-MM-DD)',
                      ),
                      const SizedBox(height: 24),
                      _buildActionButton(
                        context: context,
                        label: 'Request Leave',
                        onPressed: _requestLeave,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Leave Requests',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      _leaveRequests.isEmpty
                          ? const Text(
                            'No leave requests found.',
                            style: TextStyle(color: Colors.white),
                          )
                          : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _leaveRequests.length,
                            itemBuilder: (context, index) {
                              final leave = _leaveRequests[index];
                              return _buildLeaveCard(leave);
                            },
                          ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color(0xFF1A1A1C),
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
            Text(
              'Leave ID: ${leave['id']}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Leave Type: ${leave['leave_type']}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Duration: ${leave['duration']}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${leave['status']}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
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

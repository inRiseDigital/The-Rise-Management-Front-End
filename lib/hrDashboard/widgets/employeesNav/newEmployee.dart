// import 'package:flutter/material.dart';

// class NewEmployee extends StatefulWidget {
//   const NewEmployee({Key? key}) : super(key: key);

//   @override
//   State<NewEmployee> createState() => _NewEmployeeState();
// }

// class _NewEmployeeState extends State<NewEmployee> {
//   final TextEditingController _nicController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();

//   @override
//   void dispose() {
//     _nicController.dispose();
//     _emailController.dispose();
//     _mobileController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E1E),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const SizedBox(width: 16),
//                     const Text(
//                       'New Employee',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               _buildInputField(
//                 Icons.person,
//                 'NIC',
//                 'Enter Employee NIC',
//                 _nicController,
//               ),
//               const Divider(color: Colors.grey),
//               _buildInputField(
//                 Icons.email,
//                 'Email',
//                 'Enter Employee Email',
//                 _emailController,
//               ),
//               const Divider(color: Colors.grey),
//               _buildInputField(
//                 Icons.phone,
//                 'Mobile',
//                 'Enter Employee Mobile number',
//                 _mobileController,
//               ),
//               const Divider(color: Colors.grey),
//               _buildInputField(
//                 Icons.location_on,
//                 'Address',
//                 'Enter Employee Address',
//                 _addressController,
//               ),
//               const Divider(color: Colors.grey),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Clear all fields
//                         _nicController.clear();
//                         _emailController.clear();
//                         _mobileController.clear();
//                         _addressController.clear();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: const Text('Clear'),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle add employee logic
//                         // You can access the values using the controllers
//                         // For example: _nicController.text, _emailController.text, etc.

//                         // After adding, navigate back
//                         Navigator.pop(context, {
//                           'nic': _nicController.text,
//                           'email': _emailController.text,
//                           'mobile': _mobileController.text,
//                           'address': _addressController.text,
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: const Text('Add Employee'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(
//     IconData icon,
//     String label,
//     String hint,
//     TextEditingController controller,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(icon, color: Colors.white, size: 20),
//           const SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14),
//               ),
//               const SizedBox(height: 4),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width - 80,
//                 child: TextField(
//                   controller: controller,
//                   style: const TextStyle(color: Colors.white, fontSize: 18),
//                   decoration: InputDecoration(
//                     hintText: hint,
//                     hintStyle: TextStyle(
//                       color: Colors.grey.withOpacity(0.5),
//                       fontSize: 16,
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bearerToken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import ''; // Import the bearer token

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _dobController.dispose();
    _nicController.dispose();
    _departmentController.dispose();
    _occupationController.dispose();
    super.dispose();
  }

  Future<void> _addEmployee() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://game-parrot-trivially.ngrok-free.app/hr/employee/add'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': bearerToken, // Use the imported bearer token
      },
      body: jsonEncode({
        'employee_name': _nameController.text,
        'employee_address': _addressController.text,
        'employee_contact': _contactController.text,
        'employee_dob': _dobController.text,
        'employee_nic_no': _nicController.text,
        'department': _departmentController.text,
        'occupation': _occupationController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      _showDialog(context, 'Success', 'Employee added successfully.');
      Navigator.pop(context);
    } else {
      print('Failed to add employee. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      _showDialog(
        context,
        'Error',
        'Failed to add employee. Status code: ${response.statusCode}\nResponse body: ${response.body}',
      );
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'New Employee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildInputField(
                Icons.person,
                'Name',
                'Enter Employee Name',
                _nameController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.location_on,
                'Address',
                'Enter Employee Address',
                _addressController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.phone,
                'Contact',
                'Enter Employee Contact',
                _contactController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.calendar_today,
                'Date of Birth',
                'Enter Employee DOB (YYYY-MM-DD)',
                _dobController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.badge,
                'NIC',
                'Enter Employee NIC',
                _nicController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.business,
                'Department',
                'Enter Employee Department',
                _departmentController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.work,
                'Occupation',
                'Enter Employee Occupation',
                _occupationController,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear all fields
                        _nameController.clear();
                        _addressController.clear();
                        _contactController.clear();
                        _dobController.clear();
                        _nicController.clear();
                        _departmentController.clear();
                        _occupationController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Clear'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _addEmployee,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                              : const Text('Add Employee'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    IconData icon,
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

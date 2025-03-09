// import 'package:flutter/material.dart';
// import 'employeeProfile.dart'; // Import the EmployeeProfile screen
// import 'newEmployee.dart'; // Import the NewEmployee screen

// class EmployeesNav extends StatelessWidget {
//   const EmployeesNav({Key? key}) : super(key: key);

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
//                   color: Colors.black, // Change background color to black
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Employee',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const NewEmployee(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             width: 36,
//                             height: 36,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.add, color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0,
//                         vertical: 12.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.black, // Change background color to black
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButtonFormField<String>(
//                           dropdownColor: Colors.black,
//                           value: 'Department',
//                           items:
//                               <String>[
//                                 'Department',
//                                 'HR',
//                                 'Finance',
//                                 'Marketing',
//                                 'AI Grow',
//                                 'CCTV Monitoring',
//                                 'Inventory Management',
//                                 'Procurement',
//                                 'Cleaning and Maintenance',
//                                 'Kitchen Management',
//                                 'Construction Management',
//                               ].map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(
//                                     value,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 );
//                               }).toList(),
//                           onChanged: (String? newValue) {
//                             // Handle department change
//                           },
//                           icon: const Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.white,
//                           ),
//                           decoration: const InputDecoration.collapsed(
//                             hintText: '',
//                           ),
//                           isExpanded: true,
//                           menuMaxHeight:
//                               200, // Set the max height for the dropdown menu
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3A3A3A),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search Employees ...',
//                     hintStyle: const TextStyle(color: Color(0xFF3A3A3A)),
//                     filled: true,
//                     fillColor: const Color(
//                       0xFF989898,
//                     ), // Change background color
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: const Icon(Icons.search, color: Color(0xFF3A3A3A)),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const EmployeeProfile(),
//                           ),
//                         );
//                       },
//                       child: _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const EmployeeProfile(),
//                           ),
//                         );
//                       },
//                       child: _buildEmployeeCard(
//                         'Kaveen',
//                         'Senior UI/UX Designer',
//                       ),
//                     ),
//                     _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
//                     _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
//                     _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEmployeeCard(String name, String position) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF3A3A3A),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(Icons.person, color: Colors.black),
//           ),
//           const SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 position,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'employeeProfile.dart'; // Import the EmployeeProfile screen
import 'newEmployee.dart'; // Import the NewEmployee screen

// Employee model with fromJson constructor
class Employee {
  final String employeeName;
  final String employeeAddress;
  final String employeeContact;
  final String employeeDob;
  final String employeeNicNo;
  final String department;
  final String occupation;

  Employee({
    required this.employeeName,
    required this.employeeAddress,
    required this.employeeContact,
    required this.employeeDob,
    required this.employeeNicNo,
    required this.department,
    required this.occupation,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeName: json['employee_name'] as String,
      employeeAddress: json['employee_address'] as String,
      employeeContact: json['employee_contact'] as String,
      employeeDob: json['employee_dob'] as String,
      employeeNicNo: json['employee_nic_no'] as String,
      department: json['department'] as String,
      occupation: json['occupation'] as String,
    );
  }
}

class EmployeesNav extends StatelessWidget {
  const EmployeesNav({Key? key}) : super(key: key);

  // Function to fetch employees from the ngrok endpoint with debugging prints
  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(
        Uri.parse('https://game-parrot-trivially.ngrok-free.app/hr/employees'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2ZWVuYXRodyIsInJvbGUiOiJIUiIsImVtYWlsIjoidmVlbmF0aHdAZ21haWwuY29tIiwic2Vzc2lvbl9pZCI6IjZkZDgxNTE3LTg0NDMtNDRjZS04MDBiLTlkMjM1MDNiYzcwMSIsImV4cCI6MTc0MTUxMjI0NX0.PvoG3moWOMmHk0z87KKvMTm6e6vvVedHoVIWuhk7rVs",
        },
      );

      // Debug prints
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Employee.fromJson(item)).toList();
      } else {
        throw Exception(
          'Failed to load employees. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print("Error fetching employees: $e");
      throw Exception('Failed to load employees: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header container with title and add button
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Employee',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewEmployee(),
                              ),
                            );
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          value: 'Department',
                          items:
                              <String>[
                                'Department',
                                'HR',
                                'Finance',
                                'Marketing',
                                'AI Grow',
                                'CCTV Monitoring',
                                'Inventory Management',
                                'Procurement',
                                'Cleaning and Maintenance',
                                'Kitchen Management',
                                'Construction Management',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            // Handle department change if needed
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration.collapsed(
                            hintText: '',
                          ),
                          isExpanded: true,
                          menuMaxHeight: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Employees ...',
                    hintStyle: const TextStyle(color: Color(0xFF3A3A3A)),
                    filled: true,
                    fillColor: const Color(0xFF989898),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Icon(Icons.search, color: Color(0xFF3A3A3A)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Expanded list of employees using FutureBuilder
              Expanded(
                child: FutureBuilder<List<Employee>>(
                  future: fetchEmployees(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final employees = snapshot.data!;
                      return ListView.builder(
                        itemCount: employees.length,
                        itemBuilder: (context, index) {
                          final employee = employees[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmployeeProfile(),
                                ),
                              );
                            },
                            child: _buildEmployeeCard(
                              employee.employeeName,
                              employee.occupation,
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No data available',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Employee card widget
  Widget _buildEmployeeCard(String name, String position) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                position,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Main function to run the app
void main() {
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const EmployeesNav(),
    );
  }
}

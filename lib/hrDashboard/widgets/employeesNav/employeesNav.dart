// import 'dart:convert';
// import 'dart:math'; // Needed for polar coordinate calculations
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/bearerToken.dart';
// import 'package:http/http.dart' as http;
// import ''; // Import the bearer token
// import 'employeeProfile.dart'; // Import the EmployeeProfile screen
// import 'newEmployee.dart'; // Import the NewEmployee screen

// // Employee model with fromJson constructor
// class Employee {
//   final String employeeName;
//   final String employeeAddress;
//   final String employeeContact;
//   final String employeeDob;
//   final String employeeNicNo;
//   final String department;
//   final String occupation;

//   Employee({
//     required this.employeeName,
//     required this.employeeAddress,
//     required this.employeeContact,
//     required this.employeeDob,
//     required this.employeeNicNo,
//     required this.department,
//     required this.occupation,
//   });

//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       employeeName: json['employee_name'] as String,
//       employeeAddress: json['employee_address'] as String,
//       employeeContact: json['employee_contact'] as String,
//       employeeDob: json['employee_dob'] as String,
//       employeeNicNo: json['employee_nic_no'] as String,
//       department: json['department'] as String,
//       occupation: json['occupation'] as String,
//     );
//   }
// }

// class EmployeesNav extends StatefulWidget {
//   const EmployeesNav({Key? key}) : super(key: key);

//   @override
//   _EmployeesNavState createState() => _EmployeesNavState();
// }

// class _EmployeesNavState extends State<EmployeesNav>
//     with SingleTickerProviderStateMixin {
//   // Loader animation properties for custom circular loader effect
//   late AnimationController _loaderController;
//   final int _numDots = 5;
//   final List<Color> _loaderColors = [
//     const Color(0xFF4285F4), // Blue
//     const Color(0xFFEA4335), // Red
//     const Color(0xFFFBBC05), // Yellow
//     const Color(0xFF34A853), // Green
//     const Color(0xFF4285F4), // Blue (repeat)
//   ];

//   final TextEditingController _searchController = TextEditingController();
//   List<Employee> _employees = [];
//   List<Employee> _filteredEmployees = [];

//   @override
//   void initState() {
//     super.initState();
//     _loaderController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat();
//     _fetchEmployees();
//   }

//   @override
//   void dispose() {
//     _loaderController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   // Function to fetch employees from the ngrok endpoint with debugging prints
//   Future<void> _fetchEmployees() async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://game-parrot-trivially.ngrok-free.app/hr/employees'),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": bearerToken, // Use the imported bearer token
//         },
//       );

//       // Debug prints
//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");

//       if (response.statusCode == 200) {
//         List<dynamic> jsonData = json.decode(response.body);
//         setState(() {
//           _employees = jsonData.map((item) => Employee.fromJson(item)).toList();
//           _filteredEmployees = _employees;
//         });
//       } else {
//         throw Exception(
//           'Failed to load employees. Status code: ${response.statusCode}',
//         );
//       }
//     } catch (e) {
//       print("Error fetching employees: $e");
//       throw Exception('Failed to load employees: $e');
//     }
//   }

//   void _filterEmployees(String query) {
//     setState(() {
//       _filteredEmployees =
//           _employees
//               .where(
//                 (employee) =>
//                     employee.employeeName.toLowerCase().contains(
//                       query.toLowerCase(),
//                     ) ||
//                     employee.occupation.toLowerCase().contains(
//                       query.toLowerCase(),
//                     ),
//               )
//               .toList();
//     });
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
//               // Header container with title and add button
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
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
//                         color: Colors.black,
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
//                             // Handle department change if needed
//                           },
//                           icon: const Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.white,
//                           ),
//                           decoration: const InputDecoration.collapsed(
//                             hintText: '',
//                           ),
//                           isExpanded: true,
//                           menuMaxHeight: 200,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Search bar
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3A3A3A),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: _filterEmployees,
//                   decoration: InputDecoration(
//                     hintText: 'Search Employees ...',
//                     hintStyle: const TextStyle(color: Color(0xFF3A3A3A)),
//                     filled: true,
//                     fillColor: const Color(0xFF989898),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: Container(
//                       margin: const EdgeInsets.all(8),
//                       child: const Icon(Icons.search, color: Color(0xFF3A3A3A)),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Expanded list of employees using FutureBuilder
//               Expanded(
//                 child:
//                     _filteredEmployees.isEmpty
//                         ? const Center(
//                           child: Text(
//                             'No employees found',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )
//                         : ListView.builder(
//                           itemCount: _filteredEmployees.length,
//                           itemBuilder: (context, index) {
//                             final employee = _filteredEmployees[index];
//                             return GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder:
//                                         (context) => const EmployeeProfile(),
//                                   ),
//                                 );
//                               },
//                               child: _buildEmployeeCard(
//                                 employee.employeeName,
//                                 employee.occupation,
//                               ),
//                             );
//                           },
//                         ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Employee card widget
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

// // Main function to run the app
// void main() {
//   runApp(const MyApp());
// }

// // Root widget
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Employee App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const EmployeesNav(),
//     );
//   }
// }

import 'dart:convert';
import 'dart:math'; // Needed for polar coordinate calculations
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

class EmployeesNav extends StatefulWidget {
  const EmployeesNav({Key? key}) : super(key: key);

  @override
  _EmployeesNavState createState() => _EmployeesNavState();
}

class _EmployeesNavState extends State<EmployeesNav>
    with SingleTickerProviderStateMixin {
  // Loader animation properties for custom circular loader effect
  late AnimationController _loaderController;
  final int _numDots = 5;
  final List<Color> _loaderColors = [
    const Color(0xFF4285F4), // Blue
    const Color(0xFFEA4335), // Red
    const Color(0xFFFBBC05), // Yellow
    const Color(0xFF34A853), // Green
    const Color(0xFF4285F4), // Blue (repeat)
  ];

  @override
  void initState() {
    super.initState();
    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _loaderController.dispose();
    super.dispose();
  }

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
                      // Custom circular loader effect (animated dots arranged in a circle)
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: AnimatedBuilder(
                            animation: _loaderController,
                            builder: (context, child) {
                              List<Widget> dots = [];
                              double radius = 20;
                              for (int i = 0; i < _numDots; i++) {
                                double angle = (2 * pi / _numDots) * i;
                                double progress =
                                    (_loaderController.value + i / _numDots) %
                                    1.0;
                                double opacity = progress < 0.5 ? 1.0 : 0.2;
                                // Calculate the dot position using cosine and sine
                                double x = radius * cos(angle);
                                double y = radius * sin(angle);
                                dots.add(
                                  Positioned(
                                    left:
                                        25 + x - 4, // Adjust for dot size (8x8)
                                    top: 25 + y - 4,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _loaderColors[i].withOpacity(
                                          opacity,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Stack(children: dots);
                            },
                          ),
                        ),
                      );
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

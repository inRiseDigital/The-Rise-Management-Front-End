// import 'package:flutter/material.dart';

// class EmployeeProfile extends StatelessWidget {
//   const EmployeeProfile({Key? key}) : super(key: key);

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
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Container(
//                       width: 80,
//                       height: 80,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFFD9D9D9),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.person,
//                         size: 40,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       'Kaveen',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       'Senior UI/UX Designer',
//                       style: TextStyle(color: Colors.grey, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               _buildInfoItem(Icons.person, 'NIC', '200121162920'),
//               const Divider(color: Colors.grey),
//               _buildInfoItem(Icons.email, 'Email', 'kaveeninrise@gmail.com'),
//               const Divider(color: Colors.grey),
//               _buildInfoItem(Icons.phone, 'Mobile', '+94712345674'),
//               const Divider(color: Colors.grey),
//               _buildInfoItem(
//                 Icons.location_on,
//                 'Address',
//                 'No 123/A Thabutegama, Anuradapura',
//               ),
//               const Divider(color: Colors.grey),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle edit user
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: const Text('Edit User'),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         // Handle delete user
//                       },
//                       style: OutlinedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.red,
//                         side: const BorderSide(color: Colors.red),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: const Text('Delete User'),
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

//   Widget _buildInfoItem(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
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
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
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
import 'updateEmployee.dart'; // Import the UpdateEmployee screen

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({Key? key}) : super(key: key);

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
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kaveen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Senior UI/UX Designer',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoItem(Icons.person, 'NIC', '200121162920'),
              const Divider(color: Colors.grey),
              _buildInfoItem(Icons.email, 'Email', 'kaveeninrise@gmail.com'),
              const Divider(color: Colors.grey),
              _buildInfoItem(Icons.phone, 'Mobile', '+94712345674'),
              const Divider(color: Colors.grey),
              _buildInfoItem(
                Icons.location_on,
                'Address',
                'No 123/A Thabutegama, Anuradapura',
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => UpdateEmployee(
                                  nic: '200121162920',
                                  email: 'kaveeninrise@gmail.com',
                                  mobile: '+94712345674',
                                  address: 'No 123/A Thabutegama, Anuradapura',
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Edit User'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle delete user
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Delete User'),
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

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

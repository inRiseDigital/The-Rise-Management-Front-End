import 'package:flutter/material.dart';
import 'employeeProfile.dart'; // Import the EmployeeProfile screen
import 'newEmployee.dart'; // Import the NewEmployee screen

class EmployeesNav extends StatelessWidget {
  const EmployeesNav({Key? key}) : super(key: key);

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
                  color: Colors.black, // Change background color to black
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
                        color: Colors.black, // Change background color to black
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
                            // Handle department change
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration.collapsed(
                            hintText: '',
                          ),
                          isExpanded: true,
                          menuMaxHeight:
                              200, // Set the max height for the dropdown menu
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
                    fillColor: const Color(
                      0xFF989898,
                    ), // Change background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.search, color: Color(0xFF3A3A3A)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeeProfile(),
                          ),
                        );
                      },
                      child: _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeeProfile(),
                          ),
                        );
                      },
                      child: _buildEmployeeCard(
                        'Kaveen',
                        'Senior UI/UX Designer',
                      ),
                    ),
                    _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
                    _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
                    _buildEmployeeCard('Harsha Subasinghe', 'CEO'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

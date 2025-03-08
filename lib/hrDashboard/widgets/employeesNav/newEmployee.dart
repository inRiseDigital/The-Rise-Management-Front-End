import 'package:flutter/material.dart';

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nicController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    super.dispose();
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
                'NIC',
                'Enter Employee NIC',
                _nicController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.email,
                'Email',
                'Enter Employee Email',
                _emailController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.phone,
                'Mobile',
                'Enter Employee Mobile number',
                _mobileController,
              ),
              const Divider(color: Colors.grey),
              _buildInputField(
                Icons.location_on,
                'Address',
                'Enter Employee Address',
                _addressController,
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear all fields
                        _nicController.clear();
                        _emailController.clear();
                        _mobileController.clear();
                        _addressController.clear();
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
                      onPressed: () {
                        // Handle add employee logic
                        // You can access the values using the controllers
                        // For example: _nicController.text, _emailController.text, etc.

                        // After adding, navigate back
                        Navigator.pop(context, {
                          'nic': _nicController.text,
                          'email': _emailController.text,
                          'mobile': _mobileController.text,
                          'address': _addressController.text,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Add Employee'),
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

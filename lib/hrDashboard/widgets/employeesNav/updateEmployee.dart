import 'package:flutter/material.dart';

class UpdateEmployee extends StatefulWidget {
  final String nic;
  final String email;
  final String mobile;
  final String address;

  const UpdateEmployee({
    Key? key,
    this.nic = '200121162920',
    this.email = 'thilaninrise@gmail.com',
    this.mobile = '+94712345674',
    this.address = 'No 123/A Galaha, Kandy',
  }) : super(key: key);

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  late TextEditingController _nicController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nicController = TextEditingController(text: widget.nic);
    _emailController = TextEditingController(text: widget.email);
    _mobileController = TextEditingController(text: widget.mobile);
    _addressController = TextEditingController(text: widget.address);
  }

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
      appBar: AppBar(
        title: const Text('Update Employee'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update Employee Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildEditInfoItem(Icons.person, 'NIC', _nicController),
              const Divider(color: Colors.grey),
              _buildEditInfoItem(Icons.email, 'Email', _emailController),
              const Divider(color: Colors.grey),
              _buildEditInfoItem(Icons.phone, 'Mobile', _mobileController),
              const Divider(color: Colors.grey),
              _buildEditInfoItem(
                Icons.location_on,
                'Address',
                _addressController,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 16),
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
                        // Handle update logic here
                        // You can access the updated values using the controllers
                        // For example: _nicController.text, _emailController.text, etc.

                        // After updating, navigate back
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
                      child: const Text('Update'),
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

  Widget _buildEditInfoItem(
    IconData icon,
    String label,
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
                  decoration: const InputDecoration(
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

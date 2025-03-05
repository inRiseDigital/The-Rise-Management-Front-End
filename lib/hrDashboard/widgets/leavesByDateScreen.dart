import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeavesByDateScreen extends StatelessWidget {
  const LeavesByDateScreen({Key? key}) : super(key: key);

  final String _baseUrl = 'https://game-parrot-trivially.ngrok-free.app/leaves';

  Future<void> _leavesByDate(BuildContext context, String queryDate) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/date/$queryDate'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _showDialog(context, 'Leaves on $queryDate', data.toString());
    } else {
      _showDialog(context, 'Error', 'Failed to fetch leaves by date.');
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
      backgroundColor: const Color(0xFF131314),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131314),
        title: const Text('Leaves By Date'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: _buildActionButton(
            context: context,
            label: 'Fetch Leaves By Date',
            onPressed:
                () => _leavesByDate(
                  context,
                  '2025-03-05',
                ), // Replace '2025-03-05' with actual query date
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

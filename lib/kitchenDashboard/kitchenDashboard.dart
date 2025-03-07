import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class KitchenDashboard extends StatefulWidget {
  const KitchenDashboard({Key? key}) : super(key: key);

  @override
  _KitchenDashboardState createState() => _KitchenDashboardState();
}

class _KitchenDashboardState extends State<KitchenDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const KitchenDashboardScreen(),
    const CategoriesScreen(),
    const MaintenanceScreen(),
    const StockScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Stack(
          children: [
            _screens[_selectedIndex],
            Positioned(
              bottom: 80,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Handle chatbot tap
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 0
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.category,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.category, size: 24),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 1
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(Icons.build, color: Colors.black, size: 20),
                      )
                      : const Icon(Icons.build, size: 24),
              label: 'Maintenance',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 2
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.storage,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.storage, size: 24),
              label: 'Stock',
            ),
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 3
                      ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                      : const Icon(Icons.shopping_cart, size: 24),
              label: 'Orders',
            ),
          ],
        ),
      ),
    );
  }
}

class KitchenDashboardScreen extends StatelessWidget {
  const KitchenDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Kitchen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Orders Prepared',
                  style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '03',
                  style: TextStyle(
                    color: Color(0xFFB0AFFF),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard('Daily Meals', '03', Icons.restaurant),
              ),
              const SizedBox(width: 16), // Add horizontal spacing
              Expanded(
                child: _buildMetricCard('Low Stocks', '20', Icons.people),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Schedule",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                onPressed: () {
                  // Handle add schedule
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                _buildScheduleItemCard(
                  'Breakfast',
                  '10.00 A.M',
                  Icons.breakfast_dining,
                ),
                const SizedBox(height: 16), // Add vertical spacing
                _buildScheduleItemCard(
                  'Lunch',
                  '12.00 P.M',
                  Icons.lunch_dining,
                ),
                const SizedBox(height: 16), // Add vertical spacing
                _buildScheduleItemCard(
                  'Dinner',
                  '08.00 P.M',
                  Icons.dinner_dining,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Icon(icon, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItemCard(String title, String time, IconData icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Categories Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Maintenance Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Stock Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

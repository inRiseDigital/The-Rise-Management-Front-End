import 'package:flutter/material.dart';

class FinanceNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FinanceNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF666666),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon:
                selectedIndex == 0
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.description_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                    : const Icon(Icons.description_outlined, size: 24),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon:
                selectedIndex == 1
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.pie_chart_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                    : const Icon(Icons.pie_chart_outline, size: 24),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon:
                selectedIndex == 2
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                    : const Icon(Icons.credit_card_outlined, size: 24),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon:
                selectedIndex == 3
                    ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(
                        Icons.hourglass_empty,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                    : const Icon(Icons.hourglass_empty, size: 24),
            label: 'Allocation',
          ),
        ],
      ),
    );
  }
}

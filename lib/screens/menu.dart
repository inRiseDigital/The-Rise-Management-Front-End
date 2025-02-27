// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/finance.dart';
// import 'hr.dart';
// import './aiGrow.dart';
// import './it.dart';
// import './marketing.dart';
// import './security.dart';
// import './procurement.dart';
// import './inventory.dart';
// import './cleaning.dart';
// import 'construction.dart';
// import 'kitchen.dart';

// class MenuDrawer extends StatelessWidget {
//   const MenuDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double drawerWidth = constraints.maxWidth * 0.75;
//         return SizedBox(
//           width: drawerWidth.clamp(250, 400),
//           child: Drawer(
//             backgroundColor: const Color(0xFF131314),
//             child: SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF222224),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           side: const BorderSide(
//                             color: Color(0xFFABABAB),
//                             width: 1.5,
//                           ),
//                         ),
//                         minimumSize: const Size(double.infinity, 40),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.add, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'New Chat',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       children: _menuItems(context),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF222224),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           side: const BorderSide(
//                             color: Color(0xFFABABAB),
//                             width: 1.5,
//                           ),
//                         ),
//                         minimumSize: const Size(double.infinity, 40),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.history, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'Chat History',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       const Divider(color: Color(0xFFABABAB), thickness: 1),
//                       _buildMenuItem(
//                         context,
//                         Icons.delete_outline,
//                         'Clear Conversation',
//                         null,
//                       ),
//                       _buildMenuItem(
//                         context,
//                         Icons.light_mode_outlined,
//                         'Light Mode',
//                         null,
//                       ),
//                       _buildMenuItem(
//                         context,
//                         Icons.logout_outlined,
//                         'Log out',
//                         null,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<Widget> _menuItems(BuildContext context) {
//     return [
//       _buildMenuItem(
//         context,
//         Icons.people_outline,
//         'HR (Human Resources)',
//         HRScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.account_balance_outlined,
//         'Finance & Accounting',
//         const FinanceScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.local_florist_outlined,
//         'AI Grow (Smart Agriculture)',
//         const AIGrowScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.computer_outlined,
//         'IT Department',
//         const ITScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.trending_up_outlined,
//         'Sales & Marketing',
//         const MarketingScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.security_outlined,
//         'CCTV & Security',
//         const SecurityScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.shopping_cart_outlined,
//         'Procurement',
//         const ProcurementScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.inventory_2_outlined,
//         'Inventory Management',
//         const InventoryScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.cleaning_services_outlined,
//         'Cleaning & Maintenance',
//         const CleaningScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.restaurant_outlined,
//         'Kitchen & Food governance',
//         const KitchenScreen(),
//       ),
//       _buildMenuItem(
//         context,
//         Icons.construction_outlined,
//         'Construction Management',
//         const ConstructionScreen(),
//       ),
//     ];
//   }

//   Widget _buildMenuItem(
//     BuildContext context,
//     IconData icon,
//     String text,
//     Widget? screen,
//   ) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white, size: 20),
//       title: Text(
//         text,
//         style: const TextStyle(color: Colors.white, fontSize: 14),
//       ),
//       onTap: () {
//         if (screen != null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => screen),
//           );
//         }
//       },
//       dense: true,
//       visualDensity: const VisualDensity(vertical: -2),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/theme_notifier.dart';
import 'finance.dart';
import 'hr.dart';
import './aiGrow.dart';
import './it.dart';
import './marketing.dart';
import './security.dart';
import './procurement.dart';
import './inventory.dart';
import './cleaning.dart';
import 'construction.dart';
import 'kitchen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double drawerWidth = constraints.maxWidth * 0.75;
        return SizedBox(
          width: drawerWidth.clamp(250, 400),
          child: Drawer(
            backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.5,
                          ),
                        ),
                        minimumSize: const Size(double.infinity, 40),
                        padding: EdgeInsets.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'New Chat',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: _menuItems(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.5,
                          ),
                        ),
                        minimumSize: const Size(double.infinity, 40),
                        padding: EdgeInsets.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Chat History',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1,
                      ),
                      _buildMenuItem(
                        context,
                        Icons.delete_outline,
                        'Clear Conversation',
                        null,
                      ),
                      _buildMenuItem(
                        context,
                        Provider.of<ThemeNotifier>(context).isDarkMode
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                        Provider.of<ThemeNotifier>(context).isDarkMode
                            ? 'Light Mode'
                            : 'Dark Mode',
                        () {
                          Provider.of<ThemeNotifier>(
                            context,
                            listen: false,
                          ).toggleTheme();
                        },
                      ),
                      _buildMenuItem(
                        context,
                        Icons.logout_outlined,
                        'Log out',
                        null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _menuItems(BuildContext context) {
    return [
      _buildMenuItem(context, Icons.people_outline, 'HR (Human Resources)', () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HRScreen()),
        );
      }),
      _buildMenuItem(
        context,
        Icons.account_balance_outlined,
        'Finance & Accounting',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FinanceScreen()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.local_florist_outlined,
        'AI Grow (Smart Agriculture)',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AIGrowScreen()),
          );
        },
      ),
      _buildMenuItem(context, Icons.computer_outlined, 'IT Department', () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ITScreen()),
        );
      }),
      _buildMenuItem(
        context,
        Icons.trending_up_outlined,
        'Sales & Marketing',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MarketingScreen()),
          );
        },
      ),
      _buildMenuItem(context, Icons.security_outlined, 'CCTV & Security', () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecurityScreen()),
        );
      }),
      _buildMenuItem(context, Icons.shopping_cart_outlined, 'Procurement', () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProcurementScreen()),
        );
      }),
      _buildMenuItem(
        context,
        Icons.inventory_2_outlined,
        'Inventory Management',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const InventoryScreen()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.cleaning_services_outlined,
        'Cleaning & Maintenance',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CleaningScreen()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.restaurant_outlined,
        'Kitchen & Food governance',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const KitchenScreen()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.construction_outlined,
        'Construction Management',
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ConstructionScreen()),
          );
        },
      ),
    ];
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback? onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color, size: 20),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}

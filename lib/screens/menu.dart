// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../widgets/theme_notifier.dart';
// import '../financeDashboard/financeDashboard.dart';
// import '../hrDashboard/hrDashboard.dart';
// import '../aiGrowDashboard/aiGrowDashboard.dart';
// import './marketing.dart';
// import '../cctvDashboard/cctvDashboard.dart';
// import '../procurmentDashboard/procurmentDashboard.dart';
// import '../inventoryDashboard/inventoryDashboard.dart';
// import '../cleaningDashboard/cleaningDashboard.dart';
// import '../constructionDashboard/constructionDashboard.dart';
// import '../kitchenDashboard/kitchenDashboard.dart';
// import 'mainChat.dart'; // Import the MainChat screen
// import 'login.dart'; // Import the LoginScreen

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
//             backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
//             child: SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // In a real application, retrieve the logged-in user's access token.
//                         // For demonstration, we are using a dummy token.
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder:
//                                 (context) => ChatScreen(
//                                   accessToken: 'dummy_access_token',
//                                 ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           side: BorderSide(
//                             color: Theme.of(context).dividerColor,
//                             width: 1.5,
//                           ),
//                         ),
//                         minimumSize: const Size(double.infinity, 40),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.add,
//                             color: Theme.of(context).iconTheme.color,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             'New Chat',
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodyLarge?.color,
//                             ),
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
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           side: BorderSide(
//                             color: Theme.of(context).dividerColor,
//                             width: 1.5,
//                           ),
//                         ),
//                         minimumSize: const Size(double.infinity, 40),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.history,
//                             color: Theme.of(context).iconTheme.color,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Chat History',
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodyLarge?.color,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Divider(
//                         color: Theme.of(context).dividerColor,
//                         thickness: 1,
//                       ),
//                       _buildMenuItem(
//                         context,
//                         Icons.delete_outline,
//                         'Clear Conversation',
//                         null,
//                       ),
//                       _buildMenuItem(
//                         context,
//                         Provider.of<ThemeNotifier>(context).isDarkMode
//                             ? Icons.light_mode_outlined
//                             : Icons.dark_mode_outlined,
//                         Provider.of<ThemeNotifier>(context).isDarkMode
//                             ? 'Light Mode'
//                             : 'Dark Mode',
//                         () {
//                           Provider.of<ThemeNotifier>(
//                             context,
//                             listen: false,
//                           ).toggleTheme();
//                         },
//                       ),
//                       _buildMenuItem(
//                         context,
//                         Icons.logout_outlined,
//                         'Log out',
//                         () {
//                           // Perform logout actions here, such as clearing user data or tokens
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const LoginScreen(),
//                             ),
//                             (Route<dynamic> route) => false,
//                           );
//                         },
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
//       _buildMenuItem(context, Icons.people_outline, 'HR (Human Resources)', () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HRDashboard()),
//         );
//       }),
//       _buildMenuItem(
//         context,
//         Icons.account_balance_outlined,
//         'Finance & Accounting',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const FinanceDashboard()),
//           );
//         },
//       ),
//       _buildMenuItem(
//         context,
//         Icons.local_florist_outlined,
//         'AI Grow (Smart Agriculture)',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AIGrowDashboard()),
//           );
//         },
//       ),
//       _buildMenuItem(
//         context,
//         Icons.trending_up_outlined,
//         'Sales & Marketing',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const MarketingScreen()),
//           );
//         },
//       ),
//       _buildMenuItem(context, Icons.security_outlined, 'CCTV & Security', () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const CCTVDashboard()),
//         );
//       }),
//       _buildMenuItem(context, Icons.shopping_cart_outlined, 'Procurement', () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const ProcurementDashboard()),
//         );
//       }),
//       _buildMenuItem(
//         context,
//         Icons.inventory_2_outlined,
//         'Inventory Management',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const InventoryDashboard()),
//           );
//         },
//       ),
//       _buildMenuItem(
//         context,
//         Icons.cleaning_services_outlined,
//         'Cleaning & Maintenance',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const CleaningDashboard()),
//           );
//         },
//       ),
//       _buildMenuItem(
//         context,
//         Icons.restaurant_outlined,
//         'Kitchen & Food governance',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const KitchenDashboard()),
//           );
//         },
//       ),
//       _buildMenuItem(
//         context,
//         Icons.construction_outlined,
//         'Construction Management',
//         () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const ConstructionDashboard(),
//             ),
//           );
//         },
//       ),
//     ];
//   }

//   Widget _buildMenuItem(
//     BuildContext context,
//     IconData icon,
//     String text,
//     VoidCallback? onTap,
//   ) {
//     return ListTile(
//       leading: Icon(icon, color: Theme.of(context).iconTheme.color, size: 20),
//       title: Text(
//         text,
//         style: TextStyle(
//           color: Theme.of(context).textTheme.bodyLarge?.color,
//           fontSize: 14,
//         ),
//       ),
//       onTap: onTap,
//       dense: true,
//       visualDensity: const VisualDensity(vertical: -2),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/theme_notifier.dart';
import '../financeDashboard/financeDashboard.dart';
import '../hrDashboard/hrDashboard.dart';
import '../aiGrowDashboard/aiGrowDashboard.dart';
import './marketing.dart';
import '../cctvDashboard/cctvDashboard.dart';
import '../procurmentDashboard/procurmentDashboard.dart';
import '../inventoryDashboard/inventoryDashboard.dart';
import '../cleaningDashboard/cleaningDashboard.dart';
import '../constructionDashboard/constructionDashboard.dart';
import '../kitchenDashboard/kitchenDashboard.dart';
import 'mainChat.dart'; // Import the MainChat screen
import 'login.dart'; // Import the LoginScreen

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
                      onPressed: () {
                        // In a real application, retrieve the logged-in user's access token.
                        // For demonstration, we are using a dummy token.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ChatScreen(
                                  accessToken: 'dummy_access_token',
                                ),
                          ),
                        );
                      },
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
                        () {
                          // Perform logout actions here, such as clearing user data or tokens
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
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
        // Retrieve the access token from the context or any other source
        final accessToken =
            'your_access_token_here'; // Replace with actual access token
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HRDashboard(accessToken: accessToken),
          ),
        );
      }),
      _buildMenuItem(
        context,
        Icons.account_balance_outlined,
        'Finance & Accounting',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FinanceDashboard()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.local_florist_outlined,
        'AI Grow (Smart Agriculture)',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AIGrowDashboard()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.trending_up_outlined,
        'Sales & Marketing',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MarketingScreen()),
          );
        },
      ),
      _buildMenuItem(context, Icons.security_outlined, 'CCTV & Security', () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CCTVDashboard()),
        );
      }),
      _buildMenuItem(context, Icons.shopping_cart_outlined, 'Procurement', () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProcurementDashboard()),
        );
      }),
      _buildMenuItem(
        context,
        Icons.inventory_2_outlined,
        'Inventory Management',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InventoryDashboard()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.cleaning_services_outlined,
        'Cleaning & Maintenance',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CleaningDashboard()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.restaurant_outlined,
        'Kitchen & Food governance',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KitchenDashboard()),
          );
        },
      ),
      _buildMenuItem(
        context,
        Icons.construction_outlined,
        'Construction Management',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ConstructionDashboard(),
            ),
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

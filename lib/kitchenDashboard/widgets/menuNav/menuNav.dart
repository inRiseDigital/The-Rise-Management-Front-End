// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/kitchenDashboard/widgets/createMenu.dart';
// import 'package:flutter_application_1/kitchenDashboard/widgets/menuNav/deleteMenu.dart';
// // import 'package:your_project_path/kitchenDashboard/widgets/createMenu.dart'; // Update the import path as necessary
// // import 'package:your_project_path/kitchenDashboard/widgets/deleteMenu.dart'; // Update the import path as necessary

// class MenuNav extends StatelessWidget {
//   const MenuNav({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           // Added to handle potential overflow
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SingleChildScrollView(
//                   // Added horizontal scroll for buttons
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor: Colors.black,
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           side: BorderSide.none,
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         child: const Text(
//                           'Get Menu',
//                           style: TextStyle(color: Colors.black, fontSize: 14),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const CreateMenu(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Create Menu',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Update Menu',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const DeleteMenu(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Delete Menu',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1A1A1A),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: const [
//                           Icon(
//                             Icons.menu_book_outlined,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             'Menu Items',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18, // Updated font size
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         'View all available menu items',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14, // Updated font size
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search menu items...',
//                           hintStyle: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                           filled: false,
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 12,
//                           ),
//                         ),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 16),
//                       _buildMenuItem(
//                         title: 'Grilled Chicken Salad',
//                         category: 'Lunch',
//                         description:
//                             'Chicken, Lettuce, Tomatoes, Cucumber, Dressing',
//                         price: '\$12.99',
//                       ),
//                       const SizedBox(height: 8),
//                       _buildMenuItem(
//                         title: 'Eggs Benedict',
//                         category: 'Breakfast',
//                         description:
//                             'Eggs, English Muffin, Ham, Hollandaise Sauce',
//                         price: '\$9.99',
//                       ),
//                       const SizedBox(height: 8),
//                       _buildMenuItem(
//                         title: 'Steak with Vegetables',
//                         category: 'Dinner',
//                         description: 'Beef Steak, Carrots, Broccoli, Potatoes',
//                         price: '\$18.99',
//                       ),
//                       const SizedBox(height: 8),
//                       _buildMenuItem(
//                         title: 'Pancakes',
//                         category: 'Breakfast',
//                         description: 'Flour, Eggs, Milk, Maple Syrup',
//                         price: '\$7.99',
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem({
//     required String title,
//     required String category,
//     required String description,
//     required String price,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF252525),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18, // Updated font size to match KitchenDashboard
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 children: const [
//                   Icon(Icons.edit, color: Colors.grey, size: 16),
//                   SizedBox(width: 12),
//                   Icon(Icons.delete, color: Colors.grey, size: 16),
//                 ],
//               ),
//             ],
//           ),
//           Text(
//             category,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 14, // Updated font size to match KitchenDashboard
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             description,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 14, // Updated font size to match KitchenDashboard
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             price,
//             style: const TextStyle(
//               color: Color(0xFF8B5CF6),
//               fontSize: 16, // Updated font size to match KitchenDashboard
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/kitchenDashboard/widgets/createMenu.dart';
import 'package:flutter_application_1/kitchenDashboard/widgets/menuNav/deleteMenu.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added to handle potential overflow
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  // Added horizontal scroll for buttons
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          'Get Menu',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateMenu(),
                            ),
                          );
                        },
                        child: const Text(
                          'Create Menu',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Update Menu',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeleteMenu(),
                            ),
                          );
                        },
                        child: const Text(
                          'Delete Menu',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.menu_book_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Menu Items',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18, // Updated font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'View all available menu items',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14, // Updated font size
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search menu items...',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: false,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      _buildMenuItem(
                        title: 'Grilled Chicken Salad',
                        category: 'Lunch',
                        description:
                            'Chicken, Lettuce, Tomatoes, Cucumber, Dressing',
                        price: '\$12.99',
                      ),
                      const SizedBox(height: 8),
                      _buildMenuItem(
                        title: 'Eggs Benedict',
                        category: 'Breakfast',
                        description:
                            'Eggs, English Muffin, Ham, Hollandaise Sauce',
                        price: '\$9.99',
                      ),
                      const SizedBox(height: 8),
                      _buildMenuItem(
                        title: 'Steak with Vegetables',
                        category: 'Dinner',
                        description: 'Beef Steak, Carrots, Broccoli, Potatoes',
                        price: '\$18.99',
                      ),
                      const SizedBox(height: 8),
                      _buildMenuItem(
                        title: 'Pancakes',
                        category: 'Breakfast',
                        description: 'Flour, Eggs, Milk, Maple Syrup',
                        price: '\$7.99',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String category,
    required String description,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Updated font size to match KitchenDashboard
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.edit, color: Colors.grey, size: 16),
                  SizedBox(width: 12),
                  Icon(Icons.delete, color: Colors.grey, size: 16),
                ],
              ),
            ],
          ),
          Text(
            category,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14, // Updated font size to match KitchenDashboard
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14, // Updated font size to match KitchenDashboard
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFF8B5CF6),
              fontSize: 16, // Updated font size to match KitchenDashboard
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

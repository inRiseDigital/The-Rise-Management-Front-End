// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/kitchenDashboard/widgets/menuNav/menuNav.dart';

// class CreateMenu extends StatefulWidget {
//   const CreateMenu({Key? key}) : super(key: key);

//   @override
//   _CreateMenuState createState() => _CreateMenuState();
// }

// class _CreateMenuState extends State<CreateMenu> {
//   // 0: Get Menu, 1: Create Menu, 2: Update Menu, 3: Delete Menu
//   int selectedTabIndex = 1; // Default to "Create Menu"

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           // Handles potential overflow on smaller screens
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Horizontal scrollable row for menu action buttons
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       // Get Menu Button
//                       OutlinedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const MenuNav(),
//                             ),
//                           );
//                         },
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor:
//                               selectedTabIndex == 0
//                                   ? Colors.black
//                                   : Colors.grey,
//                           backgroundColor:
//                               selectedTabIndex == 0
//                                   ? Colors.white
//                                   : Colors.grey.withOpacity(0.2),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           side: BorderSide.none,
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         child: Text(
//                           'Get Menu',
//                           style: TextStyle(
//                             color:
//                                 selectedTabIndex == 0
//                                     ? Colors.black
//                                     : Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       // Create Menu Button
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             selectedTabIndex = 1;
//                           });
//                         },
//                         style: TextButton.styleFrom(
//                           foregroundColor:
//                               selectedTabIndex == 1
//                                   ? Colors.black
//                                   : Colors.grey,
//                           backgroundColor:
//                               selectedTabIndex == 1
//                                   ? Colors.white
//                                   : Colors.grey.withOpacity(0.2),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         child: Text(
//                           'Create Menu',
//                           style: TextStyle(
//                             color:
//                                 selectedTabIndex == 1
//                                     ? Colors.black
//                                     : Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       // Update Menu Button
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             selectedTabIndex = 2;
//                           });
//                         },
//                         style: TextButton.styleFrom(
//                           foregroundColor:
//                               selectedTabIndex == 2
//                                   ? Colors.black
//                                   : Colors.grey,
//                           backgroundColor:
//                               selectedTabIndex == 2
//                                   ? Colors.white
//                                   : Colors.grey.withOpacity(0.2),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         child: Text(
//                           'Update Menu',
//                           style: TextStyle(
//                             color:
//                                 selectedTabIndex == 2
//                                     ? Colors.black
//                                     : Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       // Delete Menu Button
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             selectedTabIndex = 3;
//                           });
//                         },
//                         style: TextButton.styleFrom(
//                           foregroundColor:
//                               selectedTabIndex == 3
//                                   ? Colors.black
//                                   : Colors.grey,
//                           backgroundColor:
//                               selectedTabIndex == 3
//                                   ? Colors.white
//                                   : Colors.grey.withOpacity(0.2),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                         ),
//                         child: Text(
//                           'Delete Menu',
//                           style: TextStyle(
//                             color:
//                                 selectedTabIndex == 3
//                                     ? Colors.black
//                                     : Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Display different content based on selected tab
//                 if (selectedTabIndex == 0) ...[
//                   // Get Menu Content
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Get Menu Content',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ] else if (selectedTabIndex == 1) ...[
//                   // Create Menu Content
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: const [
//                             Icon(Icons.add, color: Colors.white, size: 24),
//                             SizedBox(width: 8),
//                             Text(
//                               'Create Menu Item',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           'Add a new item to the menu',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           'Item Name',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         const TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Enter item name',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                             filled: false,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 12,
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Category',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               value: 'Breakfast',
//                               isExpanded: true,
//                               dropdownColor: const Color(0xFF1A1A1A),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.grey,
//                               ),
//                               items: const [
//                                 DropdownMenuItem(
//                                   value: 'Breakfast',
//                                   child: Text('Breakfast'),
//                                 ),
//                               ],
//                               onChanged: (String? value) {},
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Ingredients',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         const TextField(
//                           maxLines: 3,
//                           decoration: InputDecoration(
//                             hintText: 'Enter ingredients (comma separated)',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                             filled: false,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 12,
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Price (\$)',
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         const TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Enter price',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                             filled: false,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                                 width: 1,
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 12,
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           keyboardType: TextInputType.number,
//                         ),
//                         const SizedBox(height: 24),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: const Color(0xFF8B5CF6),
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text(
//                               'Create Menu Item',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ] else if (selectedTabIndex == 2) ...[
//                   // Update Menu Content
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Update Menu Content',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ] else if (selectedTabIndex == 3) ...[
//                   // Delete Menu Content
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Delete Menu Content',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/kitchenDashboard/widgets/menuNav/menuNav.dart';

class CreateMenu extends StatefulWidget {
  const CreateMenu({Key? key}) : super(key: key);

  @override
  _CreateMenuState createState() => _CreateMenuState();
}

class _CreateMenuState extends State<CreateMenu> {
  // 0: Get Menu, 1: Create Menu, 2: Update Menu, 3: Delete Menu
  int selectedTabIndex = 1; // Default to "Create Menu"

  // List of categories for the dropdown
  final List<String> _categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Dessert',
    'Beverage',
  ];

  // Track the currently selected category
  String _selectedCategory = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // Handles potential overflow on smaller screens
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Horizontal scrollable row for menu action buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Get Menu Button
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuNav(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              selectedTabIndex == 0
                                  ? Colors.black
                                  : Colors.grey,
                          backgroundColor:
                              selectedTabIndex == 0
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text(
                          'Get Menu',
                          style: TextStyle(
                            color:
                                selectedTabIndex == 0
                                    ? Colors.black
                                    : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Create Menu Button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              selectedTabIndex == 1
                                  ? Colors.black
                                  : Colors.grey,
                          backgroundColor:
                              selectedTabIndex == 1
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text(
                          'Create Menu',
                          style: TextStyle(
                            color:
                                selectedTabIndex == 1
                                    ? Colors.black
                                    : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Update Menu Button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTabIndex = 2;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              selectedTabIndex == 2
                                  ? Colors.black
                                  : Colors.grey,
                          backgroundColor:
                              selectedTabIndex == 2
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text(
                          'Update Menu',
                          style: TextStyle(
                            color:
                                selectedTabIndex == 2
                                    ? Colors.black
                                    : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Delete Menu Button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTabIndex = 3;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              selectedTabIndex == 3
                                  ? Colors.black
                                  : Colors.grey,
                          backgroundColor:
                              selectedTabIndex == 3
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text(
                          'Delete Menu',
                          style: TextStyle(
                            color:
                                selectedTabIndex == 3
                                    ? Colors.black
                                    : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Display different content based on selected tab
                if (selectedTabIndex == 0) ...[
                  // Get Menu Content
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Menu Content',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ] else if (selectedTabIndex == 1) ...[
                  // Create Menu Content
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.add, color: Colors.white, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Create Menu Item',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Add a new item to the menu',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Item Name',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter item name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Category',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        // Updated Dropdown with multiple categories
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedCategory,
                              isExpanded: true,
                              dropdownColor: const Color(0xFF1A1A1A),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              // Map the list of categories to DropdownMenuItem widgets
                              items:
                                  _categories.map((String category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCategory = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ingredients',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Enter ingredients (comma separated)',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Price (\$)',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter price',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle create menu item logic here
                              debugPrint(
                                'Category selected: $_selectedCategory',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF8B5CF6),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Create Menu Item',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else if (selectedTabIndex == 2) ...[
                  // Update Menu Content
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Update Menu Content',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ] else if (selectedTabIndex == 3) ...[
                  // Delete Menu Content
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Delete Menu Content',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

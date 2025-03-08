// import 'package:flutter/material.dart';

// class CCTVDashboard extends StatelessWidget {
//   const CCTVDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // First camera (full width)
//             Container(
//               width: double.infinity,
//               height: 300,
//               margin: const EdgeInsets.only(bottom: 10),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.network(
//                     'https://images.unsplash.com/photo-1557408332-cc35829e5133?q=80&w=2070&auto=format&fit=crop',
//                     fit: BoxFit.cover,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return Center(child: CircularProgressIndicator());
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         color: Colors.grey[900],
//                         child: const Center(
//                           child: Icon(Icons.broken_image, color: Colors.white),
//                         ),
//                       );
//                     },
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: Container(
//                       height: 45,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       color: Colors.black54,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Main Gate',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           Container(
//                             width: 30,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: const Icon(
//                               Icons.fullscreen,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Second row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Main Gate',
//                       'https://images.unsplash.com/photo-1574882225022-9e0e447e9576?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Main Gate',
//                       'https://images.unsplash.com/photo-1602879959-2e2843d20d0d?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Third row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Dinning room',
//                       'https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=1974&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Shop',
//                       'https://images.unsplash.com/photo-1604076913837-52ab5629fba9?q=80&w=1974&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Fourth row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Dinning room',
//                       'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Shop',
//                       'https://images.unsplash.com/photo-1532976403832-839dfcbcb139?q=80&w=2071&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 60), // Space for bottom nav
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         decoration: const BoxDecoration(color: Colors.black),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildNavItem(Icons.home, true),
//             _buildNavItem(Icons.people, false),
//             _buildNavItem(Icons.person, false),
//             _buildNavItem(Icons.align_vertical_bottom, false),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCameraItem(String title, String imageUrl) {
//     return Container(
//       height: 180,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[900],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child;
//               return Center(child: CircularProgressIndicator());
//             },
//             errorBuilder: (context, error, stackTrace) {
//               return Container(
//                 color: Colors.grey[900],
//                 child: const Center(
//                   child: Icon(Icons.broken_image, color: Colors.white),
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: 35,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               color: Colors.black54,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   Container(
//                     width: 24,
//                     height: 24,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(
//                       Icons.fullscreen,
//                       color: Colors.white,
//                       size: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(IconData icon, bool isSelected) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.white : Colors.transparent,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Icon(
//         icon,
//         color: isSelected ? Colors.black : Colors.white,
//         size: 24,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CCTVDashboard extends StatelessWidget {
//   const CCTVDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // First camera (full width)
//             Container(
//               width: double.infinity,
//               height: 300,
//               margin: const EdgeInsets.only(bottom: 10),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.network(
//                     'https://images.unsplash.com/photo-1557408332-cc35829e5133?q=80&w=2070&auto=format&fit=crop',
//                     fit: BoxFit.cover,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return Center(child: CircularProgressIndicator());
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         color: Colors.grey[900],
//                         child: const Center(
//                           child: Icon(Icons.broken_image, color: Colors.white),
//                         ),
//                       );
//                     },
//                   ),
//                   // Center expand button
//                   Center(
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.6),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: const Icon(
//                         Icons.fullscreen,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: Container(
//                       height: 45,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       color: Colors.black54,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Main Gate',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           Container(
//                             width: 30,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: const Icon(
//                               Icons.fullscreen,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Second row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Main Gate',
//                       'https://images.unsplash.com/photo-1574882225022-9e0e447e9576?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Main Gate',
//                       'https://images.unsplash.com/photo-1602879959-2e2843d20d0d?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Third row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Dinning room',
//                       'https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=1974&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Shop',
//                       'https://images.unsplash.com/photo-1604076913837-52ab5629fba9?q=80&w=1974&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Fourth row (2 cameras)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Dinning room',
//                       'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop',
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: _buildCameraItem(
//                       'Shop',
//                       'https://images.unsplash.com/photo-1532976403832-839dfcbcb139?q=80&w=2071&auto=format&fit=crop',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 60), // Space for bottom nav
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         decoration: const BoxDecoration(color: Colors.black),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildNavItem(Icons.home, true),
//             _buildNavItem(Icons.people, false),
//             _buildNavItem(Icons.person, false),
//             _buildNavItem(Icons.align_vertical_bottom, false),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCameraItem(String title, String imageUrl) {
//     return Container(
//       height: 180,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[900],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child;
//               return Center(child: CircularProgressIndicator());
//             },
//             errorBuilder: (context, error, stackTrace) {
//               return Container(
//                 color: Colors.grey[900],
//                 child: const Center(
//                   child: Icon(Icons.broken_image, color: Colors.white),
//                 ),
//               );
//             },
//           ),
//           // Center expand button
//           Center(
//             child: Container(
//               width: 45,
//               height: 45,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.6),
//                 borderRadius: BorderRadius.circular(23),
//               ),
//               child: const Icon(
//                 Icons.fullscreen,
//                 color: Colors.white,
//                 size: 25,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: 35,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               color: Colors.black54,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   Container(
//                     width: 24,
//                     height: 24,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(
//                       Icons.fullscreen,
//                       color: Colors.white,
//                       size: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(IconData icon, bool isSelected) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.white : Colors.transparent,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Icon(
//         icon,
//         color: isSelected ? Colors.black : Colors.white,
//         size: 24,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/chatBotIcon.dart'; // Import the ChatBotIcon widget

class CCTVDashboard extends StatelessWidget {
  const CCTVDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First camera (full width)
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1557408332-cc35829e5133?q=80&w=2070&auto=format&fit=crop',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[900],
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.white),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.black54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Main Gate',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Second row (2 cameras)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCameraItem(
                      'Main Gate',
                      'https://images.unsplash.com/photo-1574882225022-9e0e447e9576?q=80&w=2070&auto=format&fit=crop',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCameraItem(
                      'Main Gate',
                      'https://images.unsplash.com/photo-1602879959-2e2843d20d0d?q=80&w=2070&auto=format&fit=crop',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Third row (2 cameras)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCameraItem(
                      'Dinning room',
                      'https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=1974&auto=format&fit=crop',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCameraItem(
                      'Shop',
                      'https://images.unsplash.com/photo-1604076913837-52ab5629fba9?q=80&w=1974&auto=format&fit=crop',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Fourth row (2 cameras)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCameraItem(
                      'Dinning room',
                      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCameraItem(
                      'Shop',
                      'https://images.unsplash.com/photo-1532976403832-839dfcbcb139?q=80&w=2071&auto=format&fit=crop',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true),
            _buildNavItem(Icons.people, false),
            _buildNavItem(Icons.person, false),
            _buildNavItem(Icons.align_vertical_bottom, false),
          ],
        ),
      ),
      floatingActionButton: ChatBotIcon(), // Add the ChatBotIcon widget
    );
  }

  Widget _buildCameraItem(String title, String imageUrl) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[900],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.white),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.fullscreen,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.white,
        size: 24,
      ),
    );
  }
}

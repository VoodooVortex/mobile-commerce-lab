import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Page 2',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFFEEB8D5),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Obx(() => Text(
                    controller.fullName.value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )),
                ],
              ),
            ),

            // Status section - Highlights style
            _buildStatusSection(context),
            const SizedBox(height: 24),

            // Tab bar - CupertinoSlidingSegmentedControl style
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Obx(() => CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: Colors.grey.shade200,
                  thumbColor: Colors.white,
                  groupValue: controller.selectedTabIndex.value,
                  padding: const EdgeInsets.all(4),
                  children: {
                    0: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'สถานที่ท่องเที่ยว',
                        style: TextStyle(
                          color: controller.selectedTabIndex.value == 0 ? Colors.blue : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    1: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'ธรรมชาติ',
                        style: TextStyle(
                          color: controller.selectedTabIndex.value == 1 ? Colors.blue : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  },
                  onValueChanged: (int? value) {
                    if (value != null) {
                      controller.setSelectedTab(value);
                    }
                  },
                )),
              ),
            ),
            const SizedBox(height: 14),

            // People list - ListView.separated style with dividers
            Obx(() {
              // Access observable value inside Obx
              final peopleList = controller.currentPeopleList;
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: peopleList.length,
                padding: const EdgeInsets.symmetric(vertical: 10),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[300],
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  );
                },
                itemBuilder: (context, index) {
                  final person = peopleList[index];
                  return _buildPersonCard(
                    person['name']!,
                    person['description']!,
                    person['image']!,
                  );
                },
              );
            }),
            const SizedBox(height: 80), // Extra space for bottom nav
          ],
        ),
      ),

      // Floating Action Button - Scan button in center
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            // Scan action
          },
          backgroundColor: const Color(0xFF3545CC),
          elevation: 10,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.qr_code_scanner,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom App Bar with notch
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        height: 70,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Left side buttons
            Row(
              children: [
                _buildNavItem(icon: Icons.home_outlined, index: 0),
                _buildNavItem(icon: Icons.search, index: 1),
              ],
            ),
            
            // Center spacer for FAB
            const SizedBox(width: 48),

            // Right side buttons
            Row(
              children: [
                _buildNavItem(icon: Icons.chat_bubble_outline, index: 2),
                _buildNavItem(icon: Icons.shopping_bag_outlined, index: 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Nav item builder
  Widget _buildNavItem({required IconData icon, required int index}) {
    return Obx(() => MaterialButton(
      minWidth: 40,
      onPressed: () {
        controller.setBottomNavIndex(index);
      },
      child: Icon(
        icon,
        size: 28,
        color: controller.bottomNavIndex.value == index 
            ? const Color(0xFF3545CC) 
            : Colors.grey,
      ),
    ));
  }

  // Status section - Emoji cards with horizontal scroll
  Widget _buildStatusSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'สถานะ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: Obx(() {
            final selectedIndex = controller.selectedStatus.value;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.statusList.length,
              itemBuilder: (context, index) {
                return _buildStatusCard(
                  controller.statusList[index],
                  index,
                  selectedIndex,
                );
              },
            );
          }),
        ),
      ],
    );
  }

  // Status card - Emoji style matching design
  Widget _buildStatusCard(Map<String, String> status, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;
    
    // Background colors based on index
    Color bgColor;
    if (index == 0) {
      bgColor = const Color(0xFFFFF8E1); // Light yellow
    } else if (index == 1) {
      bgColor = const Color(0xFFFBE9E7); // Light peach/orange
    } else {
      bgColor = Colors.grey[100]!; // Light grey
    }
    
    return GestureDetector(
      onTap: () => controller.setSelectedStatus(index),
      child: Container(
        width: 130,  // Wider cards
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: const Color(0xFFFFCC80), width: 2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emoji in circle
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  status['emoji']!,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Label
            Text(
              status['label']!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildPersonCard(String name, String description, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

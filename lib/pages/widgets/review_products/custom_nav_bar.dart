import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final List<Widget> pages;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: selectedIndex,
      onTabChange: onTabChange,
      backgroundColor: Colors.white,
      color: Colors.grey,
      activeColor: Colors.green,
      tabBackgroundColor: Colors.green.withValues(alpha: 0.1),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      gap: 8,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}
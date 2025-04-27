import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/Favorites/presentation/screens/faviorte_screen.dart';
import 'package:marketi/features/cart/presentation/screens/cart_screen.dart';
import 'package:marketi/features/home/presentation/Screens/home_screen.dart';
import 'package:marketi/features/profile/presentation/screens/profile_screen.dart';

class NavBarLayout extends StatefulWidget {
  const NavBarLayout({super.key});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: bottomNavBar(),
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      elevation: 20,
      items: bottomNavigationBar,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color(0xFF67687E),
      selectedItemColor: Colors.blue,
      iconSize: 28,
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      mouseCursor: SystemMouseCursors.none,
      selectedLabelStyle: AppStyles.style12Medium,
      unselectedLabelStyle: AppStyles.style12Regular,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      enableFeedback: true,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
    );
  }

  List<Widget> screens = [
    const HomeScreen(),
    const FaviorteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBar = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'الصفحة الرئيسية'),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
    const BottomNavigationBarItem(icon: Icon(IconlyBold.buy), label: 'السلة'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined), label: 'الملف الشخصي'),
  ];
}

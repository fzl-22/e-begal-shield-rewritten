import 'package:e_begal_shield_rewritten/modules/dashboard/dashboard.page.dart';
import 'package:e_begal_shield_rewritten/modules/map/map.page.dart';
import 'package:e_begal_shield_rewritten/modules/profile/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Widget> _buildScreens() {
    return [
      const DashboardPage(),
      const MapPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.home),
        inactiveIcon: const Icon(IconlyLight.home),
        title: "Home",
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          IconlyLight.location,
          color: Colors.white,
        ),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.profile),
        inactiveIcon: const Icon(IconlyLight.profile),
        title: "Profile",
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final PersistentTabController controller = PersistentTabController(
      initialIndex: 0,
    );

    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: controller,
      items: _navBarsItems(context),
      navBarStyle: NavBarStyle.style15,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        colorBehindNavBar: Colors.white,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      ),
      confineInSafeArea: true,
      hideNavigationBarWhenKeyboardShows: true,
      
    );
  }
}

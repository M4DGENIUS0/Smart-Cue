import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/component/components.dart';
import 'Cubit/build_Screen_Cubit.dart';

class InitHome extends StatefulWidget {
  const InitHome({super.key});

  @override
  State<InitHome> createState() => _InitHomeState();
}

class _InitHomeState extends State<InitHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BuildScreenCubit, int>(
        builder: (context, currentIndex) {
          return buildScreens()[currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BuildScreenCubit, int>(
        builder: (context, currentIndex) {
          return FlashyTabBar(
            iconSize: 20,
            selectedIndex: currentIndex,
            onItemSelected: (index) {
              context.read<BuildScreenCubit>().changeTab(index);
            },
            items: [
              /// Home
              FlashyTabBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 16),
                ),
                activeColor: Theme.of(context).colorScheme.primary,
              ),

              /// Settings
              FlashyTabBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 20,
                ),
                activeColor: Theme.of(context).colorScheme.primary,
                title: Text(
                  "Settings",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
            animationCurve: Curves.bounceIn,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../config/component/components.dart';
import 'Cubit/build_Screen_Cubit.dart';

class InitHome extends StatefulWidget {
  const InitHome({super.key});

  @override
  State<InitHome> createState() => _InitHomeState();
}

class _InitHomeState extends State<InitHome> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);
    return BlocBuilder<BuildScreenCubit, int>(
      builder: (context, currentIndex) {
        PersistentTabController controller =
            PersistentTabController(initialIndex: currentIndex);

        return PersistentTabView(
          context,
          controller: controller,
          screens: buildScreens(),
          items: navBarItems(),
          navBarStyle: NavBarStyle.style15,
          onItemSelected: (index) {
            context.read<BuildScreenCubit>().changeTab(index);
          },
        );
      },
    );
  }
}

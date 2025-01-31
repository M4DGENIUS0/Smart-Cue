import 'package:flutter/material.dart';

import '../../config/component/components.dart';
import '../views.dart';

class ScriptsHome extends StatefulWidget {
  const ScriptsHome({super.key});

  @override
  State<ScriptsHome> createState() => _ScriptsHomeState();
}

class _ScriptsHomeState extends State<ScriptsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Smart Cue",
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "Gummy",
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20),
          // Tab bar Customization
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onSecondary),
                  child: Tabs(),
                ),
              )),
        ),
        body: TabBarComponent(),
      ),
    );
  }
}

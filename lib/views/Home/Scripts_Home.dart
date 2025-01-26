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
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
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
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Tabs(),
                ),
              )),
        ),
        body: TabBarComponent(),
      ),
    );
  }
}

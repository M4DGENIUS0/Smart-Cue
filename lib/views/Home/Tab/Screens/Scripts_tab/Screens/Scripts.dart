import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/extension/popup_card/add_script_pop_up_card.dart';

import '../../../../../views.dart';
import '../bloc/script_tab_bloc.dart';

class Scripts extends StatefulWidget {
  const Scripts({super.key});

  @override
  State<Scripts> createState() => _ScriptsState();
}

class _ScriptsState extends State<Scripts> {
  @override
  void initState() {
    context.read<ScriptBloc>().add(LoadScriptsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        // backgroundColor: Colors.yellowAccent,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddbyPopupCard());
        },
        child: Material(
          color: Colors.amberAccent,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: const Icon(
            Icons.add_rounded,
            size: 56,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ScriptBloc, ScriptState>(
          builder: (context, state) {
            if (state is ScriptsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ScriptsLoadingErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ScriptsLoadedState) {
              final scripts = state.scripts;
              return scripts.isEmpty
                  ? const Center(child: Text('No scripts found.'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120,
                        mainAxisExtent: 150,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: scripts.length,
                      itemBuilder: (context, index) {
                        final script = scripts[index];
                        print(scripts.length);
                        return GridForScripts(
                          title: script.content,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SmartCueScreen(
                                    content: script.content,
                                  ),
                                ),
                                (Route<dynamic> route) => false);
                          },
                        );
                      },
                    );
            } else {
              return const Center(child: Text('No scripts available.'));
            }
          },
        ),
      ),
    );
  }
}

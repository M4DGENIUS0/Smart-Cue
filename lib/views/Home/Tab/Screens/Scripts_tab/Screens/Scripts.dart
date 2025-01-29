import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/animation/hero_transition.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          PopupDialogBox().showAwesomeDialog(context);
        },
        child: const Icon(
          Icons.add_rounded,
          size: 40,
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
                  ? const Center(
                      child: Text(
                      'No scripts found.',
                    ))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 140,
                        mainAxisExtent: 170,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: scripts.length,
                      itemBuilder: (context, index) {
                        final script = scripts[index];
                        return HeroTransition(
                          tag: 'open ${script.id}',
                          child: GridForScripts(
                            title: script.title,
                            content: script.content,
                            onTap: () {
                              context.go(
                                  "/Add_Script/teleprompt_screen/SmartCueScreen?id=${script.id}&title=${script.title}&content=${script.content}");
                            },
                          ),
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

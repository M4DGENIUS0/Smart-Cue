import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/cubit/scroll_state.dart';

import '../../../views.dart';
import '../Controller/Screen_Scroll_Helper.dart';
import '../bloc/Playback/playback_bloc.dart';
import '../widget/widget.dart';

class SmartCueScreen extends StatefulWidget {
  final String title;

  final String content;
  const SmartCueScreen({super.key, required this.content, required this.title});

  @override
  State<SmartCueScreen> createState() => _SmartCueScreenState();
}

class _SmartCueScreenState extends State<SmartCueScreen> {
  late final ScrollHelper scrollHelper;
  late ScrollController _scrollController;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    scrollHelper = ScrollHelper();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollHelper.dispose();
    _scrollTimer?.cancel();
    _scrollController.dispose();

    super.dispose();
  }

  void startScrolling() {
    _scrollTimer?.cancel();

    if (_scrollController.hasClients) {
      _scrollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
        if (_scrollController.hasClients &&
            context.read<ScrollCubit>().state.isUserScrolling) {
          double currentOffset = _scrollController.offset;
          double maxScrollExtent = _scrollController.position.maxScrollExtent;

          if (currentOffset < maxScrollExtent) {
            _scrollController.jumpTo(currentOffset + 2);
          } else {
            _scrollTimer?.cancel();
          }
        } else {
          _scrollTimer?.cancel();
        }
      });
    }
  }

  void stopScrolling() {
    _scrollTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<SmartCueBloc>().add(SaveTextToPDFEvent());
            },
            child: Text(
              "Save",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Create_Edit_Screen(),
                  ));
            },
            child: Text(
              "Edit",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
        title: Text(
          widget.title,
        ),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: BlocBuilder<ScrollCubit, ScrollState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollHelper.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<PlaybackBloc, PlaybackState>(
                        builder: (context, state) {
                      return Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: state.textSize,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      );
                    }),
                  ),
                ),
              ),

              BottomPlayBackController(),
              PlayBackMenu(
                scrollHelper: scrollHelper,
              )
              // buildbottomui()
            ],
          );
        },
      ),
    );
  }
}

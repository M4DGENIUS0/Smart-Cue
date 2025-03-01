import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/cubit/scroll_state.dart';
import '../Controller/Screen_Scroll_Helper.dart';
import '../bloc/Playback/playback_bloc.dart';
import '../widget/widget.dart';

class SmartCueScreen extends StatefulWidget {
  final String id;
  final String title;

  final String content;
  const SmartCueScreen(
      {super.key,
      required this.content,
      required this.title,
      required this.id});

  @override
  State<SmartCueScreen> createState() => _SmartCueScreenState();
}

class _SmartCueScreenState extends State<SmartCueScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late final ScrollHelper scrollHelper;
  late ScrollController _scrollController;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    scrollHelper = ScrollHelper();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
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
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      animation: _scaleAnimation,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => context.go('/'),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.go(
                    "/Add_Script/teleprompt_screen/Edit_Screen?id=${widget.id}&title=${widget.title}&content=${widget.content}");
              },
              child: Text(
                "Edit",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
          title: Text(
            widget.title,
          ),
          titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontFamily: "Zain"),
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
                        return SelectableText(
                          widget.content,
                          style: TextStyle(
                              fontSize: state.textSize,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Zain"),
                          textAlign: TextAlign.justify,
                        );
                      }),
                    ),
                  ),
                ),
                Wrap(children: [
                  BottomPlayBackController(),
                  PlayBackMenu(
                    scrollHelper: scrollHelper,
                  )
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}

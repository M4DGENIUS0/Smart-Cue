import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/Screen_Scroll_Helper.dart';
import '../bloc/Playback/playback_bloc.dart';
import '../cubit/scroll_state.dart';

class PlayPauseButton extends StatelessWidget {
  final ScrollHelper scrollHelper;
  const PlayPauseButton({
    super.key,
    required this.scrollHelper,
  });

  // late final ScrollHelper scrollHelper;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // context.read<ScrollCubit>().setUserScrolling(false);
            // scrollHelper.stopScrolling();
            // print("Scroll stop");
          },
          icon: Icon(
            Icons.skip_previous_rounded,
            color: Colors.white,
          ),
        ),
        BlocBuilder<PlaybackBloc, PlaybackState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                final isScrolling =
                    context.read<ScrollCubit>().state.isUserScrolling;

                if (isScrolling) {
                  context.read<ScrollCubit>().setUserScrolling(false);
                  scrollHelper.stopScrolling();
                  print("Screen Stop");
                } else {
                  context.read<ScrollCubit>().setUserScrolling(true);
                  scrollHelper.startScrolling(context, state.scrollSpeed);
                  print("Screen Play");
                }
              },
              icon: Icon(
                context.read<ScrollCubit>().state.isUserScrolling
                    ? Icons.pause
                    : Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            );
          },
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_next_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

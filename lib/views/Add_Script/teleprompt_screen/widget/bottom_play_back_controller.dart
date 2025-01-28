import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Playback/playback_bloc.dart';

class BottomPlayBackController extends StatelessWidget {
  const BottomPlayBackController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.onSecondary,
      child: BlocBuilder<PlaybackBloc, PlaybackState>(
        builder: (context, state) {
          final bloc = context.read<PlaybackBloc>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.av_timer_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Material(
                color: Colors.transparent,
                child: Slider(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: state.scrollSpeed,
                  min: 2.0,
                  max: 100.0,
                  onChanged: (value) {
                    bloc.add(ChangeScrollSpeedEvent(value));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

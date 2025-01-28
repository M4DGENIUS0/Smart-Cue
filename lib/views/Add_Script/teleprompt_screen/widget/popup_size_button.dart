import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/component/components.dart';
import '../bloc/Playback/playback_bloc.dart';

class PopupSizeButton extends StatelessWidget {
  const PopupSizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) {
        final bloc = context.read<PlaybackBloc>();

        return PopupMenuButton<double>(
          constraints: BoxConstraints(maxHeight: 300),
          color: Theme.of(context).colorScheme.onSecondary,
          icon: const Icon(Icons.format_size_rounded),
          onSelected: (size) {
            bloc.add(ChangeTextSizeEvent(size));
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem<double>(
                enabled: false,
                child: Text(
                  'Adjust Text Size',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              // Generate sizes options from the list
              ...textSizes.map(
                (size) => PopupMenuItem<double>(
                  value: size,
                  child: Text(
                    '${size.toInt()}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ];
          },
        );
      },
    );
  }
}

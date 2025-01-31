import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Playback/playback_bloc.dart';

class BottomTextSizeForEditScreen extends StatelessWidget {
  const BottomTextSizeForEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.onSecondary,
      child: BlocBuilder<PlaybackBloc, PlaybackState>(
        builder: (context, state) {
          final bloc = context.read<PlaybackBloc>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.text_fields_outlined,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Slider(
                activeColor: Theme.of(context).colorScheme.primary,
                value: state.textSize,
                min: 8.0,
                max: 52.0,
                onChanged: (value) {
                  bloc.add(ChangeTextSizeEvent(value));
                },
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (state.textSize > 8) {
                            bloc.add(ChangeTextSizeEvent(state.textSize - 1));
                          }
                        },
                        icon: Icon(
                          Icons.text_decrease,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                    VerticalDivider(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    IconButton(
                        onPressed: () {
                          if (state.textSize < 52) {
                            bloc.add(ChangeTextSizeEvent(state.textSize + 1));
                          }
                        },
                        icon: Icon(
                          Icons.text_increase,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcue/views/views.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            size: 50,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: Text(
              'Toggle Theme',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

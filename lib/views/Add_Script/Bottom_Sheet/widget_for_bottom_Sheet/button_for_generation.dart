import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';

import '../../../../extension/dialog_box/custom_dialog_box.dart';
import 'widget.dart';

class ButtonForGeneration extends StatefulWidget {
  const ButtonForGeneration({super.key});

  @override
  State<ButtonForGeneration> createState() => _ButtonForGenerationState();
}

class _ButtonForGenerationState extends State<ButtonForGeneration> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerationBloc, GenerationState>(
      listener: (context, state) {
        if (!state.loading) {
          context.go('/');
        }
      },
      child: SizedBox(
          height: 60,
          width: 350,
          child: BlocBuilder<GenerationBloc, GenerationState>(
            builder: (context, state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ))),
                  onPressed: () {
                    state.loading
                        ? print(
                            'Template: ${state.selectedTemplate}\nDescription: ${state.description}\nTone of Voice: ${state.toneOfVoice}\nLanguage: ${state.language}\n')
                        : null;
                    print('Button Pressed');

                    CustomDialogBox().showAwesomeDialog(
                        context, NameTheScript(), DialogType.warning, () {
                      context.go('/');
                      context.read<GenerationBloc>().add(ResetState());
                      context.read<GenerationBloc>().add(ClearTextField());
                    }, () {
                      context.read<GenerationBloc>().add(PostRequesttoAPI());
                      context.read<GenerationBloc>().add(ClearTextField());

                      context.go("/");
                    });
                  },
                  child: state.loading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : Text(
                          "Generate Script",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ));
            },
          )),
    );
  }
}

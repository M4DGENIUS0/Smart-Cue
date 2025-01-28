import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartcue/views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';

class ButtonForGeneration extends StatelessWidget {
  const ButtonForGeneration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerationBloc, GenerationState>(
      listener: (context, state) {
        state.loading ? null : context.go('/');
      },
      child: SizedBox(
          height: 60,
          width: 350,
          child: BlocBuilder<GenerationBloc, GenerationState>(
            builder: (context, state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ))),
                  onPressed: () {
                    state.loading
                        ? null
                        : print('Template: ${state.selectedTemplate}');
                    print('Description: ${state.description}');
                    print('Tone of Voice: ${state.toneOfVoice}');
                    print('Language: ${state.language}');
                    context.read<GenerationBloc>().add(PostRequesttoAPI());
                  },
                  child: state.loading
                      ? Text(
                          "Generate Script",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        ));
            },
          )),
    );
  }
}

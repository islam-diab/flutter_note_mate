import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/pin_code/logic/pin_code_cubit.dart';

class PinListener extends StatelessWidget {
  const PinListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PinCodeCubit, PinCodeState>(
      listener: (context, state) {
        if (state is PinCodeSucces) {
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is PinCodeError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(
                state.error,
                style: AppTextStyles.fondt18RegularWhite
                    .copyWith(color: Colors.red),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Got it',
                    style: AppTextStyles.font16Medium,
                  ),
                ),
              ],
            ),
          );
        } else {
          debugPrint(state.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

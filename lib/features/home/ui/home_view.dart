import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/color.dart';
import 'package:flutter_note_mate/features/home/ui/widget/custom_app_bar.dart';
import 'package:flutter_note_mate/features/home/ui/widget/floating_action_button.dart';
import 'package:flutter_note_mate/features/home/ui/widget/note_empty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: const AppFloatingActionButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              CustomAppBar(
                perfixIcon: Icons.menu,
                onPressedInPerfixIcon: () {},
                title: 'Notes',
                suffixIcon: Icons.search,
                onPressedInSuffixIcon: () {},
              ),
              const Expanded(child: NoteEmpty()),
            ],
          ),
        ),
      ),
    );
  }
}

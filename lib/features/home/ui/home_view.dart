import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/app_user.dart';
import 'package:flutter_note_mate/core/theming/color.dart';
import 'package:flutter_note_mate/features/home/ui/widget/custom_app_bar.dart';
import 'package:flutter_note_mate/features/home/ui/widget/floating_action_button.dart';
import 'package:flutter_note_mate/features/home/ui/widget/note_empty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<AppUser>(AppConstant.userBox);
    AppUser? currentUser = userBox.get(AppConstant.currentUser);
    
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
                title: currentUser?.name ?? 'Name',
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

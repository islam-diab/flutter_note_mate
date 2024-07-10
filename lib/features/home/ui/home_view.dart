import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 10,
              ),
            ],
          ),
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.white,
              backgroundColor: AppColor.primaryColor,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

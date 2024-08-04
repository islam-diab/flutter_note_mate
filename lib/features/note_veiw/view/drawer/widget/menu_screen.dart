part of '../drawer_view.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FavoritesNotes(),
            verticalSpace(20),
            const AppLock(),
            verticalSpace(20),
            const Account(),
          ],
        ),
      ),
    );
  }
}

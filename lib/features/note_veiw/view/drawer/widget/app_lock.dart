part of '../drawer_view.dart';

class AppLock extends StatelessWidget {
  const AppLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.lock_outlined,
              color: Colors.white,
            ),
            horizontalSpace(12),
            Text(
              'Lock app',
              style: AppTextStyles.font20MediumWhite,
            ),
          ],
        ),
        Row(
          children: [
            horizontalSpace(40),
            Text(
              'Pin',
              style: AppTextStyles.font20MediumWhite,
            ),
            const Expanded(child: SizedBox.shrink()),
            const ToggleSwitch(),
          ],
        ),
        Row(
          children: [
            horizontalSpace(40),
            Text(
              'Fingerprint',
              style: AppTextStyles.font20MediumWhite,
            ),
            const Expanded(child: SizedBox.shrink()),
            const ToggleSwitch(),
          ],
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

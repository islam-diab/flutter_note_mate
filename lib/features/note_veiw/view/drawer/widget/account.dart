part of '../drawer_view.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            horizontalSpace(12),
            Text(
              'Account',
              style: AppTextStyles.font20MediumWhite,
            ),
          ],
        ),
        Row(
          children: [
            horizontalSpace(40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Sign out',
                style: AppTextStyles.font20MediumWhite.copyWith(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

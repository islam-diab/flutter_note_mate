part of '../drawer_view.dart';

class FavoritesNotes extends StatelessWidget {
  const FavoritesNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.favorite_outline,
              color: Colors.red,
            ),
            horizontalSpace(12),
            Text(
              'Favorites',
              style: AppTextStyles.font20MediumWhite,
            ),
          ],
        ),
        verticalSpace(12),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

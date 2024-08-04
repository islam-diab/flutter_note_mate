part of 'notes_item.dart';

class AppTextButtonToDialog extends StatelessWidget {
  const AppTextButtonToDialog({
    super.key,
    required this.notes,
    required this.text,
    required this.color,
    this.onPressed,
  });
  final NoteModel notes;
  final void Function()? onPressed;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

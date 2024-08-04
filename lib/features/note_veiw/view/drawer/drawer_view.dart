import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/note_veiw/view/notes_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

part 'widget/menu_screen.dart';
part 'widget/toggle_switch.dart';
part 'widget/app_lock.dart';
part 'widget/account.dart';
part 'widget/favorites_notes.dart';

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatelessWidget {
  const Zoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      menuScreenWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuScreenTapClose: true,
      angle: 0,
      menuBackgroundColor: AppColor.primaryColor,
      mainScreen: NotesView(onPressedInPerfixIcon: () => z.toggle!()),
      menuScreen: const MenuScreen(),
    );
  }
}

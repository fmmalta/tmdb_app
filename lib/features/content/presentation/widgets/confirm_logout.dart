import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/alert_dialog_widget.dart';
import 'package:movie_app/features/login/presentation/pages/login_screen.dart';

class ConfirmLogout {
  final BuildContext context;

  ConfirmLogout(this.context);

  static Future<dynamic> execute(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialogWidget(
          title: "Sair",
          description: "Tem certeza que deseja sair da aplicação?",
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancelar",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
              child: Text(
                "Sair",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF36B0E5),
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}

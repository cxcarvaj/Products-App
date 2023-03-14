import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showErrorSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: Colors.red,
    );

    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }
}

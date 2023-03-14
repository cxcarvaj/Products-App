import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';

import '../providers/providers.dart';
import '../services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.isLoggedIn(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return const Text('Wait a moment...');
            if (snapshot.data == '') {
              //* Future.microtask executes the code after (as soon as possible)
              //* when the current context (widget tree) is finished.
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}

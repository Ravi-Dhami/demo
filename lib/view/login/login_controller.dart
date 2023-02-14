import 'package:flutter/material.dart';

import '../../utils/services/firebase_function.dart';

class LoginController extends ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(context) {
    AuthService().signIn(
      context,
      name: nameController.text,
      password: passwordController.text,
    );
  }

  googleSignIn(context) {
    AuthService().signInwithGoogle(context);
  }
}

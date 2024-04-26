import 'package:flutter/material.dart';
import 'package:flutter_bloc_tdd/core/common/widgets/i_field.dart';
import 'package:iconly/iconly.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obsure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          IField(
            controller: widget.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 25,
          ),
          IField(
            controller: widget.passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsure = !obsure;
                });
              },
              icon: Icon(
                obsure ? IconlyLight.show : IconlyBold.hide,
              ),
            ),
            obscureText: !obsure,
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/views/widget/sign_up_form.dart';
import 'package:nex_spot_app/cores/common/widget/header.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({
    super.key,

    this.initial = false,
    required this.stage,
    required this.onCompletion
  });

  final bool initial;
  final int stage;
  final void Function() onCompletion;
  
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return   Column(
    children: [
      const CustomHeader(
        title: 'Create Account',
        subTitle: 'Getting your personal information to uniquely identify you!',
      ),
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: SignUpForm(formKey: formKey, onSuccess: onCompletion),
        ),
      ),
    ),
    ],
          );
  }
}

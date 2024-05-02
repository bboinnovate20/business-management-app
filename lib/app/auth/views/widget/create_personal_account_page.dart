
import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/views/widget/create_personal_account_form.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/header.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';

class CreatePersonalAccount extends StatelessWidget {
  const CreatePersonalAccount({
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
      child: CreatePersonalAccountForm(formKey: formKey, onSuccess: onCompletion),
    ),
    
    ],
          );
  }
}
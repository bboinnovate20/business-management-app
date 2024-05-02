
import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/views/widget/setup_business_form.dart';
import 'package:nex_spot_app/cores/common/widget/header.dart';

class SetupBusiness extends StatelessWidget {
  const SetupBusiness({super.key, 
  required this.stage,
  required this.onCompletion});

  final void Function() onCompletion;
  final int stage;
  
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const CustomHeader(
          title: 'Setup your Business',
          subTitle: 'We require your little business',
        ),
        Expanded(
            child: SetupBusinessForm(formKey: formKey, onSuccess: onCompletion),
        ),
      ],
    );
  }
}
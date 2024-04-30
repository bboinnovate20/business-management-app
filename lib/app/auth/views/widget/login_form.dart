import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';

import 'terms_conditions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key,
  required this.formKey
  });

  final  GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool readyToSubmit = false;
  bool loading = false;
  late GlobalKey<FormState> formKey;



  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  fieldsNotEmpty() {
    return  emailController.text.isNotEmpty
            && passwordController.text.isNotEmpty;
  }
  
  @override
  void initState() {
    formKey = widget.formKey;
    super.initState();
  }

  submit() {
    if(formKey.currentState!.validate()){
      //submit the form
      setState(() => loading = true);
      Future.delayed(const Duration(seconds: 1), () => setState(() => loading = false));
      debugPrint("readyToSubmit to server");
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: formKey,
          child:  Column(
          children: [

            CustomTextField(
              controller: emailController,
              label: 'Email Address *', validator: (value) => isValidEmail(value!), keyboardType: TextInputType.emailAddress, ),
            CustomTextField(
              controller: passwordController,
              label: 'Password *', validator: (value) => isValidPassword(value!), isSecured: true, keyboardType: TextInputType.visiblePassword),
          ],
        ),
        onChanged: () {
          if(fieldsNotEmpty()) {
            setState(() =>readyToSubmit = true);
          }
          else {
            if(readyToSubmit != false){setState(() =>readyToSubmit = false);}
          }
        },
        ),
        PrimaryButton(title: 
            loading ? 'Creating Account' :
            'Continue', onPressed: () =>submit(), disabled: loading || !readyToSubmit, loading: loading),
      ],
    );
  }
}


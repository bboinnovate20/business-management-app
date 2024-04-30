import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';

import 'terms_conditions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key,
  required this.formKey,
  required this.onSuccess
  });

  final  GlobalKey<FormState> formKey;
  final void Function() onSuccess;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool readyToSubmit = false;
  bool loading = false;
  late GlobalKey<FormState> formKey;
  final totalStage = 4;
  final initialState = 0;



  disposeControllers() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  fieldsNotEmpty() {
    return fullNameController.text.isNotEmpty && emailController.text.isNotEmpty
            && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty;
  }
  
  @override
  void initState() {
    formKey = widget.formKey;
    super.initState();
  }

  submit() async {
    if(formKey.currentState!.validate()){
      //submit the form
      setState(() => loading = true);
      await Future.delayed(const Duration(seconds: 1), () => setState(() => loading = false));
      debugPrint("readyToSubmit to server");
      //
      widget.onSuccess();
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
          children: [
            CustomTextField(
              controller: fullNameController,
              label: 'Full Name *', validator: (value) => isValidTwoWordName(value!), hintText: 'Surname and Last Name'),
            CustomTextField(
              controller: emailController,
              label: 'Email Address *', validator: (value) => isValidEmail(value!), keyboardType: TextInputType.emailAddress, ),
            CustomTextField(
              controller: passwordController,
              label: 'Password *', validator: (value) => isValidPassword(value!), isSecured: true, keyboardType: TextInputType.visiblePassword),
            CustomTextField(
              controller: confirmPasswordController,
              label: 'Confirm Password *', validator: (value) => 
              compareText(passwordController.text, confirmPasswordController.text, 'Confirm Password and Password do not match'),
               isSecured: true, keyboardType: TextInputType.visiblePassword, bottomMargin: 0),
            const TermsAndConditions(),
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


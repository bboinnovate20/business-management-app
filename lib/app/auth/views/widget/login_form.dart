import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nex_spot_app/app/auth/models/data/login.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';

import 'terms_conditions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key,
  required this.onFormValidated
  });


  final void Function(UserLogin suppliedData) onFormValidated;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool readyToSubmit = false;
  bool loading = false;
  late GlobalKey<FormState> formKey;
  final totalStage = 4;
  final initialState = 0;



  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  fieldsNotEmpty() {
    return emailController.text.isNotEmpty
            && passwordController.text.isNotEmpty;
  }
  
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  submit() async {
    if(formKey.currentState!.validate()){
      //submit the form
      setState(() => loading = true);
      await Future.delayed(const Duration(seconds: 1), () => setState(() => loading = false));
      debugPrint("readyToSubmit to server");
      //

      const UserLogin userLoginData = UserLogin("", "");

      widget.onFormValidated(userLoginData);
    } 
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CustomContainer(
      withMargin: false,
      bottom:  Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: PrimaryButton(title: 
                loading ? 'Checking your account' :
                'Login', onPressed: () =>submit(), disabled: loading || !readyToSubmit, loading: loading),
      ),
      child: Form(
        key: formKey,
        child:  ListView(
         padding: const EdgeInsets.only(top: 30), 
        children: [
         
          CustomTextField(
            controller: emailController,
            label: 'Email Address *', validator: (value) => isValidEmail(value!), keyboardType: TextInputType.emailAddress, ),
          CustomTextField(
            controller: passwordController,
            label: 'Password *', validator: (value) => isValidPassword(value!), isSecured: true, keyboardType: TextInputType.visiblePassword),
         
         
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: RichText(text:  
              TextSpan(
                 style: Theme.of(context).textTheme.bodyMedium,
                text: "Don't have an account? ",
                children: [
                TextSpan(
                  style: TextStyle(
                decoration: TextDecoration.underline,
                color: colorScheme.primary,
              ),
                  text: "Create Account",
                  recognizer: TapGestureRecognizer()..onTap = () => 
                        Navigator.pushNamed(context, NamedRoutes.register)
                )
              ]) )
            ),
          )
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
    );
  }
}


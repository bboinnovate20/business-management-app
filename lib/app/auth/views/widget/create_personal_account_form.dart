import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/cores/common/custom_toast.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';

import 'terms_conditions.dart';

class CreatePersonalAccountForm extends StatefulWidget {
  const CreatePersonalAccountForm({super.key,
  required this.formKey,
  required this.onSuccess,
  this.registerController
  });

  final  GlobalKey<FormState> formKey;
  final void Function() onSuccess;
  final RegisterController? registerController;

  @override
  State<CreatePersonalAccountForm> createState() => _CreatePersonalAccountFormState();
}

class _CreatePersonalAccountFormState extends State<CreatePersonalAccountForm> {

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
      formKey.currentState?.save();
      
      final Map<String,String> data = {
        'firstName': fullNameController.value.text.split(" ")[0],
        'lastName': fullNameController.value.text.split(" ")[1],
        'email': emailController.value.text,
        'password': passwordController.value.text
      };

      final result = await widget.registerController!.registerUser(data);
      
      if(result.success) {
        // ignore: use_build_context_synchronously
        CustomToast(Navigator.of(context)).showSuccessMessage(result.message);
        widget.onSuccess();  
      }
      else {
        // ignore: use_build_context_synchronously
        CustomToast(Navigator.of(context)).showErrorMessage(result.message);
      }
      setState(() => loading = false);
      // widget.onSuccess();
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
                loading ? 'Creating Account' :
                'Continue', onPressed: () =>submit(), 
                disabled: loading || !readyToSubmit, loading: loading),
      ),
      child: Form(
        key: formKey,
        child:  ListView(
         padding: const EdgeInsets.only(top: 25),
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: RichText(text:  
              TextSpan(
                 style: Theme.of(context).textTheme.bodyMedium,
                text: "Already have an account? ",
                children: [
                TextSpan(
                  style: TextStyle(
                decoration: TextDecoration.underline,
                color: colorScheme.primary,
              ),
                  text: "Sign In",
                  recognizer: TapGestureRecognizer()..onTap = () => 
                        Navigator.pushNamed(context, NamedRoutes.login)
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

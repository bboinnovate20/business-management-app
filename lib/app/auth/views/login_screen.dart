import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/auth/models/data/login.dart';
import 'package:nex_spot_app/app/auth/views/widget/login_form.dart';
import 'package:nex_spot_app/cores/common/custom_toast.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/header.dart';

class Login extends StatelessWidget {
  const Login({super.key});


  submitLoginToDashboard(NavigatorState context,  userLoginDetails) {
     CustomToast(context).showErrorMessage("Successfully Login in");
  }

  @override
  Widget build(BuildContext context) {
    
    return  CustomContainer(
      
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const CustomHeader(
                    title: 'Welcome Back!',
                    subTitle: 'Getting your personal information to uniquely identify you!',
                  ),
          ),
          
    Expanded(
      child: LoginForm(onFormValidated: (userData) => submitLoginToDashboard(
          Navigator.of(context), userData),),
      ),
      ],
    ));
  }
}
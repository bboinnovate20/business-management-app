// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/app/auth/provider/user_state_notifier.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/cores/common/custom_toast.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/custom_selection_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';


class SetupBusinessForm extends ConsumerStatefulWidget {
  const SetupBusinessForm({super.key,
  required this.formKey,
  required this.onSuccess
  });

  final  GlobalKey<FormState> formKey;
  final void Function() onSuccess;

  @override
  ConsumerState<SetupBusinessForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SetupBusinessForm> {

  final businessNameController = TextEditingController();
  final rcBusinessController = TextEditingController();
  final businessAddressController = TextEditingController();
  int? stateController;
  int? businessCategoryController;
  int? businessRoleController;

  bool readyToSubmit = false;
  bool loading = false;
  late GlobalKey<FormState> formKey;
  final totalStage = 4;
  final initialState = 0;
  late Future delay;


  disposeControllers() {
    businessNameController.dispose();
    rcBusinessController.dispose();
    businessAddressController.dispose();
  }

  fieldsNotEmpty() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return businessAddressController.text.isNotEmpty && businessNameController.text.isNotEmpty
            && stateController != null && businessCategoryController != null && businessRoleController != null;
  }
  
  @override
  void initState() {
    formKey = widget.formKey;
    super.initState();
  }

  submit(BuildContext context) async {

    if(formKey.currentState!.validate()){
      setState(() => loading = true);

      RegisterController register = RegisterController(ref);
      final UserBusinessAddress userBusinessAddress = UserBusinessAddress(
        street: businessAddressController.text, state: stateController.toString(), country: 'Nigeria');

      final UserBusinessDetails userBusinessDetails = UserBusinessDetails(
        userId: ref.watch(userStateNotifierProvider).userId,  
        businessName:  businessNameController.text,
        businessAddress: userBusinessAddress,
        businessCategory: businessCategoryController.toString(),
        businessRCNumber: rcBusinessController.text,
        role: businessRoleController.toString());

      final response = await register.registerBusiness(userBusinessDetails);

      if(response.success) {
        CustomToast(Navigator.of(context)).showSuccessMessage(response.message);
        widget.onSuccess();
      }
      else {
        CustomToast(Navigator.of(context)).showErrorMessage(response.message);
      }

      setState(() => loading = false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
    // delay.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("userssss ${ref.watch(userStateNotifierProvider).userId}");
          print(ref.watch(userStateNotifierProvider).userId);
    return CustomContainer(
      withMargin: false,
      bottom:  Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Builder(
          builder: (context) {
            return PrimaryButton(title: 
                    loading ? 'Creating Business Account' :
                    'Continue', onPressed: () =>submit(context), disabled: loading || !readyToSubmit, loading: loading);
          }
        ),
      ),
      child: Form(
        key: formKey,
        child:  ListView(
          padding: const EdgeInsets.only(top: 25),
        children: [
          CustomTextField(
            controller: businessNameController,
            label: 'Business Name *', validator: (value) => isValidName(value!, field: "Business Name"), hintText: 'Please enter valid Name'),
          CustomTextField(
            controller: rcBusinessController,
            label: 'Business RC Number (Optional)', validator: (value) => nameLength(value!,length: 10)),
            
            CustomSelectionField(
            label: 'Business Category',
            options: const [
              {
                'id': 1,
                'name': 'Food and Drinks'
              },
              {
                'id': 2,
                'name': 'Decorations'
              },
              {
                'id': 3,
                'name': 'Logistics'
              },
            ],
            onChangedValue: (value) { setState(() => businessCategoryController = value);},),
          CustomTextField(
            controller: businessAddressController,
            label: 'Business Address', validator: (value) => nameLength(value!,length: 10), keyboardType: TextInputType.streetAddress),
          CustomSelectionField(
            label: 'City',
            options: const [
              {
                'id': 1,
                'name': 'Lagos'
              },
              {
                'id': 2,
                'name': 'Abuja'
              },
              {
                'id': 3,
                'name': 'Uyo'
              }
            ],
            onChangedValue: (value) { setState(() => stateController = value);},),
             CustomSelectionField(
            label: 'Role',
            options: const [
              {
                'id': 1,
                'name': 'Vendor'
              },
              {
                'id': 2,
                'name': 'Service'
              }
            ],
            onChangedValue: (value) {setState(() => businessRoleController = value);},),
                
        ],
                ),
      onChanged: () async {
        if(await fieldsNotEmpty()) {
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


import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/common/widget/custom_container.dart';
import 'package:nex_spot_app/cores/common/widget/custom_text_field.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/validator.dart';

import 'terms_conditions.dart';

class SetupBusinessForm extends StatefulWidget {
  const SetupBusinessForm({super.key,
  required this.formKey,
  required this.onSuccess
  });

  final  GlobalKey<FormState> formKey;
  final void Function() onSuccess;

  @override
  State<SetupBusinessForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SetupBusinessForm> {

  final businessNameController = TextEditingController();
  final rcBusinessController = TextEditingController();
  final businessAddressController = TextEditingController();
  int? stateController;
  int? businessCategoryController;

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
            && stateController != null && businessCategoryController != null;
  }
  
  @override
  void initState() {
    formKey = widget.formKey;
    super.initState();
  }

  submit() {
    if(formKey.currentState!.validate()){
      //submit the form

      // setState(() => loading = true);
      // delay = Future.delayed(const Duration(seconds: 1), () => setState(() => loading = false));
      debugPrint("readyToSubmit to server");
      //
      widget.onSuccess();
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
    return CustomContainer(
      withMargin: false,
      bottom:  Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: PrimaryButton(title: 
                loading ? 'Creating Business Account' :
                'Continue', onPressed: () =>submit(), disabled: loading || !readyToSubmit, loading: loading),
      ),
      child: Padding(
      
         padding: const EdgeInsets.only(top: 25),
        child: Form(
          key: formKey,
          child:  ListView(
       
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
      ),
    );
  }
}


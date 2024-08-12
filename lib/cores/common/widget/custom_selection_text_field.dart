
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSelectionField extends StatefulWidget {
  const CustomSelectionField(
    {
      super.key,
      required this.onChangedValue,
      required this.label,
      this.options = const [],
      this.bottomMargin = 20,
    });


  final void Function(int?) onChangedValue;
  final List<Map<String, dynamic>> options;
  final String label;
  final double bottomMargin;

  @override
  State<CustomSelectionField> createState() => _CustomSelectionFieldState();
}

class _CustomSelectionFieldState extends State<CustomSelectionField> {
  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem> convertOptions(List<Map<String, dynamic>>  options) {
      List<DropdownMenuItem> dropDownList = [];

      options.every((element) {
        dropDownList.add(DropdownMenuItem(value: element['id'], child: Text(element['name'])));
        return true;
      });

      return dropDownList;
    }


    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Platform.isAndroid ? CustomSelectionCupertinoFormField(title: widget.label, options: widget.options, onChangedValue: (value){widget.onChangedValue(value);}) : DropdownButtonFormField(
        // validator: (options) => options['id'].isEmpty ? 'Required States' : null,
        decoration:   InputDecoration(
          // labelText: 'Select your State',
          label: Text(widget.label),
            filled: true,
            focusColor: Colors.white,
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red
                )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.purple.shade300
                )
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black45
                )
            ),
            fillColor: const Color.fromARGB(13, 0, 0, 0),
            
        ),
        items: convertOptions(widget.options), onChanged: (value) {widget.onChangedValue(value);}),
    );
  }
}



class CustomSelectionCupertinoFormField extends FormField<Map<String, dynamic>> {
  CustomSelectionCupertinoFormField({super.key, required this.title, 
    required this.options, required this.onChangedValue}): super(
    initialValue: {'id': -1, 'name': ""},
    builder: (FormFieldState field) {
        return CustomSelectionCupertino(
              title: title, 
              state: field, options: options, 
              onChangedValue: onChangedValue);
    }
  );

  final String title;
  final List<Map<String, dynamic>> options;
  final void Function(int?) onChangedValue;
  

}


class CustomSelectionCupertino extends StatelessWidget {
   
  
  const CustomSelectionCupertino({super.key, 
  required this.title, required this.options, required this.state, required this.onChangedValue});

  final String title;
  final List<Map<String, dynamic>> options;
  final void Function(int?) onChangedValue;
  final FormFieldState state;

  @override
  Widget build(BuildContext context) {
    return 
    
    InkWell(
      onTap: () async  {
          final value = await _showActionSheet(context);
          state.didChange(value);
          onChangedValue(state.value['id']);
      }
      ,
      child: Container(
        padding: const EdgeInsets.all(15),
        
        decoration:   BoxDecoration(
            // labelText: 'Select your State',
            color: const Color.fromARGB(13, 0, 0, 0),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                 color: Colors.black54,
                
              ),
              
          ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(state.value['id'] < 0 ? title : state.value['name'], 
            style: const TextStyle(color: Colors.black87),),
            const Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _showActionSheet(BuildContext context) async {
    return await showCupertinoModalPopup(context: context, builder: (BuildContext context) => 
        CupertinoActionSheet(
          title:  Text(title),
          actions: options.map((option) =>  CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(option)
              , 
            child: Text(option['name']))).toList(),
        )
    );

}
}
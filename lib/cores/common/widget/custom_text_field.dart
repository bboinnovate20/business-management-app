import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.bottomMargin = 20,
    required this.label,
    required this.validator,
    this.isSecured = false,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    required this.controller
  });

  final double bottomMargin;
  final String? Function(String?) validator;
  final String label;
  final bool isSecured;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    bool isHidden = true;
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      // width: MediaQuery.of(context).size.width,
      child: isSecured ?  
      StatefulBuilder(
        builder: (context, setState) {
          return TextFormField(
            controller: controller,
            obscureText: isHidden,
            validator: validator,
            keyboardType: keyboardType,
            decoration:  InputDecoration(

              hintText: hintText,
              label: Text(label),
              filled: true,
              focusColor: Colors.white,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 24,
                maxHeight: 24
              ),
              suffixIcon: GestureDetector(
                onTap: () => setState(() {isHidden = !isHidden;}),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: isHidden ? SvgPicture.asset(
                                alignment: Alignment.centerLeft,
                                "assets/icons/hide.svg",
                                semanticsLabel: 'Eye Close', width: 28):
                  SvgPicture.asset(
                                alignment: Alignment.centerLeft,
                                "assets/icons/view.svg",
                                semanticsLabel: 'Eye Close', width: 28)              
                   
                                ,
                ),
              ),
              // errorText: "First Name is required",
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
              fillColor: const Color.fromARGB(13, 0, 0, 0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black45
                  )
              )
            ),
          );
        }
      ):
      TextFormField(
        controller: controller,
        validator: validator,
        decoration:  InputDecoration(
          hintText: hintText,
          label: Text(label),
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
          fillColor: const Color.fromARGB(13, 0, 0, 0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black45
              )
          )
        ),
      ) ,
    );
  }
}


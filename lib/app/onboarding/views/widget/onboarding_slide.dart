import 'package:flutter/material.dart';
import 'text_heading.dart';


class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({
    super.key,
    required this.text,
    required this.endText,
    required this.subText,
    required this.visualWidget,
  });

  final String text;
  final String endText;
  final String subText;
  final Widget visualWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          margin: const EdgeInsets.only(right: 15, left: 15),
          child:  Column(
            children: [
              SizedBox(
                height: 122,
                child: TextHeading(
                  text: text,
                  endText: endText,
                  subText: subText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),  
                child: ClipOval(    
                    child: Container(
                      width: 260,
                      height: 260,
                      color: Colors.purple.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: visualWidget,
                      ),
                      ),
                  ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class AIButton extends StatelessWidget {
  const AIButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedPrimaryButton(onPressed: () {}, 
            radius: 40,
            bgColor: context.colorScheme.tertiary,
            title: "Generate Content for Lead using AI",
            );
  }
}
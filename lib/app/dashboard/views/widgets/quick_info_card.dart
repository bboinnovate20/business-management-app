import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickInfoCards extends StatelessWidget {
  const QuickInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          cardCustom(),
          cardCustom()
        ],
      ),
    );
  }
}


Widget cardCustom() {
  return  Row(
    children: [
      const Column(
        children: [
            Expanded(flex: 1, child: Text("Products")),
            Expanded(flex: 1, child: Text("20")),
        ],

      ),
      //image
      const Text('ddd'),
      SvgPicture.asset('assets/icons/customer.svg', height: 80, width: 80)
    ],
  );
}
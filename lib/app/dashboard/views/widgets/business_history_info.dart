import 'package:flutter/material.dart';

import 'package:nex_spot_app/cores/utils/extension.dart';

class BusinessHistoryInfo extends StatelessWidget {
  const BusinessHistoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:   BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius:4),
          
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
        ),
      
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          singleBusHistory(context, 255000, "Customer"),
          singleBusHistory(context, 26, "Invoices"),
          singleBusHistory(context, 100, "Receipt")
        ],
        
        ),
    );
  }
}

Widget singleBusHistory(BuildContext context, double figure, String title) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 3.77,
    child: Column(
              children: [
                Text(figure.roundUnit, style: context.textTheme.headlineMedium?.copyWith(height: 0.9)),
                Text(title),
              ],
            ),
  );
}
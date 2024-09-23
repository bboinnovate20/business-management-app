import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class TransactionActions extends StatelessWidget {
  const TransactionActions({super.key});

  @override
  Widget build(BuildContext context) {


    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        basicAction(context, 'Add Customers', Icon(Icons.add, 
                    color: context.colorScheme.secondary, )),
        
        basicAction(context, 'Add Product', SvgPicture.asset('assets/icons/add_product.svg')),
        
        basicAction(context, 'Pending Invoices', Icon(Icons.receipt_long, size: 24, 
                      color: context.colorScheme.secondary)),
        
        // basicAction(context, 'Services',Icon(Icons.miscellaneous_services, size: 24, 
        //               color: context.colorScheme.secondary)),
      ],
    );
  }
}


Widget basicAction(BuildContext context, String title, Widget child ) {
  return SizedBox(
          width: 110,
          child: Column(
            children: [
             CircleAvatar(
                radius: 27,
                child: SizedBox.square(
                  child: child,
              )),
             Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(title , textAlign: TextAlign.center, style: context.textTheme.titleSmall?.copyWith(height: 1.2)),
              )
            ],
          ),
        );
}
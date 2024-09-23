import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';
import 'package:nex_spot_app/cores/common/transaction_cases.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';






class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.status});

  final TransactionStatus status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //mark
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child:transactionWidget(status))),
             Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Receipt | Ojewolewode", style: TextStyle(height: 1.4), maxLines: 1),
                  Text("25th March, 2024", style: context.textTheme.bodySmall?.copyWith(color: Colors.grey))
                ],
              ),
            ),
             const Expanded(
              
              flex: 4,
              child: Align(
                alignment: Alignment.topRight,
                child: Text("N200,000", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}

Widget transactionWidget(TransactionStatus status ) {
  return switch (status) {
      TransactionStatus.failed =>
        SvgPicture.asset("assets/icons/failed_transaction.svg", width: 28),
    
     TransactionStatus.pending =>
        SvgPicture.asset("assets/icons/pending_transaction.svg", width: 28),
    
     TransactionStatus.success =>
        SvgPicture.asset("assets/icons/success_transaction.svg", width: 28) 
  };
}
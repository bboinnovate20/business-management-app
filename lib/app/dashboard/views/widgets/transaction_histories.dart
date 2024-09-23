import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/history_card.dart';
import 'package:nex_spot_app/cores/common/transaction_cases.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class TransactionHistories extends StatelessWidget {
  const TransactionHistories({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
               Padding(
                 padding: const EdgeInsets.only(bottom: 8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Recent Histories", style: context.textTheme.titleLarge?.copyWith(fontSize: 18),),
                  Container(decoration: BoxDecoration(color: Colors.black12,
                   borderRadius: BorderRadius.circular(50)),
                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                   child:  Text("View All >", style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),),)
                               ],),
               ),
                const HistoryCard(status: TransactionStatus.success),
                const HistoryCard(status: TransactionStatus.pending),
                const HistoryCard(status: TransactionStatus.failed),
      ],
    );
  }
}

                // HistoryCard(status: TransactionStatus.success),
                // HistoryCard(status: TransactionStatus.pending),
                // HistoryCard(status: TransactionStatus.failed),
                // HistoryCard(status: TransactionStatus.success),
                // HistoryCard(status: TransactionStatus.success),
//  PinnedHeaderSliver(child: 
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 2),
//               margin: const EdgeInsets.only(bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text("Recent Histories", style: context.textTheme.titleLarge?.copyWith(fontSize: 18),),
//                 Container(decoration: BoxDecoration(color: Colors.black12,
//                  borderRadius: BorderRadius.circular(50)),
//                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                  child:  Text("View All >", style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),),)
//               ],),
//             )



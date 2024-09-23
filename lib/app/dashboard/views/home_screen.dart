import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/ai_button.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/basic_transaction_actions.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/business_history_info.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/customer_reward_button.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/top_card.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/top_header.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/transaction_histories.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  
  @override
  Widget build(BuildContext context) {
    //change order and parent to scrolling
  final ScrollController scrollController = ScrollController();
    

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: 
          
           CustomScrollView(
            controller: scrollController,
            slivers:  [
              const PinnedHeaderSliver(child: TopHeader()), 

            SliverPadding(padding: const EdgeInsets.all(2), sliver: 
              SliverList.list(children: [
              const TopHomeCard(),
              const BusinessHistoryInfo(),
              
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: AIButton(),
              ),
              // const Spacer(flex: 1),
               const TransactionHistories(),
               
               const CustomerRewardButton(),

            ].spacedColumn(20),)
            ),
           
              // const SizedBox(height: 20, child: CustomerRewardButton()),
            ],
            
          ),
        ),
      )
    );
  }
}


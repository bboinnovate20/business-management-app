import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/business_header_top.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/quick_info_card.dart';

class BusinessDashboard extends StatelessWidget {
  const BusinessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(title: const Text("My Business"), forceMaterialTransparency: true),

      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverList.list(children:  const [
              BusinessTopHeader(),
              QuickInfoCards()

            ])
          ],
        )
        
        ),
    );
  }
}
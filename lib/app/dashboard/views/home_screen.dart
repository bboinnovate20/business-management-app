import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/business_history_info.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/top_card.dart';
import 'package:nex_spot_app/app/dashboard/views/widgets/top_header.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: const Column(
            children: [
              TopHeader(),
              TopHomeCard(),
              BusinessHistoryInfo(),
            ],
          ).spacedColumn(20),
        ),
      )
    );
  }
}


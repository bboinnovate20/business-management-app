import 'package:flutter/material.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
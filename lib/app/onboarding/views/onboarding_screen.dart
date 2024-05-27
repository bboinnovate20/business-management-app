import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:rive/rive.dart';

import 'package:nex_spot_app/cores/common/clamp_int.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';

import 'package:nex_spot_app/app/onboarding/views/widget/image_heading.dart';
import 'package:nex_spot_app/app/onboarding/views/widget/page_indicator.dart';
import 'widget/onboarding_slide.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  final totalPageIndex = 4;
  late Timer _timer;


  void resetTimer() {
    if(_timer.isActive) {
      _timer.cancel();
      automateSlide();
    }
  }

  void _handlePageViewChanged(int currentPageIndex) {
    resetTimer();
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

   void _updateCurrentPageIndex(int index) {
    // resetTimer();
    if(index == 0) {_pageViewController.jumpToPage(index);}
    else {
      _pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }

    Future.delayed(const Duration(milliseconds: 400), () => {
      _tabController.index = index
    });
  }

  Timer automateSlide() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
          int currentNewIndex = clampInt(_currentPageIndex + 1, 0, totalPageIndex -1);
          _updateCurrentPageIndex(currentNewIndex);
     });
     return _timer;
  }


   @override
  void initState() {
    super.initState();
     _pageViewController = PageController();
    _tabController = TabController(length: totalPageIndex, vsync: this);
    automateSlide();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AnimatedPrimaryButton(
              onPressed: () => Navigator.pushReplacementNamed(context, NamedRoutes.register), 
            title: "Sign Up" ),
            Container(height: 15),
            AnimatedPrimaryButton(
              outline: true,
              onPressed: () => Navigator.pushReplacementNamed(context, NamedRoutes.login), 
            title: "Already Sign up? Login in" )
          ],
        ),),       
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const ImageHeading(),
            SizedBox(
              height: MediaQuery.of(context).size.height /1.7,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                  controller: _pageViewController,
                  onPageChanged: _handlePageViewChanged,
                  children: const [
                    OnboardingSlide(
                     text: 'Effortlessly Manage your ',
                      endText: 'Customer Details',
                      subText: '...and Focus more on your Product',
                      visualWidget: RiveAnimation.asset('assets/animations/customer.riv'),
                    ),
                    OnboardingSlide(
                     text: 'Instant ',
                      endText: 'Receipt Generation Made Easy',
                      subText: 'Generate receipt and easily keep track of history',
                      visualWidget: RiveAnimation.asset('assets/animations/receipts.riv'),
                    ),
                    OnboardingSlide(
                     text: 'Analyze your ',
                      endText: "Customers' Performance",
                      subText: 'Analyze and reward customers based on their purchase rate',
                      visualWidget: RiveAnimation.asset('assets/animations/chart.riv'),
                    ),
                    OnboardingSlide(
                     text: 'Use ',
                      endText: 'AI to craft engaging Customer Content',
                      subText: '...and Focus more on your Product',
                      visualWidget: RiveAnimation.asset('assets/animations/ai.riv'),
                    ),
                  ]
                ),
            
                PageIndicator(
                    tabController: _tabController, 
                    currentPageIndex: _currentPageIndex, 
                    onUpdateCurrentPageIndex: (_handlePageViewChanged),
                    onTap: _updateCurrentPageIndex
                ),
               ],
              ),
            ),
            
            //  Expanded(
            //    child: Container(
                
            //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //     child: ,),
            //  ),
             
          ],
        ),
      )
      
    );
  }
  
}



class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.onTap,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TabPageCustomSelector(
      
      controller: tabController,
      selectedColor: colorScheme.primary,
      colorScheme: colorScheme,
      onTap: (index) => onTap(index),
      
      );
  }
}


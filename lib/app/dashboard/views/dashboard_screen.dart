import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nex_spot_app/app/dashboard/views/business_screen.dart';
import 'package:nex_spot_app/app/dashboard/views/home_screen.dart';
import 'package:nex_spot_app/cores/utils/extension.dart';

class Dashboard extends StatefulWidget  {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

 
}

class _DashboardState extends State<Dashboard>   {

  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, 
        elevation: 20,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(index);
             _pageController.jumpToPage(index);

            
            
          });
        },
        items:  [
          navBarItem(context, "home", "Home", currentIndex == 0),
          navBarItem(context, "business", "Business", currentIndex == 1),
          navBarItem(context, "receipt", "Receipt", currentIndex == 2),
          navBarItem(context, "setting", "Setting", currentIndex == 3),
        // BottomNavigationBarItem(icon: Text("T")),
        // BottomNavigationBarItem(icon: Text("T"))
      ]),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
            BusinessDashboard(),
            Home(),
         
            Home(),
            // BusinessDashboard(),
            ],

          )
      
      );
  }
}



BottomNavigationBarItem navBarItem (BuildContext context, String icon, String label, bool isActive) {
  return BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/$icon.svg",
                    colorFilter:  ColorFilter.mode(isActive ? context.colorScheme.primary : Colors.black87, 
                    BlendMode.srcIn)), label: label,);
}
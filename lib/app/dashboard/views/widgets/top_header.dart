import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/images/profile_avatar.png'),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Hi Ibrahim!", style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 0)),
            const Text("BBOI DECORATION", style: TextStyle(color: Colors.black87, height: 0))
          ],),
          const Spacer(flex: 1),
          Stack(
            children: [
              
              SizedBox.square(
              child: SvgPicture.asset('assets/icons/notification.svg'),),
              Positioned(right: 0, child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  
                ),
                width: 10,
                height: 10),),
              ]
          )
          
          // SizedBox.square()
        ],
      ),
    );
  }
}
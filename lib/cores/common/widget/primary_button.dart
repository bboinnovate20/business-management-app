import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nex_spot_app/cores/utils/lerp.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = 60,
    this.disabled = true,
    this.loading = false,
    this.icon
  });

  final void Function() onPressed;
  final double width;
  final bool disabled;
  final double height;
  final String title;
  final bool loading;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        
        style: ButtonStyle(
          
          padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(vertical: 15)),
          
          backgroundColor: disabled ? const WidgetStatePropertyAll(Colors.grey) : 
                WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed) ?
                colorScheme.secondary :colorScheme.primary),

          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)))
         ),
        onPressed: disabled ? (){} : onPressed, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, 
                style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon ?? Container(),
            if(loading)
              Container(
                width: 18,
                height: 18,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
          ],
        )),
    );
  }
}




class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = 60,
    this.disabled = false,
    this.loading = false,
    this.isOutline = false,
    this.bgColor,
    this.radius = 10,
    this.color = Colors.white,
    this.verticalPadding = 15,
    this.fontSize = 18
  });

  final void Function() onPressed;
  final double width;
  final bool disabled;
  final double height;
  final String title;
  final bool loading;
  final bool isOutline;
  final Color? bgColor;
  final double radius;
  final double verticalPadding;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
  
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        
        style: 
        
        isOutline ?
        //outline 
        ButtonStyle(
          
          padding: WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(vertical: verticalPadding)),
          
          backgroundColor: disabled ? const WidgetStatePropertyAll(Colors.grey) : 
                WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed) ?
                Colors.grey :Colors.white),
          
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            side: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(radius)))
         ):
        
        ButtonStyle(
          
          padding: WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(vertical: verticalPadding)),
          
          backgroundColor: disabled ? const WidgetStatePropertyAll(Colors.grey) : 
                WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed) ?
                colorScheme.secondary : bgColor ?? colorScheme.primary),

          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)))
         ),
        onPressed: disabled ? (){} : onPressed, 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, 
                  style: TextStyle(color: isOutline ? Colors.black : color, fontSize: fontSize),
              ),
              if(loading)
                Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
            ],
          ),
        )),
    ).rWidth;
  }
}








class AnimatedPrimaryButton extends StatefulWidget  {
  const AnimatedPrimaryButton({
    super.key,
    required this.onPressed,
    this.width = 400,
    this.height = 60,
    this.disabled = false,
    this.title = "Continue",
    this.outline = false,
    this.radius = 10,
    this.bgColor,
  });

  final void Function() onPressed;

  final double width;
  final bool disabled;
  final double height;
  final String title;
  final bool outline;
  final double radius;
  final Color? bgColor;
  @override
  State<AnimatedPrimaryButton> createState() => _AnimatedPrimaryButtonState();
}

class _AnimatedPrimaryButtonState extends State<AnimatedPrimaryButton> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

    late AnimationController _opacityController;
    late final Animation<double> _opacity;


  @override
  void initState() {
    super.initState();

    _opacityController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _opacity = Tween<double>(begin:0.0, end: 1.0 ).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeIn)
    );

    _opacityController.forward();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _opacityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
        animation: _opacityController,
        builder: (context, child) {
          return SizedBox(
            width:  lerp(_opacity.value, 0.0, 1.0, 350, widget.width),
            height: widget.height,
            child: Opacity(
              opacity:_opacity.value,
              child: ElevatedButton(
                  style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(vertical: 15)),
                  backgroundColor: WidgetStateProperty.resolveWith((states) => 
                  states.contains(WidgetState.pressed) ?
                      colorScheme.secondary : widget.outline ? Colors.white : widget.bgColor ?? colorScheme.primary),
                  
                  // MaterialStatePropertyAll(colorScheme.primary),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: widget.outline ?  BorderSide(width: 1.0, color: colorScheme.primary) : BorderSide.none,
                    borderRadius: BorderRadius.circular(lerp(
                      _opacity.value, 0.0, 1.0, 100, widget.radius
                    ))))
                ),
                onPressed: widget.disabled ? () => {} : widget.onPressed, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title, 
                      style: TextStyle(color: widget.outline ? colorScheme.primary : Colors.white, fontSize: 16)),
                      Transform.translate(
                        offset: Offset(
                          lerp(_opacity.value, 0.0, 1.0, 10,0)
                        , 0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: SvgPicture.asset(
                            alignment: Alignment.center,
                            "assets/icons/arrow-right-02-round.svg",
                             colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            semanticsLabel: 'Arrow Right'
                          ),
                        ),
                      )
                  ],
                )
              ),
            ),
          );
        }
      );
  }
}


extension GapWith on SizedBox {
  
  SizedBox get rWidth {
    return SizedBox(
      width: width == 0 ? null : width,
      height: height,
      child: child,
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

class TabPageCustomSelector extends TabPageSelector {
  const TabPageCustomSelector({
    super.key,
    required super.controller,
    super.selectedColor,
    required this.colorScheme,
    required this.onTap,
    this.size = 22,
  });

  final ColorScheme colorScheme;
  final void Function(int) onTap;
  
  final double size;

  double _indexChangeProgress(TabController controller) {
  final double controllerValue = controller.animation!.value;
  final double previousIndex = controller.previousIndex.toDouble();
  final double currentIndex = controller.index.toDouble();

    // The controller's offset is changing because the user is dragging the
    // TabBarView's PageView to the left or right.
    if (!controller.indexIsChanging) {
        return clampDouble((currentIndex - controllerValue).abs(), 0.0, 1.0);
    }

    // The TabController animation's value is changing from previousIndex to currentIndex.
    return (controllerValue - currentIndex).abs() / (currentIndex - previousIndex).abs();
  }

    Widget buildTabIndicator(
    int tabIndex,
    TabController tabController,
    ColorTween selectedColorTween,
    ColorTween previousColorTween,
  ) {
    final Color background;
    if (tabController.indexIsChanging) {
      // The selection's animation is animating from previousValue to value.
      final double t = 1.0 - _indexChangeProgress(tabController);
      if (tabController.index == tabIndex) {
        background = selectedColorTween.lerp(t)!;
      } else if (tabController.previousIndex == tabIndex) {
        background = previousColorTween.lerp(t)!;
      } else {
        background = selectedColorTween.begin!;
      }
    } else {
      // The selection's offset reflects how far the TabBarView has / been dragged
      // to the previous page (-1.0 to 0.0) or the next page (0.0 to 1.0).
      final double offset = tabController.offset;
      if (tabController.index == tabIndex) {
        background = selectedColorTween.lerp(1.0 - offset.abs())!;
      } else if (tabController.index == tabIndex - 1 && offset > 0.0) {
        background = selectedColorTween.lerp(offset)!;
      } else if (tabController.index == tabIndex + 1 && offset < 0.0) {
        background = selectedColorTween.lerp(-offset)!;
      } else {
        background = selectedColorTween.begin!;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => onTap(tabIndex),
        child: TabPageSelectorIndicator(
          backgroundColor: background,
          borderColor: selectedColorTween.end!,
          size: size,
          borderStyle: borderStyle ?? BorderStyle.solid,
        ),
      ),
    );
  }

      @override
    Widget build(BuildContext context) {
    final Color fixColor = color ?? Colors.transparent;
    final Color fixSelectedColor = selectedColor ?? Theme.of(context).colorScheme.secondary;
    final ColorTween selectedColorTween = ColorTween(begin: fixColor, end: fixSelectedColor);
    final ColorTween previousColorTween = ColorTween(begin: fixSelectedColor, end: fixColor);
    final TabController? tabController = controller ?? DefaultTabController.maybeOf(context);
	  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    assert(() {
      if (tabController == null) {
        throw FlutterError(
          'No TabController for $runtimeType.\n'
          'When creating a $runtimeType, you must either provide an explicit TabController '
          'using the "controller" property, or you must ensure that there is a '
          'DefaultTabController above the $runtimeType.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());
    final Animation<double> animation = CurvedAnimation(
      parent: tabController!.animation!,
      curve: Curves.fastOutSlowIn,
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Semantics(
          label: localizations.tabLabel(tabIndex: tabController.index + 1, tabCount: tabController.length),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(tabController.length, (int tabIndex) {
              return buildTabIndicator(tabIndex, tabController, selectedColorTween, previousColorTween);
            }).toList(),
          ),
        );
      },
    );
  }

}

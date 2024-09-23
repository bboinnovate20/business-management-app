import 'package:flutter/material.dart';
import 'package:nex_spot_app/cores/utils/round_figure.dart';

extension CustomTextStyle on BuildContext {
    ColorScheme get colorScheme {
      return Theme.of(this).colorScheme;
    }

    TextTheme get textTheme {
      return Theme.of(this).textTheme;
    }


} 

extension SpacedColumn on Column {
  spacedColumn (double space){
    final spacedColumn = <Widget>[];
    for (var child in children) {
      if(spacedColumn.isEmpty) {
        spacedColumn.add(child);
      }
      else {
        spacedColumn.add(SizedBox(height: space));
        spacedColumn.add(child);
      }
    }
    return Column(crossAxisAlignment: crossAxisAlignment, mainAxisAlignment: mainAxisAlignment,mainAxisSize: mainAxisSize, children: spacedColumn);
  }
}

extension SpacedList on List {
  spacedColumn (double space){
    final spacedColumn = <Widget>[];
    forEach((child) {
      // if(spacedColumn.isEmpty) {
      //   spacedColumn.add(child);
      // }
      // else {
        spacedColumn.add(SizedBox(height: space));
        spacedColumn.add(child);
      // }
    });
    return spacedColumn.toList();
    // return Column(crossAxisAlignment: crossAxisAlignment, mainAxisAlignment: mainAxisAlignment,mainAxisSize: mainAxisSize, children: spacedColumn);
  }
}


extension AbbreviateFigure on num {
  get roundUnit {
    return roundFigure(toDouble());
  }
}
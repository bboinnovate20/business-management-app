enum Units { 
  thousand, 
  millions
}

roundFigure(double figure) {
  final rounded = checkUnit(figure.round().toInt().toString());
  return rounded;
}

String checkUnit(String figure) {
  const thousand = [4, 6];
  const million = [7, 9];

  if(figure.length >= thousand[0] && figure.length <= thousand[1]){
    return checkUnitPlus(figure, Units.thousand);
  }

  if(figure.length >= million[0] && figure.length <= million[1]){
    return checkUnitPlus(figure, Units.millions);
  }

  return figure;
}


checkUnitPlus(String figure, Units unit) {
  //1,000 // 50,000
  int startPosition = 0;
  String shortHand = '';
  if(unit == Units.thousand) {
     startPosition = figure.length - 3;
     shortHand = 'k';

  }
  if(unit == Units.millions) {
     startPosition = figure.length - 6;
     shortHand = 'm';
  }

    final List arrayList = figure.split("");
    int num = int.parse(arrayList.sublist(startPosition, figure.length).join()) ;
    int viewNum = int.parse(arrayList.sublist(0, startPosition).join()); 
  
    if(num > 1) return '$viewNum$shortHand+';
    
    return '$viewNum$shortHand';
}


import 'package:flutter_test/flutter_test.dart';
import 'package:nex_spot_app/cores/utils/round_figure.dart';

void main() {
  test('Rounded Figure function', () {
    
    final rounded = roundFigure(1);
    final rounded2 = roundFigure(10);
    final rounded3 = roundFigure(989);
    final rounded4 = roundFigure(9899);
    final rounded5 = roundFigure(98999);
    final rounded6 = roundFigure(989998);
    final rounded7 = roundFigure(9899989);

    expect(rounded, "1");
    expect(rounded2, "10");
    expect(rounded3, "989");
    expect(rounded4, "9k+");
    expect(rounded5, "98k+");
    expect(rounded6, "989k+");
    expect(rounded7, "9m+");

  });
}
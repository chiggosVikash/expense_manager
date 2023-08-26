
import 'dart:math';

extension RandomExtension on Random{

  double get opacity{
    const double minOpacity = .4;
    final randomNo = nextDouble();
    if(randomNo < .2) {
      return minOpacity;
    }
    return randomNo;
  }
}
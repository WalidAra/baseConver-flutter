String ConverterBase(int base, double number) {
  int intPart = number.floor();
  double floatPart = number - intPart;
  String result = '';

  while (intPart != 0) {
    int digit = intPart % base;

    if( base == 16){
      result = SwitcherForHexa(digit) + result;
    }else{
      result = digit.toString() + result ;
    }
    
    intPart = intPart ~/ base;
  }

  if (floatPart > 0) {
    result += '.';

    while (floatPart > 0) {
      floatPart *= base;
      int digit = floatPart.floor();
      result += digit.toString();
      floatPart -= digit;
    }
  }

  return result;
}


String SwitcherForHexa( int digit ){
  const map = {
    10:"A" ,11:"B" ,12:"C",13:"D" , 14:"E" , 15:"D"
  };
  String result = map[digit] ?? digit.toString();

  return result ;
}
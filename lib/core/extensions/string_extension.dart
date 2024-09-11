
extension StringExtensions on String? {
  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this ?? "");
  }

  // String? get curreny {
  //   if (AppConstants.currencySymbol.suffix) {
  //     return "$this ${AppConstants.currencySymbol.symbol}";
  //   } else {
  //     return "${AppConstants.currencySymbol.symbol} $this";
  //   }
  // }
}

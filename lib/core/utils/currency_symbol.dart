class Currency {
  final String symbol;
  final String locale;
  final bool suffix;

  Currency({required this.symbol, required this.locale,required this.suffix});
}

List<Currency> currenyList = [
  Currency(symbol: '\$', locale: 'en_US',suffix: false),
  Currency(symbol: '€', locale: 'en_EU',suffix: false),
  Currency(symbol: '£', locale: 'en_GB',suffix: false),
  Currency(symbol: '¥', locale: 'ja_JP',suffix: false),
  Currency(symbol: '₹', locale: 'hi_IN',suffix: false),
  Currency(symbol: '₩', locale: 'ko_KR',suffix: false),
  Currency(symbol: '₽', locale: 'ru_RU',suffix: true),
  Currency(symbol: '฿', locale: 'th_TH',suffix: true),
  Currency(symbol: 'C\$', locale: 'en_CA',suffix: false),
  Currency(symbol: 'A\$', locale: 'en_AU',suffix: false),
  Currency(symbol: 'R', locale: 'af_ZA',suffix: false),
  Currency(symbol: '₪', locale: 'he_IL',suffix: false),
  Currency(symbol: 'kr', locale: 'sv_SE',suffix: false),
  Currency(symbol: 'zł', locale: 'pl_PL',suffix: true),
  Currency(symbol: 'Ft', locale: 'hu_HU',suffix: true),
  Currency(symbol: '₱', locale: 'fil_PH',suffix: false),
  Currency(symbol: 'Kč', locale: 'cs_CZ',suffix: true),
  Currency(symbol: 'AED', locale: 'ar_AE',suffix: false),
  Currency(symbol: 'fr', locale: 'de_CH',suffix: false),
];

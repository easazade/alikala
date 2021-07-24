import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Translations is a class used to localize the strings and texts used in app
class Translations {
  Translations(this.locale);

  final Locale locale;

  String get title => _localizedValues[locale.languageCode]!['title']!;
  String get themeNumber1 => _localizedValues[locale.languageCode]!['themeNumber1']!;
  String get themeNumber2 => _localizedValues[locale.languageCode]!['themeNumber2']!;
  String get hafezPoems => _localizedValues[locale.languageCode]!['hafezPoems']!;
  String get hafezFall => _localizedValues[locale.languageCode]!['hafezFall']!;
  String get chosenPoems => _localizedValues[locale.languageCode]!['chosenPoems']!;
  String get nonHafezPoems => _localizedValues[locale.languageCode]!['nonHafezPoems']!;
  String get whyBekr => _localizedValues[locale.languageCode]!['whyBekr']!;
  String get hafezBekr => _localizedValues[locale.languageCode]!['hafezBekr']!;
  String get makeAWish => _localizedValues[locale.languageCode]!['makeAWish']!;
  String get seeYourFortune => _localizedValues[locale.languageCode]!['seeYourFortune']!;
  String get noFavorites => _localizedValues[locale.languageCode]!['noFavorites']!;
  String get haveNot => _localizedValues[locale.languageCode]!['haveNot']!;
  String get searchPoems => _localizedValues[locale.languageCode]!['searchPoems']!;
  String get meaningOfPoemNumber => _localizedValues[locale.languageCode]!['meaningOfPoemNumber']!;
  String get poemNumber => _localizedValues[locale.languageCode]!['poemNumber']!;
  String get collectionOfHafezPoems => _localizedValues[locale.languageCode]!['collectionOfHafezPoems']!;
  String get next => _localizedValues[locale.languageCode]!['next']!;
  String get previous => _localizedValues[locale.languageCode]!['previous']!;
  String get meaning => _localizedValues[locale.languageCode]!['meaning']!;
  String get chooseLanguage => _localizedValues[locale.languageCode]!['chooseLanguage']!;
  String get pleaseWait => _localizedValues[locale.languageCode]!['pleaseWait']!;

  String get nothingFound => _localizedValues[locale.languageCode]!['nothingFound']!;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations)!;
  }

  @visibleForTesting
  static test() {
    return Translations(Locale('fa'));
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'themeNumber1': 'Theme 1',
      'themeNumber2': 'Theme 2',
      'hafezPoems': 'Ghazal-hAye HAfez',
      'hafezFall': 'FAle HAfez',
      'chosenPoems': 'Ghazal-hAye entekhAbi',
      'nonHafezPoems': 'Ghazal-hAye gheyre HAefzi',
      'whyBekr': 'CherA bekr?',
      'hafezBekr': 'HAfez Bekr',
      'makeAWish': 'Ni-yat karde va bar rooye gereftan FAal klik konid',
      'seeYourFortune': 'FAL BEGIR',
      'noFavorites': 'Hanooz hich sheri rA be Ghazal-hAye entekhAbi ezAfe',
      'haveNot': 'nakardeid.',
      'searchPoems': 'Jostejooye ashAr',
      'meaningOfPoemNumber': 'mani sher e shomAre',
      'poemNumber': 'Sher e shomAre',
      'collectionOfHafezPoems': 'Ghazal-hAye HAfez',
      'next': 'Baadi',
      'previous': 'Ghabli',
      'meaning': 'Maani',
      'chooseLanguage': 'entekhAb e zabAn',
      'pleaseWait': "Lotfan Montazer bemAnid ...",
      'nothingFound': 'Natije yAft nashod'
    },
    'fa': {
      'themeNumber1': 'تم شماره 1',
      'themeNumber2': 'تم شماره 2',
      'hafezPoems': 'غزلیات حافظ بکر',
      'hafezFall': 'فال حافظ',
      'chosenPoems': 'غزلیات انتخابی',
      'nonHafezPoems': 'غزلیات غیر حافظی',
      'whyBekr': 'چرا بکر',
      'hafezBekr': 'حافظ بکر',
      'makeAWish': 'نیت کرده و بر روی گرفتن فال کلیک نمایید',
      'seeYourFortune': 'فال بگیر',
      'noFavorites': 'هنوز هیچ شعری را به لیست انتخابی ها اضافه',
      'haveNot': 'نکرده‌اید.',
      'searchPoems': 'جستجوی اشعار',
      'meaningOfPoemNumber': 'معنی شعر شماره',
      'poemNumber': 'شعر شماره',
      'collectionOfHafezPoems': 'غزلیات جامع حافظی',
      'next': 'بعدی',
      'previous': 'قبلی',
      'meaning': 'معنی',
      'chooseLanguage': 'انتخاب زبان',
      'pleaseWait': "لطفا منتظر بمانید ...",
      'nothingFound': 'نتیجه‌ای یافت نشد'
    },
  };
}

class TranslationBaseDelegate extends LocalizationsDelegate<Translations> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fa'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    //if we need to get Locale from server then we will return an async Future
    return SynchronousFuture<Translations>(Translations(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}

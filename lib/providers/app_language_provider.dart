import 'package:flutter/material.dart';

class AppLanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('en'); // اللغة الافتراضية English

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'ar'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners(); // تحدث الواجهة لما اللغة تتغير
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
// import 'package:flutter/material.dart';
//
// class AppLanguageProvider with ChangeNotifier {
//   Locale _locale = const Locale('en'); // اللغة الافتراضية English
//
//   Locale get locale => _locale;
//
//   void setLocale(Locale locale) {
//     if (!['en', 'ar'].contains(locale.languageCode)) return;
//     _locale = locale;
//     notifyListeners(); // تحديث الواجهة عند تغيير اللغة
//   }
//
//   void clearLocale() {
//     _locale = const Locale('en'); // ترجع للإنجليزية كـ fallback
//     notifyListeners();
//   }
// }

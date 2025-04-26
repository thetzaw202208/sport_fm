import 'package:sport_fm/language/vi_language.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:sport_fm/language/zh_language.dart';
import 'en_language.dart';
import 'hindi_language.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'my_MM': MMLanguage().mmLanguage,
        'en_US': EnLanguage().enLanguage,
        // 'hi_IN': HiLanguage().hiLanguage,
        // 'vi_VN': ViLanguage().viLanguage,
      };
}

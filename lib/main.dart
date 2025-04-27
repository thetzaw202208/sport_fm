import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/enum.dart';
import 'package:sport_fm/views/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'language/languages.dart';
import 'services/local_storage.dart';
import 'utils/global.dart';

void main() async {
  await LocalStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Global.language = LocalStorage.instance.read(StorageKey.language.name) ??
        Language.my.name;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Football Live Score',
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: secondaryColor,
          ),
          // theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          // themeMode: ThemeMode.system,
          translations: Languages(),
          locale: Global.language == Language.my.name
              ? const Locale('my', 'MM')

                      : const Locale('en', 'US'),
          fallbackLocale: const Locale('my', 'MM'),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

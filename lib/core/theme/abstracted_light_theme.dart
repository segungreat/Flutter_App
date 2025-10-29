import '../core.dart';

final abstractedLightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      overlayColor: Color(0x1a113F31),
    )),
    textTheme: TextTheme(
        bodyMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xB21F144D)),
        titleSmall:
            TextStyle(fontWeight: FontWeight.w700, fontSize: 20, fontFamily: "Mattone", color: Color(0xff1F144D)),
        titleMedium:
            TextStyle(fontWeight: FontWeight.w700, fontSize: 22, fontFamily: "Mattone", color: Color(0xff1F144D)),
        titleLarge:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 28, fontFamily: "Mattone", color: Color(0xff3E4044)),
        labelMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0x801F144D)),
        bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0x801F144D)),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        )),
    fontFamily: 'Inter',
    brightness: Brightness.light,
    hintColor: Color(0xffCDCDCD),
    colorScheme: ColorScheme.light(error: Color(0xffBF6767), onError: Colors.white, onPrimary: Color(0xf2FFFFFF)),
    primaryColorLight: Color(0xff3F58FF),
    primaryColor: Color(0xff2945FF));

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlab/core/core.dart';
import 'package:vlab/features/features.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(ProviderScope(child: VLabApp()));
}

class VLabApp extends ConsumerWidget {
  const VLabApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return GetMaterialApp(
          builder: (_, child) {
            return ScrollConfiguration(behavior: CustomScrollBehaviour(), child: child!);
          },
          title: VlabConstants.appName,
          locale: Get.deviceLocale ?? const Locale('en', 'US'),
          supportedLocales: const [
            Locale('en', 'US'),
            // Locale('fr', 'FR')
          ],
          // translations: FmTranslations(),
          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          navigatorKey: navigatorKeyGlobal,
          theme: VlabTheme.lightTheme,
          darkTheme: VlabTheme.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          getPages: VlabAppRoutes.getPages,
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}

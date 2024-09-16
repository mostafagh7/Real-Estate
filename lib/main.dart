import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/features/Realestate/screen/realestate_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/classes/keys.dart';
import 'core/constant/app_theme/app_theme.dart';
import 'features/Realestate/bloc/realestate_bloc.dart';
import 'features/Realestate/screen/intro.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RealestateBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(429, 932),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: false,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: Keys.navigatorKey,
              title: 'Real Estate',
              theme: appThemeData[AppTheme.light],
              home: prefs!.getString("isFirst") == "yes"
                  ? const RealestateScreen()
                  : const IntroScreen());
        },
      ),
    );
  }
}

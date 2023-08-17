import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/login/presentation/pages/login_screen.dart';
import 'package:movie_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Color(0xFF0B2342),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
            ),
            textTheme: TextTheme(
              titleSmall: TextStyle(color: Colors.white, fontSize: 14.sp),
              titleMedium: TextStyle(color: Colors.white, fontSize: 16.sp),
              titleLarge: TextStyle(color: Colors.white, fontSize: 24.sp),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36B0E5),
                foregroundColor: const Color(0xFF020F1F),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              prefixIconColor: Colors.white,
              suffixIconColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
              labelStyle: const TextStyle(color: Colors.white),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF36B0E5))),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF36B0E5)),
              ),
            ),
            scaffoldBackgroundColor: const Color(0xFF020F1F),
            appBarTheme: AppBarTheme(
              backgroundColor: const Color(0xFF0B2342),
              foregroundColor: Colors.white,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontSize: 22.sp),
            ),
            listTileTheme: ListTileThemeData(
              textColor: Colors.white,
              titleTextStyle: Theme.of(context).textTheme.titleSmall,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: const Color(0xFF36B0E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF0A203B),
              selectedItemColor: Colors.white,
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              unselectedItemColor: Color(0xFFCAC4D0),
            ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}

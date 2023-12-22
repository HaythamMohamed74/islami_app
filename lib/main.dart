import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran/providers/book_mark.dart';
import 'package:quran/providers/sehbah_provider/sebha_provider.dart';
import 'package:quran/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BookMarkProvider bookmarkProvider = BookMarkProvider();
  await bookmarkProvider.initializePreferences();
  runApp(
    ChangeNotifierProvider.value(
      value: bookmarkProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  // This widget is the root of your application.
  // final int initPage;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SebhaProvider>(create: (_) => SebhaProvider()),
        // ChangeNotifierProvider<BookMarkProvider>(
        //     create: (_) => BookMarkProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            title: 'Quran App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

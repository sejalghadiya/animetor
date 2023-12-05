import 'package:animater/splashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDark  = pref.getBool('Apptheme') ?? false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark? Brightness.dark : Brightness.light
    )
  );
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider(isDrak: isDark),),
      ],
        child: MyApp(),
      ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).isDrak) ?  ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class ThemeProvider extends ChangeNotifier
{
  bool isDrak;

  ThemeProvider({required this.isDrak});
  ChangeTheme() async {
    isDrak = !isDrak;
    SharedPreferences  pref = await SharedPreferences.getInstance();
    pref.setBool("AppTheme", isDrak);
    notifyListeners();
  }
}
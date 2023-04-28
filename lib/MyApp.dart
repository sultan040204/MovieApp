import 'package:flutter/material.dart';
import 'package:text_field_test1/widget/HomePage.dart';
import 'widget/SignIn.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.white,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const SignInPage(title: 'Sign up'),
        '/main_screen': (context) => const MyScreen(),
      },
    );
  }
}

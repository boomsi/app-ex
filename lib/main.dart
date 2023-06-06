import 'package:app/main_page.dart';
import 'package:flutter/material.dart';
// import 'expanded/main.dart';
// import 'text/main.dart';
// import 'padding/main.dart';
// import 'stack/main.dart';
// import 'layout/main.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo',
      theme: ThemeData(primaryColor: Color(0xff338800)),
      home: MainPage(),
      // routes: {
      //   LayoutPage.routeName: (context) => LayoutPage(),
      //   TextPage.routeName: (context) => TextPage(),
      //   StackPage.routeName: (context) => StackPage(),
      //   PaddingPage.routeName: (context) => PaddingPage(),
      //   ExpandedPage.routeName: (context) => ExpandedPage()
      // },
      // initialRoute: LayoutPage.routeName,
    );
  }
}

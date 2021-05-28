import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/pages/hero_detail_page.dart';
import 'package:rd_heroes/src/pages/home/home_page.dart';
import 'package:rd_heroes/src/utils/app_routes.dart';

import 'models/heroes/hero_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Heroes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Heróis',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (ctx) => HomePage(title: 'Heróis'),
          AppRoutes.HERO_DETAIL: (ctx) => HeroDetailPage(),
        },
      ),
    );
  }
}

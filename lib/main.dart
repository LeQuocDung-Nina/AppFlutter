import 'package:demorivermod/home/adapter/item_favorites_hive.dart';
import 'package:demorivermod/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'account/adapter/user_hive.dart';
import 'product_detail/adapter/Item_cart_hive.dart';


main() async {

  await Hive.initFlutter() ;
  Hive.registerAdapter(ItemFavHiveAdapter());
  await Hive.openBox('favorites_v5');

  Hive.registerAdapter(ItemCartHiveAdapter());
  await Hive.openBox('box_listCart2');

  Hive.registerAdapter(UserHiveAdapter());
  await Hive.openBox('user');
  runApp(const ProviderScope(child: MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme),
      ),

      routerConfig: AppRouter.router,
    );
  }
}


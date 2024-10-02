import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:platform_convertor_app/until/app_routes.dart';
import 'package:platform_convertor_app/until/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()..getTheme())
      ],
      child: Consumer<HomeProvider>(
          builder: (context, value, child) => value.isIos == false
              ? MaterialApp(
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode:value.theme ==false?ThemeMode.light:ThemeMode.dark,
                  debugShowCheckedModeBanner: false,
                  routes: app_routesAndroid,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: app_routesIos,
                  theme: value.theme ==false?light:dark
                )),
    ),
  );
}

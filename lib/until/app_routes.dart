import 'package:flutter/material.dart';
import 'package:platform_convertor_app/screen/home/view/home_android_screen.dart';
import 'package:platform_convertor_app/screen/home/view/home_ios_screen.dart';
Map<String,WidgetBuilder>app_routesAndroid={
  '/':(c1)=>const HomeAndroidScreen()
};
Map<String,WidgetBuilder>app_routesIos={
  '/':(c1)=>const HomeIosScreen()
};
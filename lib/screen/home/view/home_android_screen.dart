import 'package:flutter/material.dart';
import 'package:platform_convertor_app/screen/call/view/call_android_screen.dart';
import 'package:platform_convertor_app/screen/chats/view/chats_android_screen.dart';
import 'package:platform_convertor_app/screen/contact/view/contact_android_screen.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:platform_convertor_app/screen/settings/view/setting_android_screen.dart';
import 'package:provider/provider.dart';
class HomeAndroidScreen extends StatefulWidget {
  const HomeAndroidScreen({super.key});

  @override
  State<HomeAndroidScreen> createState() => _HomeAndroidScreenState();
}

class _HomeAndroidScreenState extends State<HomeAndroidScreen> {
  HomeProvider providerR=HomeProvider();
  HomeProvider providerW=HomeProvider();
  @override
  Widget build(BuildContext context) {
   providerR=context.read<HomeProvider>();
   providerW=context.watch<HomeProvider>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform Convertor"),
          actions: [
            Switch(value:providerW.isIos , onChanged: (value) {
              providerR.changeUi();

            },),
          ],
          bottom: const TabBar(
            tabs: [
              Icon(Icons.add_call),
              Tab(text: "Chats",),
              Tab(text: "Calls",),
              Tab(text: "Settings",),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ContactAndroidScreen(),
           ChatsAndroidScreen(),
           CallAndroidScreen(),
           SettingAndroidScreen()
          ],
        )
      ),
    );
  }
}

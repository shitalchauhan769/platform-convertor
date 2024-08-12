import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/screen/call/view/call_ios_screen.dart';
import 'package:platform_convertor_app/screen/chats/view/chats_ios_screen.dart';
import 'package:platform_convertor_app/screen/contact/view/contact_ios_screen.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:platform_convertor_app/screen/settings/view/setting_ios_screen.dart';
import 'package:provider/provider.dart';
class HomeIosScreen extends StatefulWidget {
  const HomeIosScreen({super.key});

  @override
  State<HomeIosScreen> createState() => _HomeIosScreenState();
}

class _HomeIosScreenState extends State<HomeIosScreen> {
  HomeProvider providerW=HomeProvider();
  HomeProvider providerR=HomeProvider();
  @override
  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Platform Convertor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        trailing: CupertinoSwitch(
          value: providerW.isIos,
          onChanged: (value) {
            providerR.changeUi();
          },
        ),
      ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: "contact"),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble),label: "chats"),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),label: "call"),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: "setting")
            ],
          ), tabBuilder: (BuildContext context, int index) {
          return index==0?ContactIosScreen():index==1?ChatsIosScreen():index==2?CallIosScreen():SettingIosScreen();
        },
        ));
  }
}

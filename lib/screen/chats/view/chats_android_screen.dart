import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ChatsAndroidScreen extends StatefulWidget {
  const ChatsAndroidScreen({super.key});

  @override
  State<ChatsAndroidScreen> createState() => _ChatsAndroidScreenState();
}

class _ChatsAndroidScreenState extends State<ChatsAndroidScreen> {
  HomeProvider? providerW ;
  HomeProvider? providerR ;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Consumer<HomeProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: providerW!.ContactList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
           showDilogBoxe();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(
                                File("${providerW!.ContactList[index].image}")),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("${providerW!.ContactList[index].name}"),
                              Text("${providerW!.ContactList[index].no}")
                            ],
                          ),
                          const Spacer(),
                          Text("${providerW!.date.day}-${providerW!.date.month}-${providerW!.date.year}"),
                          const SizedBox(width: 20,),
                          Text("${providerW!.time.hour}:${providerW!.time.minute}"),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showDilogBoxe() {
    scaffoldKey.currentState!.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text("hello",style: TextStyle(color: Colors.black),)),
                  ),
                )
              );
            },
          ),
    );
  }
}

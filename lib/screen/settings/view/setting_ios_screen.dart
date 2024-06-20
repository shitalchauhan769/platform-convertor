import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class SettingIosScreen extends StatefulWidget {
  const SettingIosScreen({super.key});

  @override
  State<SettingIosScreen> createState() => _SettingIosScreenState();
}

class _SettingIosScreenState extends State<SettingIosScreen> {
  HomeProvider? providerR ;
  HomeProvider? providerW ;
  TextEditingController txtProfilename=TextEditingController();
  TextEditingController txtProfilebio=TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.profile_circled),
                    const Spacer(),
                    const Column(
                      children: [
                        Text("Profile"),
                        Text("Update Profile data"),
                      ],
                    ),
                    const Spacer(),

                     CupertinoSwitch(value: false, onChanged: (value) {
                                        providerR!.changeProfile();
                                      },),
                    Visibility(
                      visible: providerW!.isProfile,
                        child: Center(child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Column(),
                        ),
                        CupertinoTextFormFieldRow(
                          controller:txtProfilename ,
                          prefix: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text("Name"),
                          ),
                        ),

                      ],
                    ),))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.change_circle),
                    const Spacer(),
                    const Column(
                      children: [
                        Text("Theme"),
                        Text("Change Theme"),
                      ],
                    ),
                    const Spacer(),
                    CupertinoSwitch(value:providerW!.isIosTheme , onChanged: (value) {
                      providerR!.checkTheme();

                    },)
                  ],
                ),
              ),

            ],
          ),
        ),);
  }
}



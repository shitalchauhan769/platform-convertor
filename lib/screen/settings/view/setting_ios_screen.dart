import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
import '../model/setting_model.dart';

class SettingIosScreen extends StatefulWidget {
  const SettingIosScreen({super.key});

  @override
  State<SettingIosScreen> createState() => _SettingIosScreenState();
}

class _SettingIosScreenState extends State<SettingIosScreen> {
  HomeProvider? providerR;

  HomeProvider? providerW;

  TextEditingController txtProfileName = TextEditingController();
  TextEditingController txtProfileBio = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNo = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      Text("Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("Update Profile data",style: TextStyle(fontSize: 15,),),
                    ],
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: providerW!.isProfile,
                    onChanged: (value) {
                      providerR!.changeProfile();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: providerW!.isProfile,
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          FileImage(File("${providerW!.selectedImage}")),
                      radius: 60,
                      child: IconButton(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          providerR!.changeImage(image!.path);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoTextFormFieldRow(
                      controller: txtNo,
                      placeholder: "enter the number",
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "number is recvide";
                        }
                        return null;
                      },
                    ),
                    CupertinoTextFormFieldRow(
                      controller: txtChat,
                      placeholder: "enter yore bio",
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "chat is recvide";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SettingModel s1 = SettingModel(
                                name: txtName.text,
                                bio: txtProfileBio.text,
                              );
                              providerR!.addSetting(s1);
                            }
                          },
                          child: const Text("Save"),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        CupertinoButton(
                          onPressed: () {},
                          child: const Text("Cansel"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey.shade100,thickness: 0.1,),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.light_mode),
                  const Spacer(),
                  const Column(
                    children: [
                      Text("Theme",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("Change Theme",style: TextStyle(fontSize: 15,),),
                    ],
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: providerW!.isIosTheme,
                    onChanged: (value) {
                      providerR!.checkTheme();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

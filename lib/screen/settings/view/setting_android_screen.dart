import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/screen/settings/model/setting_model.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class SettingAndroidScreen extends StatefulWidget {
  const SettingAndroidScreen({super.key});

  @override
  State<SettingAndroidScreen> createState() => _SettingAndroidScreenState();
}

class _SettingAndroidScreenState extends State<SettingAndroidScreen> {
  HomeProvider? providerR ;
  HomeProvider? providerW ;
  TextEditingController txtname=TextEditingController();
  TextEditingController txtdio=TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    Spacer(),
                    const Column(
                      children: [
                        Text("Profile"),
                        Text("Update Profile data"),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          providerR!.changeProfile();
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined)),
                  ],
                ),
              ),
              Visibility(
                visible: providerW!.isProfile,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: FileImage(File("${providerW!.selectedImage}")),
                          radius: 80,
                          child:IconButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile?  image =
                                await picker.pickImage(source: ImageSource.gallery);

                                providerR!.changeImage(image!.path);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtname,
                          decoration: const InputDecoration(
                            hintText: "name",
                            label: Text("Enter name"),
                            border: OutlineInputBorder()
                          ),


                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtdio,
                          decoration: const InputDecoration(
                            hintText: "biodata",
                            label: Text("Enter bio"),
                            border: OutlineInputBorder()
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                if(formkey.currentState!.validate()) {

                                  SettingModel s1= SettingModel(
                                       name:txtname.text,
                                       bio: txtdio.text,
                                  );
                                  providerR!.addSetting(s1);

                                }
                              },
                              child: Text("Save"),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                              onPressed: () {
                              },
                              child: Text("Cansel"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.change_circle),
                    Spacer(),
                    const Column(
                      children: [
                        Text("Theme"),
                        Text("Change Theme"),
                      ],
                    ),
                    Spacer(),
                   Switch(value:providerW!.isIosTheme , onChanged: (value) {
                      providerR!.checkTheme();

                    },)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

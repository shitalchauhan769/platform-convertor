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
  HomeProvider? providerR;
  HomeProvider? providerW;


  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle_outlined),
                    const Spacer(),
                    const Column(
                      children: [
                        Text("Profile"),
                        Text("Update Profile data"),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        providerR!.changeProfile();
                      },
                      icon: providerW!.isProfile
                          ? const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 40,
                            )
                          : const Icon(Icons.arrow_forward_ios_outlined),
                    ),
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
                          backgroundImage:
                              FileImage(File("${providerW!.selectedImage}")),
                          radius: 80,
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
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtName,
                          decoration: const InputDecoration(
                              hintText: "name",
                              label: Text("Enter name"),
                              border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                              {
                                return"please name enter";
                              }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: txtBio,
                          decoration: const InputDecoration(
                              hintText: "bio Data",
                              label: Text("Enter bio"),
                              border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return"please bio enter";
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {

                                  providerR!.setDataName(txtName.text);
                                  providerR!.setBio(txtBio.text);
                                }
                              },
                              child: const Text("Save"),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Cansel"),
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
                        Text("Theme"),
                        Text("Change Theme"),
                      ],
                    ),
                    const Spacer(),
                    Switch(
                      value: providerW!.theme!,
                      onChanged: (value) {
                        providerR!.setTheme(value);
                      },
                    )
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

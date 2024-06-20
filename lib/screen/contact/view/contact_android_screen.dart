import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/screen/contact/model/contact_model.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ContactAndroidScreen extends StatefulWidget {
  const ContactAndroidScreen({super.key});

  @override
  State<ContactAndroidScreen> createState() => _ContactAndroidScreenState();
}

class _ContactAndroidScreenState extends State<ContactAndroidScreen> {
  HomeProvider providerW = HomeProvider();
  HomeProvider providerR = HomeProvider();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNo = TextEditingController();
  TextEditingController txtChats = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime? d1;
  TimeOfDay? time;
  String? path;


  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: providerW.path == null
                            ? const CircleAvatar(
                          radius: 50,
                        )
                            : CircleAvatar(
                          backgroundImage:
                          FileImage(File("${providerW.selectedImage}")),
                          radius: 70,
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: Align(
                          alignment: Alignment(0.0, 0.2),
                          child: (providerW.path == null) ?
                          IconButton.filledTonal(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                providerR.changeImage(image!.path);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.black,
                              )):Center(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: txtName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("Full name"),
                      border: OutlineInputBorder(),
                      hintText: "name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name is recvide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtNo,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      label: Text("Phone number"),
                      border: OutlineInputBorder(),
                      hintText: "number",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "number is recvide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtChats,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.chat_bubble),
                      label: Text("Chats Conversation"),
                      border: OutlineInputBorder(),
                      hintText: "chats",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "chats is recvide";
                      }
                      return null;
                    },
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      DateTime? d1 = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2030));
                      providerR.changDate(d1!);
                    },
                    label:d1 ==null? const Text("Date pick") : Text(
                        "${providerW.date.day}/${providerW.date.month}/${providerW
                            .date.year}"),
                    icon: Icon(Icons.calendar_month),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      providerR.changTime(time!);
                    },
                    label:time==null?const Text("Datetime pick"): Text("${providerW.time.hour}:${providerW.time.minute}"),
                    icon: Icon(Icons.punch_clock_sharp),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                           ContactModel c1 =ContactModel(
                               no: txtNo.text,
                               name: txtName.text,
                               chat: txtChats.text,
                             image: path
                           );


                           providerR.ContactList.add(c1);
                           txtName.clear();
                           txtNo.clear();
                           txtChats.clear();


                          }
                        },
                        child: Text("Save")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:platform_convertor_app/screen/contact/model/contact_model.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ContactIosScreen extends StatefulWidget {
  const ContactIosScreen({super.key});

  @override
  State<ContactIosScreen> createState() => _ContactIosScreenState();
}

class _ContactIosScreenState extends State<ContactIosScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();
  TextEditingController txtchat = TextEditingController();
  HomeProvider providerW = HomeProvider();
  HomeProvider providerR = HomeProvider();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(80),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: CupertinoColors.systemGrey2),
                    ),
                    IconButton(onPressed: () {

                    }, icon:Icon(Icons.camera_alt))
                  ],
                ),
               CupertinoTextFormFieldRow(
                 controller: txtname,
                 placeholder: "enter the name",
                 decoration: BoxDecoration(
                   border: Border.all(color: CupertinoColors.black),
                 ),
                 validator: (value) {
                   if(value!.isEmpty)
                     {
                       return "name is recvide";
                     }
                   return null;
                 },

               ),
               CupertinoTextFormFieldRow(
                 controller: txtno,
                 placeholder: "enter the number",
                 decoration: BoxDecoration(
                   border: Border.all(color: CupertinoColors.black),
                 ),
                 validator: (value) {
                   if(value!.isEmpty)
                     {
                       return "number is recvide";
                     }
                   return null;
                 },
               ),
               CupertinoTextFormFieldRow(
                 controller: txtchat,
                 placeholder: "enter the chat",
                 decoration: BoxDecoration(
                   border: Border.all(color: CupertinoColors.black),
                 ),
                 validator: (value) {
                   if(value!.isEmpty)
                     {
                       return "chat is recvide";
                     }
                   return null;
                 },
               ),
                GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: CupertinoColors.white,
                            child: CupertinoDatePicker(
                              initialDateTime: providerW.date,
                              onDateTimeChanged: (value) async {
                                // DateTime? d1 = await showDatePicker(
                                //     context: context,
                                //     firstDate: DateTime(2001),
                                //     lastDate: DateTime(2030));
                                providerR.changDate(value);
                              },
                              mode: CupertinoDatePickerMode.date,
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(
                            "${providerW.date.day}/${providerW.date.month}/${providerW.date.year}"),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              TimeOfDay t1 =
                                  TimeOfDay(hour: value.hour, minute: value.minute);
                              providerR.changTime(t1);
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.clock),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${providerW.time.hour}:${providerW.time.hour}")
                    ],
                  ),
                ),
                Center(
                  child: CupertinoButton(
                    child: Text("submit"),
                    onPressed: () {
                      if(formkey.currentState!.validate())
                        {
                         ContactModel c1=ContactModel(
                              name:txtname.text,
                             no:txtno.text,
                            chat: txtchat.text,
                         );
                         providerR.ContactList.add(c1);
                         txtname.clear();
                         txtno.clear();
                         txtchat.clear();
                        }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class CallAndroidScreen extends StatefulWidget {
  const CallAndroidScreen({super.key});

  @override
  State<CallAndroidScreen> createState() => _CallAndroidScreenState();
}

class _CallAndroidScreenState extends State<CallAndroidScreen> {
  HomeProvider? providerW ;
  HomeProvider? providerR ;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
  return  Consumer<HomeProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: providerW!.ContactList.length,
        itemBuilder: (context, index) => Column(
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
                        Spacer(),
                        IconButton(onPressed: () async {
                          String link =
                              "tel:+91${providerW!.ContactList[index].no}";
                          await launchUrl(Uri.parse(link));
                        }, icon: Icon(Icons.call))


                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

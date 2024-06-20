import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class CallIosScreen extends StatefulWidget {
  const CallIosScreen({super.key});

  @override
  State<CallIosScreen> createState() => _CallIosScreenState();
}

class _CallIosScreenState extends State<CallIosScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  @override
  Widget build(BuildContext context) {
    providerW=context.watch<HomeProvider>();
    providerR=context.read<HomeProvider>();
    return CupertinoPageScaffold(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount:providerW!.ContactList.length ,
              itemBuilder: (context, index) =>
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CupertinoColors.lightBackgroundGray),
                            ),
                            Column(
                              children: [
                                Text("${providerW!.ContactList[index].name}"),
                                Text("${providerW!.ContactList[index].no}"),
                              ],
                            ),
                            Spacer(),
                            CupertinoButton(child: Icon(CupertinoIcons.phone), onPressed: () async {
                              String link =
                                  "tel:+91${providerW!.ContactList[index].no}";
                              await launchUrl(Uri.parse(link));

                            },)
                          ],
                        ),
                      ),
                    ],
                  )
          ),
        ));
  }
}

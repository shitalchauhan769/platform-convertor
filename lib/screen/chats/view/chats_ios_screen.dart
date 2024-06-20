import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ChatsIosScreen extends StatefulWidget {
  const ChatsIosScreen({super.key});

  @override
  State<ChatsIosScreen> createState() => _ChatsIosScreenState();
}

class _ChatsIosScreenState extends State<ChatsIosScreen> {
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
                      Text("${providerW!.date.day}-${providerW!.date.month}-${providerW!.date.year}"),
                      SizedBox(width: 20,),
                      Text("${providerW!.time.hour}:${providerW!.time.minute}"),
                    ],
                  ),
                ),
              ],
            )
      ),
    ));
  }
}

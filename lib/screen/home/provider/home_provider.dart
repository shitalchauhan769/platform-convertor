import 'package:flutter/material.dart';
import '../../../until/sehar_helper.dart';

import '../../contact/model/contact_model.dart';
import '../../settings/model/setting_model.dart';


class HomeProvider with ChangeNotifier
{
  bool isIos=false;
  bool? theme= false;
  bool isProfile=false;
  DateTime date=DateTime.now();
  TimeOfDay time=TimeOfDay.now();
  List<ContactModel> ContactList=[];
  ContactModel? SelactedContact;
  String? selectedImage;
  String? path;
  String? name;
  String? bio;

  List<SettingModel>settingList=[];

  void addSetting(SettingModel model) {
    settingList.add(model);
    notifyListeners();

  }

  void changeImage(String? path) {
    selectedImage = path;
    notifyListeners();

  }

  void changeUi() {
    isIos=!isIos;
    notifyListeners();
  }

  void setTheme(bool theme) {
    ShardHelper helper=ShardHelper();
    helper.setTheme(theme);
    getTheme();
  }

  void getTheme()async{
    ShardHelper helper=ShardHelper();
    theme = await helper.getTheme();
    notifyListeners();
  }


  void changeProfile() {
     isProfile=!isProfile;
     notifyListeners();
  }

  void changDate(DateTime d1) {
    date=d1;
    notifyListeners();
  }

  void changTime(TimeOfDay d1) {
    time=d1;
    notifyListeners();
  }

  void addContactData(ContactModel contact) {
    SelactedContact=contact;
    notifyListeners();
  }

  void addContact(ContactModel model) {
    ContactList.add(model);
    notifyListeners();
  }

  void addPath(String p1) {
    path=p1;
    notifyListeners();
  }

  void checkTheme() {
    theme=theme;notifyListeners();
  }

  void setDataName(String name)
  {
    ShardHelper helper=ShardHelper();
    helper.setNameData(name);
  }

  void getDataName()
  async
  {
    ShardHelper helper=ShardHelper();
    name = await helper.getNameData();
    notifyListeners();
  }

  void setBio(String Bio)
  {
    ShardHelper helper=ShardHelper();
    helper.setBio(Bio);
  }

  Future<void> getBio()
  async
  {
    ShardHelper helper=ShardHelper();
    bio = await helper.getBio();
    notifyListeners();
  }

}
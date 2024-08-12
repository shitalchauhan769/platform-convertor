import 'package:flutter/material.dart';
import '../../../until/sehar_helper.dart';

import '../../contact/model/contact_model.dart';
import '../../settings/model/setting_model.dart';


class HomeProvider with ChangeNotifier
{
  bool isIos=false;
  String? themeName="System";
  String? theme;
  bool isProfile=false;
  DateTime date=DateTime.now();
  TimeOfDay time=TimeOfDay.now();
  List<ContactModel> ContactList=[];
  ContactModel? SelactedContact;
  String? selectedImage;
  String? path;
  bool isIosTheme=false;
  List<SettingModel>SettingList=[];
  void addSetting(SettingModel model) {
    SettingList.add(model);
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

  void setTheme(String theme) {
    ShardHelper shr =ShardHelper();
    shr.setTheme(theme);
    getTheme();
  }

  Future<void> getTheme() async {
    ShardHelper shr =ShardHelper();
    theme=await shr.getTheme();
    notifyListeners();
  }

  void setIosTheme(String theme) {
    ShardHelper shr =ShardHelper();
    shr.setTheme(theme);
    notifyListeners();
    getTheme();
  }

  Future<void> getIosTheme() async {
    ShardHelper shr =ShardHelper();
   theme= await shr.getTheme();
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
    isIosTheme=!isIosTheme;notifyListeners();
  }
}
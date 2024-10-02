
import 'package:shared_preferences/shared_preferences.dart';

class ShardHelper
{
  Future<void> setTheme(bool theme)
  async {
    SharedPreferences sha =   await SharedPreferences.getInstance();
    sha.setBool("theme", theme);
  }

  Future<bool?> getTheme()
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
    bool? data = share.getBool('theme');
    return data;
  }

  Future<void> setNameData(String name) async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setString("name", name);

  }

  Future<String?> getNameData() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    String? name = sha.getString('name');
    return name;
  }


  Future<void> setBio(String bio) async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setString("bio", bio);
  }

  Future<String?> getBio() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    String? bio = sha.getString('bio');
    return bio;
  }

}
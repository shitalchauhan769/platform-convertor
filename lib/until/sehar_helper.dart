
import 'package:shared_preferences/shared_preferences.dart';

class ShardHelper
{
  Future<void> setTheme(String ThemeName)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
     await shr.setString("theme", ThemeName);
  }
  Future<String?> getTheme()
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
   String? theme =shr.getString("theme");
   return theme;
  }
}
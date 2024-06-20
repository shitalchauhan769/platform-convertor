
import 'package:shared_preferences/shared_preferences.dart';

class ShardHalper
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
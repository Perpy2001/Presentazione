import 'package:shared_preferences/shared_preferences.dart';

void save(String busShortName,bool value) async {
        final prefs = await SharedPreferences.getInstance();
        final key =busShortName;
        if(value==null){
          value=false;
        }
        prefs.setBool(key, !value);
      }
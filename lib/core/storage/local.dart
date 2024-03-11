

import 'package:get_storage/get_storage.dart';


class LocalStorage {


  static final box = GetStorage();


  static String getUserId(){


    return box.read("userId");
  }

  static Future<void> setUserId( String id){


    return box.write("userId" , id);
  }

  static Future<String> getLang(){


    return box.read("lang");
  }

  static Future<void> setLang( String lang){


    return box.write("lang" , lang);
  }


}
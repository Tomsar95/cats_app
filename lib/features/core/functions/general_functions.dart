import '../utils/utils.dart';

class GeneralFunctions {
  static String? setImageRoute(String? id){
    if(id == null) return null;
    return '${Utils.imageRoute}$id.jpg';
  }
}
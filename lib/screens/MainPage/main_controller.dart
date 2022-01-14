import 'package:get/get.dart';

class MainController extends GetxController{
  var isLoading = false.obs;
  var indexNo = 0.obs;

  setIndex(int index){
    indexNo.value = index;
    //print(indexNo.value.toString());
  }
}

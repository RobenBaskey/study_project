import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_project/screens/first_page/model/first_page_model.dart';
import 'package:study_project/service/api_service.dart';
import 'package:http/http.dart' as http;

class FirstPageController extends GetxController{
  var isLoading = false.obs;

  var clickItemIndex = 100000.obs;

  List<FirstPageModel> myTecherList = List<FirstPageModel>.empty(growable: true).obs;

  var dataString = "".obs;

  static var client = http.Client();


  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async{
    try{
      isLoading(true);
      var data = await ApiService.fetchMyTeacher("");
      if(data != null){
        myTecherList = data;
      }
    }
    catch(e){
      print(e.toString());
    }
    finally{
      isLoading(false);
    }
  }
}
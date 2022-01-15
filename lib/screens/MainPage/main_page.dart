
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:study_project/screens/MainPage/main_controller.dart';
import 'package:study_project/screens/first_page/first_page.dart';
import 'package:study_project/screens/my_course/my_course.dart';
import 'package:study_project/size_config.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  MainController _mainController = Get.put(MainController());

  final pageList = <Widget>[
    FirstPage(),
    MyCourse(),
    FirstPage(),
    FirstPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx((){
        return pageList[_mainController.indexNo.value];
      }),
      bottomNavigationBar: Obx((){
        return ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            elevation: 5,
              currentIndex: _mainController.indexNo.value,
              onTap: (index) {
                _mainController.indexNo.value = index;
              },
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Container(
                  height: getProportionateScreenHeight(17),
                 margin: EdgeInsets.only(bottom: 7),
                 child: Image.asset("asset/icon/dashboard.png"),
                ),label: "Dashboard"),
                BottomNavigationBarItem(icon: Container(
                  height: getProportionateScreenHeight(17),
                  margin: EdgeInsets.only(bottom: 7),
                  child: Image.asset("asset/icon/dashboard.png"),
                ),label: "My Courses"),
                BottomNavigationBarItem(icon: Container(
                  height: getProportionateScreenHeight(20),
                  margin: EdgeInsets.only(bottom: 7),
                  child: Image.asset("asset/icon/team.png"),
                ),label: "Community"),
                BottomNavigationBarItem(icon: Container(
                  height: getProportionateScreenHeight(20),
                  margin: EdgeInsets.only(bottom: 7),
                  child: Image.asset("asset/icon/account.png",height: 25,fit: BoxFit.cover,),
                ),label: "Profile"),
                // BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label:"Dashboard"),
                //  BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'My Courses'),
                //  BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Community'),
                //  BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
               ],
          )
        );
      }),
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_project/screens/MainPage/main_controller.dart';
import 'package:study_project/screens/first_page/first_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  MainController _mainController = Get.put(MainController());

  final iconList = <IconData>[
    Icons.home,
    Icons.lock,
    Icons.image_outlined,
    Icons.calendar_today_rounded,
  ];

  final pageList = <Widget>[
    FirstPage(),
    FirstPage(),
    FirstPage(),
    FirstPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: Obx((){
        return Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: _mainController.indexNo.value,
                children: pageList,
              ),
            ),
          ],
        );
        //return pageList[_homeController.indexNo.value];
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined,color: Colors.black,),title: Text("DashBoard",style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.book,color: Colors.black),title: Text("My Course",style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined,color: Colors.black),title: Text("Community",style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black),title: Text("Profile",style: TextStyle(color: Colors.black),)),
        ],
        
      )
    );
  }
}

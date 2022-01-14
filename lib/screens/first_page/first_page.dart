import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_project/screens/first_page/controller/first_page_controller.dart';
import 'package:study_project/size_config.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirstPageController _firstPageController = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var _aspectRatio;

    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = getProportionateScreenHeight(190);
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text(
          "My Teachers",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Center(
            child: Stack(
              children: [
                Image.asset(
                  "asset/icon/email.png",
                  height: getProportionateScreenHeight(30),
                ),
                Positioned(
                    left: -2,
                    bottom: -3,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text("3"),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Center(
            child: Stack(
              children: [
                Image.asset(
                  "asset/icon/notification.png",
                  height: getProportionateScreenHeight(25),
                ),
                Positioned(
                    left: -2,
                    bottom: -3,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text("3"),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx((){
          if(_firstPageController.isLoading.value){
            return CircularProgressIndicator();
          }else{
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: aspt(100)),
                itemCount: 10,
                itemBuilder: (context, index) {
                  bool result = _firstPageController.clickItemIndex.value == index;
                  return GestureDetector(
                      onTap: (){
                        setState(() {
                          _firstPageController.clickItemIndex.value = index;
                        });
                      },
                      child: result?Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color(0xFF267541),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: getProportionateScreenHeight(100),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF267541)),
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("asset/icon/person.png"))),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              "Nick Jones",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(7),
                            ),
                            Text(
                              "Associate Professor",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ):Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: getProportionateScreenHeight(100),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF267541)),
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("asset/icon/person.png"))),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              "Nick Jones",
                              style: TextStyle(
                                  color: Color(0xFF292929),
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(7),
                            ),
                            Text(
                              "Associate Professor",
                              style: TextStyle(color: Color(0xFF646464)),
                            )
                          ],
                        ),
                      )
                  );
                });
          }
        })
      ),
    );
  }
}

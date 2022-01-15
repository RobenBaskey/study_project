import 'package:flutter/material.dart';

import '../../size_config.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      appBar: AppBar(
        backgroundColor: Color(0xFFECECEC),
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
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("My Course",style: TextStyle(color: Colors.black),),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(getProportionateScreenWidth(10)),topRight: Radius.circular(getProportionateScreenWidth(10))),
                              child: Image.asset("asset/icon/demo_banner.jpeg",height: getProportionateScreenHeight(150),width: double.infinity,fit: BoxFit.cover,)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text("The united state and the world since 1945",style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  color: Colors.black
                                ),)),
                                SizedBox(width: getProportionateScreenWidth(90),),
                                Text("2 Lesson")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Row(
                                  children: [
                                    Container(
                                      height: getProportionateScreenHeight(50),
                                      width: getProportionateScreenHeight(50),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage("asset/icon/person.png")
                                        )
                                      ),
                                    ),
                                    Text("Teacher Demo"),

                                  ],
                                ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF267541),
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(getProportionateScreenWidth(13)),
                                    child: Text("Start Course",style: TextStyle(color: Colors.white),),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
              }),
            )
          ],
        ),
      )
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_project/screens/first_page/controller/first_page_controller.dart';
import 'package:study_project/service/api_service.dart';
import 'package:study_project/size_config.dart';
import 'package:http/http.dart' as http;

import 'model/first_page_model.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirstPageController _firstPageController = Get.put(FirstPageController());

  late List responseData;
  List<FirstPageModel> myTecherList = List<FirstPageModel>.empty(growable: true);

  // @override
  // void initState() {
  //   fetchData();
  //   super.initState();
  // }
  //
  // Future fetchData() async{
  //   http.Response response;
  //   response = await http.get(Uri.parse('https://staging-ucao.digitalubuntu.sn/wp-json/wp/v2/users'));
  //
  //   if(response.statusCode == 200){
  //     setState(() {
  //       responseData = jsonDecode(response.body);
  //       for(var data in responseData){
  //         myTecherList.add(FirstPageModel(
  //             id: data['id'],
  //             name: data['name'],
  //             url: data['url'] == ""?data['url']:"",
  //             description: data['description']??"",
  //             link: data['link'],
  //             slug: data['slug']??"",
  //             // avatarUrls: data['avatar_urls']['24']??data['avatar_urls']['48']??data['avatar_urls']['96'],
  //             // meta: Meta(gamipressPiecePoints: data['meta']['gamipress_piece_points']),
  //             // isSuperAdmin: data['is_super_admin']??false,
  //             // woocommerceMeta: WoocommerceMeta(
  //             //     activityPanelInboxLastRead: data['woocommerce_meta']['activity_panel_inbox_last_read']??"",
  //             //     activityPanelReviewsLastRead: data['woocommerce_meta']['activity_panel_reviews_last_read']??"",
  //             //     categoriesReportColumns: data['woocommerce_meta']['categories_report_columns']??"",
  //             //     couponsReportColumns: data['woocommerce_meta']['coupons_report_columns']??"",
  //             //     customersReportColumns: data['woocommerce_meta']['customers_report_columns']??"",
  //             //     ordersReportColumns: data['woocommerce_meta']['orders_report_columns']??"",
  //             //     productsReportColumns: data['woocommerce_meta']['products_report_columns']??"",
  //             //     revenueReportColumns: data['woocommerce_meta']['revenue_report_columns']??"",
  //             //     taxesReportColumns: data['woocommerce_meta']['taxes_report_columns']??"",
  //             //     variationsReportColumns: data['woocommerce_meta']['variations_report_columns']??"",
  //             //     dashboardSections: data['woocommerce_meta']['dashboard_sections']??"",
  //             //     dashboardChartType: data['woocommerce_meta']['dashboard_chart_type']??"",
  //             //     dashboardChartInterval: data['woocommerce_meta']['dashboard_chart_interval']??"",
  //             //     dashboardLeaderboardRows: data['woocommerce_meta']['dashboard_leaderboard_rows']??"",
  //             //     homepageLayout: data['woocommerce_meta']['homepage_layout']??"",
  //             //     homepageStats: data['woocommerce_meta']['homepage_stats']??"",
  //             //     taskListTrackedStartedTasks: data['woocommerce_meta']['task_list_tracked_started_tasks']??"",
  //             //     helpPanelHighlightShown: data['woocommerce_meta']['help_panel_highlight_shown']??"",
  //             //     androidAppBannerDismissed: data['woocommerce_meta']['android_app_banner_dismissed']??""
  //             // ),
  //             // links: Links(
  //             //     self: List<Collection>.from(data["self"].map((x) => Collection.fromJson(x))),
  //             //     collection: List<Collection>.from(data["collection"].map((x) => Collection.fromJson(x))),
  //             //     courses: List<CourseProgress>.from(data["courses"].map((x) => CourseProgress.fromJson(x))),
  //             //     groups: List<CourseProgress>.from(data["groups"].map((x) => CourseProgress.fromJson(x))),
  //             //     courseProgress: List<CourseProgress>.from(data["course-progress"].map((x) => CourseProgress.fromJson(x))),
  //             //     quizProgress: List<CourseProgress>.from(data["quiz_progress"].map((x) => CourseProgress.fromJson(x)))
  //             // )
  //         ));
  //         print("\n $data");
  //       }
  //     });
  //   }
  // }

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
      backgroundColor: Colors.black.withOpacity(0.03),
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
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
        child: Obx((){
          if(_firstPageController.isLoading.value){
            return Center(child: CircularProgressIndicator());
          }else{
            // return SingleChildScrollView(child: Text(myTecherList[0].name,style: TextStyle(color: Colors.black),));
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: aspt(100)),
                itemCount: _firstPageController.myTecherList.length,
                itemBuilder: (context, index) {
                  bool result = _firstPageController.clickItemIndex.value == index;
                  var data = _firstPageController.myTecherList[index];
                  return GestureDetector(
                      onTap: (){
                        setState(() {
                          _firstPageController.clickItemIndex.value = index;
                        });
                      },
                      child:Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: result?Color(0xFF267541):Colors.white,
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
                                        image: NetworkImage(data.avatarUrls),fit: BoxFit.contain)),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              "Nick Jones",
                              style: TextStyle(
                                  color: result?Colors.white:Colors.black,
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(7),
                            ),
                            Text(
                              data.name,
                              style: TextStyle(color: result?Colors.white:Colors.black),
                            )
                          ],
                        ),
                      )
                  );
                });
          }
        }),
      ),
    );
  }


}

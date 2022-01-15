import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:study_project/screens/first_page/model/first_page_model.dart';

class ApiService{
  static var client = http.Client();


  static Future<List<FirstPageModel>?> fetchMyTeacher(String api) async{
    var response = await client.get(Uri.parse('https://staging-ucao.digitalubuntu.sn/wp-json/wp/v2/users'));
    if(response.statusCode == 200){
      List jsonString = jsonDecode(response.body);
      List<FirstPageModel> list = List.empty(growable: true);
      for(var data in jsonString){
        list.add(FirstPageModel(
              id: data['id'],
              name: data['name'],
              url: data['url'] == ""?data['url']:"",
              description: data['description']??"",
              link: data['link'],
              slug: data['slug']??"",
              avatarUrls: data['avatar_urls']['24']??data['avatar_urls']['48']??data['avatar_urls']['96'],
              //meta: Meta(gamipressPiecePoints: data['meta']['gamipress_piece_points']),
              isSuperAdmin: data['is_super_admin']??false,
              // woocommerceMeta: WoocommerceMeta(
              //     activityPanelInboxLastRead: data['woocommerce_meta']['activity_panel_inbox_last_read']??"",
              //     activityPanelReviewsLastRead: data['woocommerce_meta']['activity_panel_reviews_last_read']??"",
              //     categoriesReportColumns: data['woocommerce_meta']['categories_report_columns']??"",
              //     couponsReportColumns: data['woocommerce_meta']['coupons_report_columns']??"",
              //     customersReportColumns: data['woocommerce_meta']['customers_report_columns']??"",
              //     ordersReportColumns: data['woocommerce_meta']['orders_report_columns']??"",
              //     productsReportColumns: data['woocommerce_meta']['products_report_columns']??"",
              //     revenueReportColumns: data['woocommerce_meta']['revenue_report_columns']??"",
              //     taxesReportColumns: data['woocommerce_meta']['taxes_report_columns']??"",
              //     variationsReportColumns: data['woocommerce_meta']['variations_report_columns']??"",
              //     dashboardSections: data['woocommerce_meta']['dashboard_sections']??"",
              //     dashboardChartType: data['woocommerce_meta']['dashboard_chart_type']??"",
              //     dashboardChartInterval: data['woocommerce_meta']['dashboard_chart_interval']??"",
              //     dashboardLeaderboardRows: data['woocommerce_meta']['dashboard_leaderboard_rows']??"",
              //     homepageLayout: data['woocommerce_meta']['homepage_layout']??"",
              //     homepageStats: data['woocommerce_meta']['homepage_stats']??"",
              //     taskListTrackedStartedTasks: data['woocommerce_meta']['task_list_tracked_started_tasks']??"",
              //     helpPanelHighlightShown: data['woocommerce_meta']['help_panel_highlight_shown']??"",
              //     androidAppBannerDismissed: data['woocommerce_meta']['android_app_banner_dismissed']??""
              // ),
              // links: Links(
              //     self: List<Collection>.from(data["self"].map((x) => Collection.fromJson(x))),
              //     collection: List<Collection>.from(data["collection"].map((x) => Collection.fromJson(x))),
              //     courses: List<CourseProgress>.from(data["courses"].map((x) => CourseProgress.fromJson(x))),
              //     groups: List<CourseProgress>.from(data["groups"].map((x) => CourseProgress.fromJson(x))),
              //     courseProgress: List<CourseProgress>.from(data["course-progress"].map((x) => CourseProgress.fromJson(x))),
              //     quizProgress: List<CourseProgress>.from(data["quiz_progress"].map((x) => CourseProgress.fromJson(x)))
              // )
          ));
        print(list.length);
      }
      return list;
    }
  }

}
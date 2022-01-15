import 'dart:convert';

FirstPageModel myTecherFromJson(String str) => FirstPageModel.fromJson(json.decode(str));

String myTeacherToJson(FirstPageModel data) => json.encode(data.toJson());

class FirstPageModel {
  FirstPageModel({
    required  this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.link,
    required this.slug,
    required this.avatarUrls,
    // required this.meta,
    required this.isSuperAdmin,
    // required this.woocommerceMeta,
    // required this.links,
  });

  int id;
  String name;
  String url;
  String description;
  String link;
  String slug;
  String avatarUrls;
  // Meta meta;
  bool isSuperAdmin;
  // WoocommerceMeta woocommerceMeta;
  // Links links;


  factory FirstPageModel.fromJson(Map<String,dynamic> json) => FirstPageModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      description: json['description'],
      link: json['link'],
      slug: json['slug'],
      avatarUrls: json['avatar_urls']['24'],
      // meta: Meta.fromJson(json['meta']),
      isSuperAdmin: json['is_super_admin'],
      // woocommerceMeta: WoocommerceMeta.fromJson(json['woocommerce_meta']),
      // links: Links.fromJson(json['links'])
  );


  Map<String,dynamic> toJson() => {
    'id':id,
    'name':name,
    'url':url,
    'description':description,
    'link':link,
    'slug':slug,
    'avatar_urls':avatarUrls,
    // 'meta': meta.toJson(),
    'is_super_admin':isSuperAdmin,
    // 'woocommerce_meta':woocommerceMeta.toJson(),
    // 'links':links.toJson()
  };
}


class Links {
  Links({
    required this.self,
    required this.collection,
    required this.courses,
    required this.groups,
    required this.courseProgress,
    required this.quizProgress,
  });

  List<Collection> self;
  List<Collection> collection;
  List<CourseProgress> courses;
  List<CourseProgress> groups;
  List<CourseProgress> courseProgress;
  List<CourseProgress> quizProgress;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
      self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
      collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
      courses: List<CourseProgress>.from(json["courses"].map((x) => CourseProgress.fromJson(x))),
      groups: List<CourseProgress>.from(json["groups"].map((x) => CourseProgress.fromJson(x))),
      courseProgress: List<CourseProgress>.from(json["course-progress"].map((x) => CourseProgress.fromJson(x))),
      quizProgress: List<CourseProgress>.from(json["quiz_progress"].map((x) => CourseProgress.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    'self':List<dynamic>.from(self.map((x) => x.toJson())),
    'collection':List<dynamic>.from(collection.map((x) => x.toJson())),
    'courses':List<dynamic>.from(courses.map((x) => x.toJson())),
    'groups':List<dynamic>.from(groups.map((x) => x.toJson())),
    'course-progress':List<dynamic>.from(courseProgress.map((x) => x.toJson())),
    'quiz_progress':List<dynamic>.from(quizProgress.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String , dynamic> json) => Collection(href: json['href']??"");

  Map<String,dynamic> toJson() => {'href':href};
}

class CourseProgress {
  CourseProgress({
    required this.embeddable,
    required this.href,
  });

  bool embeddable;
  String href;

  factory CourseProgress.fromJson(Map<String , dynamic> json) => CourseProgress(
      embeddable: json['embeddable']??"",
      href: json['href']??""
  );

  Map<String, dynamic> toJson() => {'embeddable':embeddable,'href':href};
}

class Meta {
  Meta({
    required this.gamipressPiecePoints,
  });

  int gamipressPiecePoints;

  factory Meta.fromJson(Map<String , dynamic> json) => Meta(gamipressPiecePoints: json['gamipress_piece_points']??"");

  Map<String, dynamic> toJson() => {'gamipress_piece_points':gamipressPiecePoints};
}

class WoocommerceMeta {
  WoocommerceMeta({
    required this.activityPanelInboxLastRead,
    required this.activityPanelReviewsLastRead,
    required this.categoriesReportColumns,
    required this.couponsReportColumns,
    required this.customersReportColumns,
    required this.ordersReportColumns,
    required this.productsReportColumns,
    required this.revenueReportColumns,
    required this.taxesReportColumns,
    required this.variationsReportColumns,
    required this.dashboardSections,
    required this.dashboardChartType,
    required this.dashboardChartInterval,
    required this.dashboardLeaderboardRows,
    required this.homepageLayout,
    required this.homepageStats,
    required this.taskListTrackedStartedTasks,
    required this.helpPanelHighlightShown,
    required this.androidAppBannerDismissed,
  });

  String activityPanelInboxLastRead;
  String activityPanelReviewsLastRead;
  String categoriesReportColumns;
  String couponsReportColumns;
  String customersReportColumns;
  String ordersReportColumns;
  String productsReportColumns;
  String revenueReportColumns;
  String taxesReportColumns;
  String variationsReportColumns;
  String dashboardSections;
  String dashboardChartType;
  String dashboardChartInterval;
  String dashboardLeaderboardRows;
  String homepageLayout;
  String homepageStats;
  String taskListTrackedStartedTasks;
  String helpPanelHighlightShown;
  String androidAppBannerDismissed;

  factory WoocommerceMeta.fromJson(Map<String,dynamic> json) => WoocommerceMeta(
      activityPanelInboxLastRead: json['activity_panel_inbox_last_read'],
      activityPanelReviewsLastRead: json['activity_panel_reviews_last_read'],
      categoriesReportColumns: json['categories_report_columns'],
      couponsReportColumns: json['coupons_report_columns'],
      customersReportColumns: json['customers_report_columns'],
      ordersReportColumns: json['orders_report_columns'],
      productsReportColumns: json['products_report_columns'],
      revenueReportColumns: json['revenue_report_columns'],
      taxesReportColumns: json['taxes_report_columns'],
      variationsReportColumns: json['variations_report_columns'],
      dashboardSections: json['dashboard_sections'],
      dashboardChartType: json['dashboard_chart_type'],
      dashboardChartInterval: json['dashboard_chart_interval'],
      dashboardLeaderboardRows: json['dashboard_leaderboard_rows'],
      homepageLayout: json['homepage_layout'],
      homepageStats: json['homepage_stats'],
      taskListTrackedStartedTasks: json['task_list_tracked_started_tasks'],
      helpPanelHighlightShown: json['help_panel_highlight_shown'],
      androidAppBannerDismissed: json['android_app_banner_dismissed']
  );


  Map<String,dynamic> toJson() => {
    'activity_panel_inbox_last_read':activityPanelInboxLastRead,
    'activity_panel_reviews_last_read':activityPanelReviewsLastRead,
    'categories_report_columns':categoriesReportColumns,
    'coupons_report_columns':couponsReportColumns,
    'customers_report_columns':customersReportColumns,
    'orders_report_columns':ordersReportColumns,
    'products_report_columns':productsReportColumns,
    'revenue_report_columns':revenueReportColumns,
    'taxes_report_columns':taxesReportColumns,
    'variations_report_columns':variationsReportColumns,
    'dashboard_sections':dashboardSections,
    'dashboard_chart_type':dashboardChartType,
    'dashboard_chart_interval':dashboardChartInterval,
    'dashboard_leaderboard_rows':dashboardLeaderboardRows,
    'homepage_layout':homepageLayout,
    'homepage_stats':homepageStats,
    'task_list_tracked_started_tasks':taskListTrackedStartedTasks,
    'help_panel_highlight_shown':helpPanelHighlightShown,
    'android_app_banner_dismissed':androidAppBannerDismissed
  };


}

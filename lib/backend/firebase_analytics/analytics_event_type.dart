enum AnalyticsEventType {
  create_account, // create an user account
  delete_account, // delete an user account
  cancel_delete_account, // calcel to delete an user account
  login_user, // login user
  logout_user, // logout user
  answer_survey, // answer survey
  post_article, // post an article
  update_userdata, // update user attribute
}

enum AnalyticsPrams {
  shop_name,
  shop_link,
  plan_name,
  bottom_sheet_name,
}

extension AnalyticsPramsExt on AnalyticsPrams {
  static final _label = {
    AnalyticsPrams.shop_name: 'shop_name',
    AnalyticsPrams.shop_link: 'shop_link',
    AnalyticsPrams.plan_name: 'plan_name',
    AnalyticsPrams.bottom_sheet_name: 'bottom_sheet_name',
  };

  String get label => _label[this];
}

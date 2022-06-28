class Datas {
  static const String baseUrl = "http://120.48.48.225:8080";
  static const String signupCodeUrl = "$baseUrl/signup/sendCode";
  static const String signupUrl = "$baseUrl/signup";
  static const String signinUrl = "$baseUrl/signin";
  static const String userNameUrl = "$baseUrl/user/name";
  static const String leaveAskUrl = "$baseUrl/leave/ask";
  static const String leaveListUrl = "$baseUrl/leave/list";
  static const String memberListUrl = "$baseUrl/member/list";
  static const String memberPhoneUrl = "$baseUrl/member/phone";
  static const String memberInviteUrl = "$baseUrl/member/invite";
  static const String notificationListUrl = "$baseUrl/notification/list";
  static const String inviteChangeStatueUrl = "$baseUrl/invite/changStatus";
  static const String leaveAskListUrl = "$baseUrl/leave/askList";
  static const String leaveChangeStatusUrl = "$baseUrl/leave/changeStatus";
  static const String billAskUrl = "$baseUrl/bill/ask";
  static const String billListUrl = "$baseUrl/bill/list";
  static const String billAskListUrl = "$baseUrl/bill/askList";
  static const String billChangeStatusUrl = "$baseUrl/bill/changeStatus";
  static const String workAskUrl = "$baseUrl/work/ask";
  static const String workListUrl = "$baseUrl/work/list";
  static const String workAskListUrl = "$baseUrl/work/askList";
  static const String workChangeStatusUrl = "$baseUrl/work/changeStatus";

  static String imageUrl(String image) => "$baseUrl/image/$image";
}


class LoginRequest {
  String appReleaseId;
  String appUserName;
  String appUserValue;
  String userimei;

  LoginRequest({
    required this.appReleaseId,
    required this.appUserName,
    required this.appUserValue,
    required this.userimei,
  });

  Map<String, dynamic> toJson() {
    return {
      "appReleaseId": appReleaseId,
      "appUserName": appUserName,
      "appUserValue": appUserValue,
      "userimei": userimei,
    };
  }
}
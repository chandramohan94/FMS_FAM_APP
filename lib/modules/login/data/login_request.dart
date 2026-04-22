class LoginRequest {
  final String userImei;
  final String appReleaseId;
  final String username;
  final String password;

  LoginRequest({
    required this.userImei,
    required this.appReleaseId,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "userimei": userImei,
    "appReleaseId": appReleaseId,
    "appUserName": username,
    "appUserValue": password,
  };
}
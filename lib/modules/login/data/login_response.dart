class LoginResponse {
  final String empDesigId;
  final String empUserId;
  final String empDesigName;
  final String empLastName;
  final String empOfficeName;
  final String empId;
  final String empLogin;
  final String empFirstName;
  final String empCode;
  final String empOfficeid;
  final String empReportingOfficeId;
  final String status;
  final String? errMsg;
  final String ucode;
  final String cashierCode;
  final String isCashier;
  final String counterName;
  final String counterCode;
  final String counterUserRelationId;
  final String counterMasterId;
  final String jwt;
  final String appServiceKey;

  LoginResponse({
    required this.empDesigId,
    required this.empUserId,
    required this.empDesigName,
    required this.empLastName,
    required this.empOfficeName,
    required this.empId,
    required this.empLogin,
    required this.empFirstName,
    required this.empCode,
    required this.empOfficeid,
    required this.empReportingOfficeId,
    required this.status,
    this.errMsg,
    required this.ucode,
    required this.cashierCode,
    required this.isCashier,
    required this.counterName,
    required this.counterCode,
    required this.counterUserRelationId,
    required this.counterMasterId,
    required this.jwt,
    required this.appServiceKey,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      empDesigId: json["empDesigId"] ?? "",
      empUserId: json["empUserId"] ?? "",
      empDesigName: json["empDesigName"] ?? "",
      empLastName: json["empLastName"] ?? "",
      empOfficeName: json["empOfficeName"] ?? "",
      empId: json["empId"] ?? "",
      empLogin: json["empLogin"] ?? "",
      empFirstName: json["empFirstName"] ?? "",
      empCode: json["empCode"] ?? "",
      empOfficeid: json["empOfficeid"] ?? "",
      empReportingOfficeId: json["empReportingOfficeId"] ?? "",
      status: json["status"] ?? "",
      errMsg: json["errMsg"],
      ucode: json["ucode"] ?? "",
      cashierCode: json["cashierCode"] ?? "",
      isCashier: json["isCashier"] ?? "",
      counterName: json["counterName"] ?? "",
      counterCode: json["counterCode"] ?? "",
      counterUserRelationId: json["counterUserRelationId"] ?? "",
      counterMasterId: json["counterMasterId"] ?? "",
      jwt: json["jwt"] ?? "",
      appServiceKey: json["appServiceKey"] ?? "",
    );
  }
}
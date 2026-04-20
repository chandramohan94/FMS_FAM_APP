// loginresponse.dart


class LoginResponse {
  String empDesigId;
  String empUserId;
  String empDesigName;
  String empLastName;
  String empOfficeName;
  String empId;
  String empLogin;
  String empFirstName;
  String empCode;
  String empOfficeid;
  String appServiceKey;
  String empReportingOfficeId;
  String status;
  String? errMsg; // Nullable field
  String ucode;
  String cashierCode;
  String isCashier;
  String counterName;
  String counterCode;
  String counterUserRelationId;
  String counterMasterId;
  String jwt;

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
    required this.appServiceKey,
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
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      empDesigId: json['empDesigId'],
      empUserId: json['empUserId'],
      empDesigName: json['empDesigName'],
      empLastName: json['empLastName'],
      empOfficeName: json['empOfficeName'],
      empId: json['empId'],
      empLogin: json['empLogin'],
      empFirstName: json['empFirstName'],
      empCode: json['empCode'],
      empOfficeid: json['empOfficeid'],
      appServiceKey: json['appServiceKey'],
      empReportingOfficeId: json['empReportingOfficeId'],
      status: json['status'],
      errMsg: json['errMsg'],
      ucode: json['ucode'],
      cashierCode: json['cashierCode'],
      isCashier: json['isCashier'],
      counterName: json['counterName'],
      counterCode: json['counterCode'],
      counterUserRelationId: json['counterUserRelationId'],
      counterMasterId: json['counterMasterId'],
      jwt: json['jwt'],
    );
  }
}

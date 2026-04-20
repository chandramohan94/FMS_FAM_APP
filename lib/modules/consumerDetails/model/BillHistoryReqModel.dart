class BillHistoryReqModel {
  String? accountNumber;
  String? billYear;

  BillHistoryReqModel({this.accountNumber, this.billYear});

  BillHistoryReqModel.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    billYear = json['billYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['billYear'] = this.billYear;
    return data;
  }
  Map<String, dynamic> toQueryParameters() {
    return {
      'accountNumber': accountNumber,
      'billYear': billYear
    };
  }
}
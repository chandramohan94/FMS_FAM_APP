class BillHistoryResModel {
  List<BillDetails>? billDetails;
  var httpStatus;
  var status;
  var statusMessage;

  BillHistoryResModel(
      {this.billDetails, this.httpStatus, this.status, this.statusMessage});

  BillHistoryResModel.fromJson(Map<String, dynamic> json) {
    if (json['billDetails'] != null) {
      billDetails = <BillDetails>[];
      json['billDetails'].forEach((v) {
        billDetails!.add(new BillDetails.fromJson(v));
      });
    }
    httpStatus = json['httpStatus'];
    status = json['status'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billDetails != null) {
      data['billDetails'] = this.billDetails!.map((v) => v.toJson()).toList();
    }
    data['httpStatus'] = this.httpStatus;
    data['status'] = this.status;
    data['statusMessage'] = this.statusMessage;
    return data;
  }
}

class BillDetails {
  var minimumCharge;
  var billDueDate;
  var loadType;
  var lps;
  var previousReading;
  var serviceConnectionNumber;
  var billMonth;
  var fixedCharge;
  var billAmount;
  var billUnits;
  var consumerName;
  var presentReading;
  var otherCharge;
  var energyCharge;
  var mf;
  var catCode;
  var billingStatus;
  var consumerType;
  var billYear;
  var billDate;
  var totalArrear;
  var electricityDutyCharge;
  var disconnectionDate;
  var presentStatus;
  var previousStatus;
  var kno;

  BillDetails(
      {this.minimumCharge,
        this.billDueDate,
        this.loadType,
        this.lps,
        this.previousReading,
        this.serviceConnectionNumber,
        this.billMonth,
        this.fixedCharge,
        this.billAmount,
        this.billUnits,
        this.consumerName,
        this.presentReading,
        this.otherCharge,
        this.energyCharge,
        this.mf,
        this.catCode,
        this.billingStatus,
        this.consumerType,
        this.billYear,
        this.billDate,
        this.totalArrear,
        this.electricityDutyCharge,
        this.disconnectionDate,
        this.presentStatus,
        this.previousStatus,
        this.kno});

  BillDetails.fromJson(Map<String, dynamic> json) {
    minimumCharge = json['minimumCharge'];
    billDueDate = json['billDueDate'];
    loadType = json['loadType'];
    lps = json['lps'];
    previousReading = json['previousReading'];
    serviceConnectionNumber = json['serviceConnectionNumber'];
    billMonth = json['billMonth'];
    fixedCharge = json['fixedCharge'];
    billAmount = json['billAmount'];
    billUnits = json['billUnits'];
    consumerName = json['consumerName'];
    presentReading = json['presentReading'];
    otherCharge = json['otherCharge'];
    energyCharge = json['energyCharge'];
    mf = json['mf'];
    catCode = json['catCode'];
    billingStatus = json['billingStatus'];
    consumerType = json['consumerType'];
    billYear = json['billYear'];
    billDate = json['billDate'];
    totalArrear = json['totalArrear'];
    electricityDutyCharge = json['electricityDutyCharge'];
    disconnectionDate = json['disconnectionDate'];
    presentStatus = json['presentStatus'];
    previousStatus = json['previousStatus'];
    kno = json['kno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimumCharge'] = this.minimumCharge;
    data['billDueDate'] = this.billDueDate;
    data['loadType'] = this.loadType;
    data['lps'] = this.lps;
    data['previousReading'] = this.previousReading;
    data['serviceConnectionNumber'] = this.serviceConnectionNumber;
    data['billMonth'] = this.billMonth;
    data['fixedCharge'] = this.fixedCharge;
    data['billAmount'] = this.billAmount;
    data['billUnits'] = this.billUnits;
    data['consumerName'] = this.consumerName;
    data['presentReading'] = this.presentReading;
    data['otherCharge'] = this.otherCharge;
    data['energyCharge'] = this.energyCharge;
    data['mf'] = this.mf;
    data['catCode'] = this.catCode;
    data['billingStatus'] = this.billingStatus;
    data['consumerType'] = this.consumerType;
    data['billYear'] = this.billYear;
    data['billDate'] = this.billDate;
    data['totalArrear'] = this.totalArrear;
    data['electricityDutyCharge'] = this.electricityDutyCharge;
    data['disconnectionDate'] = this.disconnectionDate;
    data['presentStatus'] = this.presentStatus;
    data['previousStatus'] = this.previousStatus;
    data['kno'] = this.kno;
    return data;
  }
}
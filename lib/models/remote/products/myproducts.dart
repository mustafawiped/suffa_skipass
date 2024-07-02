class MyProductsModel {
  int getPaymentOnMobileID;
  int userID;
  int productID;
  DateTime paymentDate;
  int getPaymentOnMobileTypeID;
  String getPaymentOnMobileTypeInfo;
  String tableUniqueValue;
  bool getPaymentOnMobileState;
  String institutionWorkPointCommercialTransactionsDisplayText;

  MyProductsModel({
    required this.getPaymentOnMobileID,
    required this.userID,
    required this.productID,
    required this.paymentDate,
    required this.getPaymentOnMobileTypeID,
    required this.getPaymentOnMobileTypeInfo,
    required this.tableUniqueValue,
    required this.getPaymentOnMobileState,
    required this.institutionWorkPointCommercialTransactionsDisplayText,
  });

  factory MyProductsModel.fromJson(Map<String, dynamic> json) {
    return MyProductsModel(
      getPaymentOnMobileID: json['getPaymentOnMobileID'],
      userID: json['userID'],
      productID: json['productID'],
      paymentDate: DateTime.parse(json['paymentDate']),
      getPaymentOnMobileTypeID: json['getPaymentOnMobileTypeID'],
      getPaymentOnMobileTypeInfo: json['getPaymentOnMobileTypeInfo'],
      tableUniqueValue: json['tableUniqueValue'],
      getPaymentOnMobileState: json['getPaymentOnMobileState'],
      institutionWorkPointCommercialTransactionsDisplayText: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'getPaymentOnMobileID': getPaymentOnMobileID,
      'userID': userID,
      'productID': productID,
      'paymentDate': paymentDate.toIso8601String(),
      'getPaymentOnMobileTypeID': getPaymentOnMobileTypeID,
      'getPaymentOnMobileTypeInfo': getPaymentOnMobileTypeInfo,
      'tableUniqueValue': tableUniqueValue,
      'getPaymentOnMobileState': getPaymentOnMobileState,
      'institutionWorkPointCommercialTransactionsDisplayText':
          institutionWorkPointCommercialTransactionsDisplayText,
    };
  }
}

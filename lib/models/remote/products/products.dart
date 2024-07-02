class ProductModel {
  int institutionSoldCategoriesID;
  String soldcategoriesDisplayText;
  int institutionWorkPointCommercialTransactionsID;
  String institutionWorkPointCommercialTransactionsDisplayText;
  String filesDescription;
  double institutionWorkPointCommercialTransactionsPrice;

  ProductModel({
    required this.institutionSoldCategoriesID,
    required this.soldcategoriesDisplayText,
    required this.institutionWorkPointCommercialTransactionsID,
    required this.institutionWorkPointCommercialTransactionsDisplayText,
    required this.filesDescription,
    required this.institutionWorkPointCommercialTransactionsPrice,
  });

  Map<String, dynamic> toJson() => {
        'institutionSoldCategoriesID': institutionSoldCategoriesID,
        'soldcategoriesDisplayText': soldcategoriesDisplayText,
        'institutionWorkPointCommercialTransactionsID':
            institutionWorkPointCommercialTransactionsID,
        'institutionWorkPointCommercialTransactionsDisplayText':
            institutionWorkPointCommercialTransactionsDisplayText,
        'filesDescription': filesDescription,
        'institutionWorkPointCommercialTransactionsPrice':
            institutionWorkPointCommercialTransactionsPrice,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      institutionSoldCategoriesID: json['institutionSoldCategoriesID'],
      soldcategoriesDisplayText: json['soldcategoriesDisplayText'],
      institutionWorkPointCommercialTransactionsID:
          json['institutionWorkPointCommercialTransactionsID'],
      institutionWorkPointCommercialTransactionsDisplayText:
          json['institutionWorkPointCommercialTransactionsDisplayText'],
      filesDescription: json['filesDescription'],
      institutionWorkPointCommercialTransactionsPrice:
          json['institutionWorkPointCommercialTransactionsPrice'],
    );
  }
}

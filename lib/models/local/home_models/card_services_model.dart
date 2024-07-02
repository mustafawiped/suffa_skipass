class CardServicesModel {
  String cardServiceId;
  String cardServiceName;
  String cardServiceDate;
  bool cardServiceState;

  CardServicesModel({
    required this.cardServiceId,
    required this.cardServiceName,
    required this.cardServiceDate,
    required this.cardServiceState,
  });

  // JSON serialization
  factory CardServicesModel.fromJson(Map<String, dynamic> json) {
    return CardServicesModel(
      cardServiceId: json['cardServiceId'],
      cardServiceName: json['cardServiceName'],
      cardServiceDate: json['cardServiceDate'],
      cardServiceState: json['cardServiceState'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardServiceId': cardServiceId,
      'cardServiceName': cardServiceName,
      'cardServiceDate': cardServiceDate,
      'cardServiceState': cardServiceState,
    };
  }
}

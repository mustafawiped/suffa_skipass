import 'package:suffa_skipass/models/local/home_models/card_services_model.dart';

class VirtualCardModel {
  String cardId;
  String cardName;
  List<CardServicesModel> cardServices;
  bool cardStatus;

  VirtualCardModel({
    required this.cardId,
    required this.cardName,
    required this.cardServices,
    required this.cardStatus,
  });

  // JSON serialization
  factory VirtualCardModel.fromJson(Map<String, dynamic> json) {
    return VirtualCardModel(
      cardId: json['cardId'],
      cardName: json['cardName'],
      cardServices: (json['cardServices'] as List)
          .map((i) => CardServicesModel.fromJson(i))
          .toList(),
      cardStatus: json['cardStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'cardName': cardName,
      'cardServices': cardServices,
      'cardStatus': cardStatus,
    };
  }
}

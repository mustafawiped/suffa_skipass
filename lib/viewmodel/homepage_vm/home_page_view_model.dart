import 'package:flutter/material.dart';
import 'package:suffa_skipass/models/local/home_models/card_services_model.dart';
import 'package:suffa_skipass/models/local/home_models/virtual_card_model.dart';

class HomePageViewModel extends ChangeNotifier {
  int selectedCardIndex = 0;

  VirtualCardModel cardModel = VirtualCardModel(
      cardId: "",
      cardName: "",
      cardServices: [
        CardServicesModel(
            cardServiceDate: "",
            cardServiceId: "",
            cardServiceName: "",
            cardServiceState: false)
      ],
      cardStatus: false);

  void changeCardModel(VirtualCardModel data) {
    cardModel = data;
  }

  List<VirtualCardModel> cardList = [
    VirtualCardModel(
      cardId: "VC-24462",
      cardName: "Sanal Kartım 1",
      cardServices: [
        CardServicesModel(
            cardServiceId: "S",
            cardServiceName: "S",
            cardServiceDate: "s",
            cardServiceState: false)
      ],
      cardStatus: true,
    ),
    VirtualCardModel(
      cardId: "VC-24135",
      cardName: "Benim Kart 2",
      cardServices: [
        CardServicesModel(
            cardServiceId: "S",
            cardServiceName: "S",
            cardServiceDate: "s",
            cardServiceState: false)
      ],
      cardStatus: true,
    ),
    VirtualCardModel(
      cardId: "VC-24953",
      cardName: "Benim Sanal Kartım 3",
      cardServices: [
        CardServicesModel(
            cardServiceId: "S",
            cardServiceName: "S",
            cardServiceDate: "s",
            cardServiceState: false)
      ],
      cardStatus: true,
    ),
    VirtualCardModel(
      cardId: "VC-24145",
      cardName: "Kart Sanal Kart",
      cardServices: [
        CardServicesModel(
            cardServiceId: "S",
            cardServiceName: "S",
            cardServiceDate: "s",
            cardServiceState: false)
      ],
      cardStatus: true,
    ),
  ];
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/helpers/loading.dart';
import 'package:suffa_skipass/models/local/home_models/virtual_card_model.dart';
import 'package:suffa_skipass/pages/card_detail/widgets/myproducts.dart';
import 'package:suffa_skipass/pages/card_detail/widgets/qr_view.dart';

import '../../core/helpers/helper.dart';
import '../../core/resources/skipass_assets.dart';
import '../../viewmodel/carddetailpage_vm/card_detail_page_view_model.dart';
import 'widgets/buyproduct.dart';
import 'widgets/buyproductbottom.dart';

class CardDetailPage extends StatefulWidget {
  const CardDetailPage({super.key, required this.cardData});

  final VirtualCardModel cardData;

  static const String routeName = "card_detail_page_route_name";

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  final CardDetailPageViewModel viewModel = CardDetailPageViewModel();

  @override
  void initState() {
    super.initState();

    initConfigures();
  }

  void initConfigures() async {
    await getProducts();
    getMyProducts();
  }

  void getMyProducts() async {
    bool state = await viewModel.getMyProducts();
    if (state) {
      setState(() {});
    } else {
      Helpers.showErrorToast(
          context, "Hizmetlerim yüklenemedi, internet bağlantını kontrol et.");
    }
  }

  Future<bool> getProducts() async {
    bool state = await viewModel.getProductData();
    if (state) {
      setState(() {});
    } else {
      Helpers.showErrorToast(
          context, "Hizmet Al yüklenemedi, internet bağlantını kontrol et.");
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // card
          buildCard(),

          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(
                        text: "Hizmetlerim",
                      ),
                      Tab(
                        text: "Hizmet Al",
                      )
                    ],
                  ),
                  Container(
                    height: 470,
                    child: TabBarView(
                      children: [
                        // hizmetlerim kısmı
                        if (viewModel.myProductLoadingState)
                          loadingWidget()
                        else
                          MyProductsPart(
                            myProducts: viewModel.myProducts,
                            showQr: (code) {
                              createQrCode(code);
                            },
                          ),

                        // hizmet al kısmı
                        if (viewModel.productLoadingState)
                          loadingWidget()
                        else
                          BuyProductPart(
                            dataList: viewModel.productList,
                            buyProduct: (int productId) =>
                                paymentProduct(productId),
                          ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void createQrCode(String code) async {
    loadingDilaog.show(context);

    String? qrData = await viewModel.createQrCode(code);

    Navigator.pop(context);

    if (qrData != null) {
      QrView.show(context, qrData);
    } else {
      Helpers.showErrorToast(
          context, "Bir şeyler ters gitti, QR kod oluşturulamadı.");
    }
  }

  void paymentProduct(int productId) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BuyProductBottom(
          onClick: (String cardNumber, String cardHolder, String cardExd,
              String cardCvv) {
            buyProduct(productId);
          },
        );
      },
    );
  }

  void buyProduct(int productId) async {
    loadingDilaog.show(context);

    bool state = await viewModel.buyProduct(productId);

    if (state) {
      getMyProducts();

      Navigator.pop(context);
      Navigator.pop(context);
      Helpers.showSuccessToast(context, "Hizmet başarıyla satın alındı!");
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Helpers.showErrorToast(context, "Hizmet satın alınamadı.");
    }
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  SizedBox buildCard() {
    return SizedBox(
      height: 240,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            // background image
            getCardBackgroundImage(),

            // card name
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  widget.cardData.cardName,
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // card id
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  widget.cardData.cardId,
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // suffatech logo
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(18),
                      child: Image.asset(SkipassAssets.appLogo),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox getCardBackgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Image border
        child: SizedBox.fromSize(
          child: Image.asset(
            "assets/images/contents/cardbg.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

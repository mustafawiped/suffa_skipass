import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/resources/skipass_size.dart';
import '../../../models/remote/products/products.dart';
import '../../../utils/theme_utils.dart';

class BuyProductPart extends StatefulWidget {
  const BuyProductPart(
      {super.key, required this.dataList, required this.buyProduct});

  final List<ProductModel> dataList;
  final Function(int productId) buyProduct;

  @override
  State<BuyProductPart> createState() => _BuyProductPartState();
}

class _BuyProductPartState extends State<BuyProductPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildHeader(context, "Hizmetler"),
            BuildProductsList(),
          ],
        ),
      ),
    );
  }

  Container BuildProductsList() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: SkipassThemeUtils.getContentBackgroundColor(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          ProductModel product = widget.dataList[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              product
                                  .institutionWorkPointCommercialTransactionsDisplayText,
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 237, 239, 253),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.filesDescription,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.grey[300],
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          formatCurrency(product
                              .institutionWorkPointCommercialTransactionsPrice),
                          style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        InkWell(
                          onTap: () {
                            widget.buyProduct(product
                                .institutionWorkPointCommercialTransactionsID);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: SkipassThemeUtils.getBgColor(context),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Satın Al",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                      color: SkipassThemeUtils.getItemTextColor(
                                          context),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if ((widget.dataList.length - 1) != index)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                    color: SkipassThemeUtils.getContentBackgroundOtherColor(
                        context),
                  ),
                ),
              if ((widget.dataList.length - 1) == index)
                const SizedBox(height: 5)
            ],
          );
        },
      ),
    );
  }

  Container BuildHeader(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          textStyle: TextStyle(
            color: View.of(context).platformDispatcher.platformBrightness ==
                    Brightness.light
                ? Colors.grey.shade800
                : Colors.grey.shade200,
            fontWeight: FontWeight.w600,
            fontSize: SkipassSizes.textSubtitleSize,
          ),
        ),
      ),
    );
  }

  String formatCurrency(double value) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'tr_TR',
      symbol: 'TL',
      decimalDigits: 2,
    );
    return currencyFormatter.format(value);
  }
}

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'package:suffa_skipass/core/resources/skipass_assets.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/lifts/widgets/filter_menu_items.dart';

class LiftsPage extends StatefulWidget {
  const LiftsPage({super.key});

  @override
  State<LiftsPage> createState() => _LiftsPageState();
}

class _LiftsPageState extends State<LiftsPage> {
  List<Map<String, dynamic>> dataList = [
    {
      "name": "Fahri Telesiyej",
      "no": "A1",
      "length": "700m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Örnek Telesiyej 2",
      "no": "A2",
      "length": "800m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Başka Telesiyej",
      "no": "A3",
      "length": "600m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Hızlı Telesiyej",
      "no": "A4",
      "length": "900m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Yüksek Telesiyej",
      "no": "A1",
      "length": "750m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Gelişmiş Telesiyej",
      "no": "A1",
      "length": "820m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Modern Telesiyej",
      "no": "A2",
      "length": "720m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Konforlu Telesiyej",
      "no": "A2",
      "length": "850m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Yeni Telesiyej",
      "no": "A1",
      "length": "680m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Sürdürülebilir Telesiyej",
      "no": "A3",
      "length": "950m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Modern Telesiyej 2",
      "no": "A3",
      "length": "780m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Yüksek Performanslı Telesiyej",
      "no": "A1",
      "length": "890m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Premium Telesiyej",
      "no": "A4",
      "length": "730m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Eğlenceli Telesiyej",
      "no": "A1",
      "length": "810m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Hızlı ve Güvenli Telesiyej",
      "no": "A2",
      "length": "700m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Ultra Telesiyej",
      "no": "A4",
      "length": "920m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Rahat Telesiyej",
      "no": "A3",
      "length": "770m",
      "type": "2",
      "status": "inActive",
    },
    {
      "name": "Ergonomik Telesiyej",
      "no": "A2",
      "length": "840m",
      "type": "3",
      "status": "Active",
    },
    {
      "name": "Çağdaş Telesiyej",
      "no": "A3",
      "length": "710m",
      "type": "1",
      "status": "Active",
    },
    {
      "name": "Estetik Telesiyej",
      "no": "A3",
      "length": "880m",
      "type": "2",
      "status": "inActive",
    },
  ];

  List<Map<String, dynamic>> filterList = [];

  @override
  void initState() {
    super.initState();
    filterList.addAll(dataList);
  }

  void filterLifts(String no) {
    List<Map<String, dynamic>> filteredList =
        dataList.where((lift) => lift['no'] == no).toList();
    setState(() {
      filterList = filteredList;
    });
  }

  String getActiveLiftState() {
    int activeItems =
        dataList.where((lift) => lift['status'] == 'Active').length;

    return "$activeItems/${dataList.length}";
  }

  String calculateActivePassive(String status, String no) {
    int activeItems = dataList
        .where((lift) => lift['status'] == status && lift['no'] == no)
        .length;
    return "${status == "Active" ? "Aktif:" : "Pasif:"} $activeItems";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //top header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildHeader(context, "Güncel İstatistikler"),
              buildHeader(context, getActiveLiftState()),
            ],
          ),

          // A1 and A2 design
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                buildLiftType(
                    context,
                    SkipassAssets.imgiconA1,
                    "A1 Telesiyej",
                    calculateActivePassive("Active", "A1"),
                    calculateActivePassive("inActive", "A1")),
                const SizedBox(width: 5),
                buildLiftType(
                    context,
                    SkipassAssets.imgiconA2,
                    "A2 Telesiyej",
                    calculateActivePassive("Active", "A2"),
                    calculateActivePassive("inActive", "A2")),
              ],
            ),
          ),

          // A3 and A4 design
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                buildLiftType(
                    context,
                    SkipassAssets.imgiconA3,
                    "A3 Telesiyej",
                    calculateActivePassive("Active", "A3"),
                    calculateActivePassive("inActive", "A3")),
                const SizedBox(width: 5),
                buildLiftType(
                    context,
                    SkipassAssets.imgiconA4,
                    "A4 Telesiyej",
                    calculateActivePassive("Active", "A4"),
                    calculateActivePassive("inActive", "A4")),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildHeader(context, "Liftlerin Güncel Durumları"),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: buildFilterMenu(
                  filterLifts: (type) => filterLifts(type),
                ),
              ),
            ],
          ),

          // build list
          buildLiftLists()
        ],
      ),
    );
  }

  Container buildLiftLists() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 239, 253),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        itemCount: filterList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Map<String, dynamic> dataMap = filterList[index];

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          getLiftImageIcon(dataMap["no"]),
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataMap["name"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Uzunluk: ${dataMap["length"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Text(
                            "Tip: ${dataMap["type"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Text(
                        "Durum",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            dataMap["status"] == "Active" ? "Aktif" : "Pasif",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 1),
                          Icon(
                            Icons.circle,
                            color: dataMap["status"] == "Active"
                                ? Colors.green
                                : Colors.red,
                            size: 11,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Padding buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          textStyle: TextStyle(
            color: View.of(context).platformDispatcher.platformBrightness ==
                    Brightness.light
                ? Colors.grey.shade800
                : Colors.grey.shade200,
            fontWeight: FontWeight.w600,
            fontSize: SkipassSizes.textHeaderSize,
          ),
        ),
      ),
    );
  }

  Expanded buildLiftType(BuildContext context, String imageIcon,
      String titleText, String activeCount, String inActiveCount) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 239, 253),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imageIcon,
                width: 60,
                height: 60,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        activeCount,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 9,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        inActiveCount,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 9,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getLiftImageIcon(String no) => no == "A1"
      ? SkipassAssets.imgiconA1
      : no == "A2"
          ? SkipassAssets.imgiconA2
          : no == "A3"
              ? SkipassAssets.imgiconA3
              : SkipassAssets.imgiconA4;
}

class buildFilterMenu extends StatelessWidget {
  const buildFilterMenu({Key? key, required this.filterLifts})
      : super(key: key);

  final Function(String type) filterLifts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: GestureDetector(
        child: const Center(child: Icon(Icons.filter_list)),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => LiftsPageFilterMenuItems(
              onA1Clicked: () => filterLifts("A1"),
              onA2Clicked: () => filterLifts("A2"),
              onA3Clicked: () => filterLifts("A3"),
              onA4Clicked: () => filterLifts("A4"),
            ),
            direction: PopoverDirection.bottom,
            backgroundColor: Colors.white,
            width: 200,
            height: 229,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

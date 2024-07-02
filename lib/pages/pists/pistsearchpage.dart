import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/utils/theme_utils.dart';
import 'package:suffa_skipass/viewmodel/pistspage_vm/pistsearch_view_model.dart';

import 'widgets/pistpage_widgets/main_list.dart';
import 'widgets/searchpage_widgets/search_input.dart';

class PistSearchPage extends StatefulWidget {
  const PistSearchPage({super.key});

  static const String routeName = "pist_search_page_route_name";

  @override
  State<PistSearchPage> createState() => _PistSearchPageState();
}

class _PistSearchPageState extends State<PistSearchPage> {
  final PistsSearchPageViewModel viewModel = PistsSearchPageViewModel();

  List<Map<String, dynamic>> dataList = [];
  /*
  Example:
    {
      "pistName" : "Fahri Pisti",
      "pistState" : true,
      "pistNo" : "P1",
      "pistLength" : "540m",
      "pistCrushed" : "21 Şubat 2024 saat 14:33",
      "pistLevel" : 2,
    },
  */
  List<Map<String, dynamic>> list = [
    {
      "pistName": "Fahri Pisti",
      "pistState": true,
      "pistNo": "P1",
      "pistLength": "540m",
      "pistCrushed": "21 Şubat 14:33",
      "pistLevel": 2,
    },
    {
      "pistName": "Tavşan Yolu",
      "pistState": false,
      "pistNo": "P2d",
      "pistLength": "0m",
      "pistCrushed": "18 Şubat 16:34",
      "pistLevel": 1,
    },
    {
      "pistName": "Eğitim Pisti",
      "pistState": true,
      "pistNo": "P5b",
      "pistLength": "120m",
      "pistCrushed": "21 Şubat 10:30",
      "pistLevel": 0,
    },
    {
      "pistName": "Cennetkaya Pisti",
      "pistState": true,
      "pistNo": "P6",
      "pistLength": "1335m",
      "pistCrushed": "21 Şubat 10:30",
      "pistLevel": 2,
    },
    {
      "pistName": "Osman Yüce Pisti",
      "pistState": true,
      "pistNo": "P7",
      "pistLength": "1100m",
      "pistCrushed": "21 Şubat 10:30",
      "pistLevel": 1,
    },
    {
      "pistName": "Karkay Pisti",
      "pistState": false,
      "pistNo": "P9",
      "pistLength": "509m",
      "pistCrushed": "19 Ocak 16:32",
      "pistLevel": 0,
    },
  ];

  bool isChanged = false;

  void searchPist(String searchText) {
    dataList = [];

    for (var item in list) {
      if (item['pistName'].toLowerCase().contains(searchText.toLowerCase())) {
        dataList.add(item);
      }
    }
    setState(() {
      isChanged = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SkipassThemeUtils.getBgColor(context),
        surfaceTintColor: Colors.transparent,
        title: Text("Pist Arama",
            style: GoogleFonts.outfit(
                textStyle: TextStyle(
                    color: SkipassThemeUtils.getItemTextColor(context)))),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // search input
            PistsSearchPageInputWidget(
              controller: viewModel.searchTextController,
              onClick: searchPist,
            ),

            // output list
            buildList(),
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    if (dataList.isEmpty) {
      return Center(
        child: Text(
          isChanged ? "Herhangi bir pist bulunamadı." : "",
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              color: SkipassThemeUtils.getItemTextColor(context),
            ),
          ),
        ),
      );
    } else {
      return PistsBuildMainList(dataList: dataList);
    }
  }
}

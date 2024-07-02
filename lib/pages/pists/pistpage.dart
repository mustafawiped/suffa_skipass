// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suffa_skipass/core/resources/skipass_size.dart';
import 'package:suffa_skipass/pages/pists/pistsearchpage.dart';

import 'widgets/pistpage_widgets/hardship_info.dart';
import 'widgets/pistpage_widgets/main_list.dart';
import 'widgets/pistpage_widgets/top_info.dart';

class PistPage extends StatefulWidget {
  const PistPage({super.key});

  @override
  State<PistPage> createState() => _PistPageState();
}

class _PistPageState extends State<PistPage> {
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
  List<Map<String, dynamic>> dataList = [
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopHeader(context),

          // top info (active pists, passive pist fln.)
          const PistsTopInfoWidget(),

          CenterHeader(context),

          // hardship level info
          const PistsHardshipLevelInfos(),

          // build pist list
          PistsBuildMainList(dataList: dataList),
        ],
      ),
    );
  }

  Padding CenterHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildHeader(context, "Güncel Pist İstatistiği"),
          Tooltip(
            message: "Pist Ara..",
            child: IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PistSearchPage.routeName),
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  Padding TopHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildHeader(context, "Genel İstatistik"),
          BuildHeader(context, "10/13"),
        ],
      ),
    );
  }

  Padding BuildHeader(BuildContext context, String title) {
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
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_online_c13/model/sura_model.dart';
import 'package:islami_online_c13/utils/app_colors.dart';
import 'package:islami_online_c13/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  // List<String> verses = [];
  String suraContentText = '';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (suraContentText.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: AppStyles.bold24Primary,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                args.suraArabicName,
                style: AppStyles.bold24Primary,
              ),
              const SizedBox(
                height: 30,
              ),
              suraContentText.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ))
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          suraContentText,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: AppStyles.bold20Primary,
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/files/$fileName');
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}] ';
    }
    suraContentText = suraLines.join('');
    print('suraContent: $suraContent');

    /// content
    // verses = suraLines;
    setState(() {});
  }
}

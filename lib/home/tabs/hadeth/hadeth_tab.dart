import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_online_c13/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_online_c13/model/hadeth_model.dart';
import 'package:islami_online_c13/utils/app_colors.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/logo.png'),
        CarouselSlider.builder(
          itemCount: hadethList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
                  arguments: hadethList[itemIndex]);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryDark,
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/hadeth_bg_image.png'))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: hadethList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                    : Column(
                        children: [
                          Text(
                            hadethList[itemIndex].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Expanded(
                              child: Text(
                            hadethList[itemIndex].content.join(''),
                            style: const TextStyle(fontSize: 20),
                          ))
                        ],
                      ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.6,
            viewportFraction: 0.72,
            enlargeCenterPage: true,
            // enableInfiniteScroll: false
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0]; // title
      hadethLines.removeAt(0); // remove title
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}

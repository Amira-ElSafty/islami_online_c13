import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_online_c13/app_colors.dart';
import 'package:islami_online_c13/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_online_c13/model/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
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
            height: 500,
            viewportFraction: 0.75,
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

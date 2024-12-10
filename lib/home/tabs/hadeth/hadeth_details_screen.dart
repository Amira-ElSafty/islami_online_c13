import 'package:flutter/material.dart';
import 'package:islami_online_c13/app_colors.dart';
import 'package:islami_online_c13/home/tabs/hadeth/hadeth_content_item.dart';
import 'package:islami_online_c13/model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
        appBar: AppBar(),
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
                  args.title,
                  style: const TextStyle(
                      fontSize: 24, color: AppColors.primaryDark),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return HadethContentItem(content: args.content[index]);
                    },
                    itemCount: args.content.length,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

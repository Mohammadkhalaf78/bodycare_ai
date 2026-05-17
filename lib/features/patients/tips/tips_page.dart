import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/patients/tips/user/data.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Icon(Icons.search, size: 30),
          ),
        ],

        leading: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Tips & Advice', style: AppTextStyle.font32BlackBold),
            verticalSpace(16),
            ListView.builder(
              itemCount: adviceList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    advice_photo(adviceImage: adviceList[index].photo),
                    verticalSpace(16),
                    Text(
                      adviceList[index].painName,
                      style: AppTextStyle.font14GreenMedium,
                    ),
                    verticalSpace(8),
                    Text(
                      adviceList[index].title,
                      style: AppTextStyle.font18BlackBold,
                    ),
                    verticalSpace(8),
                    Text(
                      adviceList[index].description,
                      style: AppTextStyle.font16GrayRegular,
                    ),
                    verticalSpace(8),
                    Text(
                      adviceList[index].time,
                      style: AppTextStyle.font14GrayRegular,
                    ),
                    verticalSpace(16),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class advice_photo extends StatelessWidget {
  const advice_photo({super.key, required this.adviceImage});
  final String adviceImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(adviceImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:hamyar/overal_widgets/title_bar.dart';
import 'package:hamyar/general_info/current_month_charts.dart';
import 'package:hamyar/general_info/last_year_charts.dart';

class GeneralInfoScreen extends StatelessWidget {
  static const routeName = '/general-info-screen';
  const GeneralInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final MaterialColor? color = data['color'];
    final String title = data['title'];
    final deviceSize = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        primarySwatch: color,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TitleBar(
                  title: title,
                  hasBackOption: true,
                  buttons: {
                    Icons.settings: () {},
                    Icons.crop: () {},
                    Icons.person: () {},
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CurrentMonthCharts(deviceSize: deviceSize),
                        const Divider(
                          indent: 30,
                          endIndent: 30,
                        ),
                        LastYearCharts(deviceSize: deviceSize),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

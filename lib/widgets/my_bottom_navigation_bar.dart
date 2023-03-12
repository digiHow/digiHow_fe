import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int index = 0;
  List<String> labelsList = ['도움 받기', '도움말', '커뮤니티', '설정'];
  List<IconData> iconsList = [
    Icons.phone,
    Icons.help,
    Icons.chat,
    Icons.settings
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        for (int i = 0; i < labelsList.length; i++)
          BottomNavigationBarItem(
            icon: index == i
                ? Container(
                    width: 67,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: MyColors.naviagtionBarColorBlue,
                    ),
                    child: Icon(
                      iconsList[i],
                      color: MyColors.primary,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      iconsList[i],
                      color: MyColors.naviagtionBarColorGrey,
                    ),
                  ),
            label: labelsList[i],
          ),
      ],
      selectedLabelStyle: MyTextStyle.CpS12W500,
      unselectedLabelStyle: MyTextStyle.CpS12W500,
      selectedItemColor: MyColors.primary,
      currentIndex: index,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
    );
  }
}

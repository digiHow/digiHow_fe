import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helper/helper_observer_webrtc_screen.dart';
import 'package:digi_how/screens/helper/helper_webrtc_screen.dart';
import 'package:digi_how/view_models/reservation_view_model.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:digi_how/widgets/header_logo.dart';
import 'package:digi_how/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperMainScreen extends StatefulWidget {
  const HelperMainScreen({super.key});

  @override
  State<HelperMainScreen> createState() => _HelperMainScreenState();
}

class _HelperMainScreenState extends State<HelperMainScreen> {
  String? username = '';
  @override
  void initState() {
    super.initState();
    UserViewModel()
        .getUserName()
        .then((value) => setState(() => username = value));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderLogo(isWhite: true),
              const SizedBox(
                height: 48,
              ),
              _infoTexts(),
              const SizedBox(
                height: 22,
              ),
              SizedBox(width: 352, height: 500, child: _reservationBoxes()),
            ],
          ),
        ),
        bottomNavigationBar:
            const SizedBox(height: 100, child: MyBottomNavigationBar()),
      ),
    );
  }

  Widget _infoTexts() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.info_outline,
          color: MyColors.white,
        ),
        SizedBox(width: 9),
        Text(
          '실시간 도움 요청',
          style: MyTextStyle.CwS20W500,
        )
      ],
    );
  }

  StreamBuilder _reservationBoxes() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('reservations')
          // .orderBy('isCallFinished', descending: true)
          .orderBy('createdDTTM', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            '가져오는 중...',
            style: MyTextStyle.CwS18W500,
          );
        } else if (snapshot.hasError) {
          return const Text(
            '에러가 발생했습니다.',
            style: MyTextStyle.CwS18W500,
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.docs[index];
                bool isAllFinished =
                    data['isHelperExist'] && data['isObserverExist'];
                return Container(
                  padding: const EdgeInsets.all(19),
                  margin: const EdgeInsets.only(bottom: 18),
                  width: 352,
                  height: 160,
                  decoration: BoxDecoration(
                    color: isAllFinished
                        ? MyColors.finishedBoxColor
                        : MyColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${data['helpeeInfos']['name']}님',
                            style: isAllFinished
                                ? MyTextStyle.disabledBigBoldText
                                : MyTextStyle.CbS20W700,
                          ),
                          Text(
                            '이 도움을 요청합니다.',
                            style: isAllFinished
                                ? MyTextStyle.disabledBigNormalText
                                : MyTextStyle.CbS20W500,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        isAllFinished ? '완료' : '대기 중...',
                        style: isAllFinished
                            ? MyTextStyle.disabledSmallNormalText
                            : MyTextStyle.CgS14W500,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 132,
                            height: 44,
                            child: TextButton(
                              style: data['isObserverExist']
                                  ? MyButtonStyle.participateButtonDisabled
                                  : MyButtonStyle.skyBlueParticipateButton,
                              onPressed: () async {
                                if (!data['isObserverExist']) {
                                  String? res = await ReservationViewModel()
                                      .updateReservationWithObserverInfos(
                                          data['helperRoomId'],
                                          data['observerRoomId']);
                                  if (res == SUCCESS) {
                                    print(
                                        '[DEBUG] observerRoomId:${data['observerRoomId']}');
                                    Get.to(HelperObserverWebrtcScreen(
                                        helperRoomId: data['helperRoomId'],
                                        observerRoomId:
                                            data['observerRoomId']));
                                  } else {
                                    print('[DEBUG]:$res');
                                  }
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('감시자',
                                      style: data['isObserverExist']
                                          ? MyTextStyle.disabledSmallBoldText
                                          : MyTextStyle.CpS15W700),
                                  Text('로 참여',
                                      style: data['isObserverExist']
                                          ? MyTextStyle.disabledSmallNormalText
                                          : MyTextStyle.CpS15W500),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 132,
                            height: 44,
                            child: TextButton(
                              style: isAllFinished
                                  ? MyButtonStyle.participateButtonDisabled
                                  //TODO: 나중에 색 디자인 나오면 바꿔야 함
                                  : data['isHelperExist']
                                      ? MyButtonStyle
                                          .primaryParticipateButtonDisabled
                                      : MyButtonStyle.primaryParticipateButton,
                              onPressed: () async {
                                if (!data['isHelperExist']) {
                                  await ReservationViewModel()
                                      .updateReservationWithHelperInfos(
                                          data['helperRoomId']);
                                  Get.to(HelperWebrtcScreen(
                                      roomId: data['helperRoomId']));
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('도우미',
                                      style: data['isHelperExist']
                                          ? MyTextStyle.disabledSmallBoldText
                                          : MyTextStyle.CwS15W700),
                                  Text('로 참여',
                                      style: data['isHelperExist']
                                          ? MyTextStyle.disabledSmallNormalText
                                          : MyTextStyle.CwS15W500),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

import '../custom_icon_swith_button.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({super.key});

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  bool isDataLoaded = false;
  bool isCalendar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomContainerWidget(
              enableShimmer: isDataLoaded,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getBorderedIconButton(
                    icon:
                        const Icon(HugeIcons.strokeRoundedRefresh, color: grey),
                    onpressed: () {},
                  ),
                  const SizedBox(width: 5),
                  getBorderedIconButton(
                    icon: const Icon(HugeIcons.strokeRoundedInformationCircle,
                        color: grey),
                    onpressed: () {},
                  ),
                  const SizedBox(width: 5),
                  CustomIconSwitchButton(
                    onChanged: (value) {
                      isCalendar = value;
                      setState(() {});
                    },
                    initialValue: isCalendar,
                    icon1: Icon(
                      HugeIcons.strokeRoundedCalendar03,
                      color: !isCalendar ? grey : white,
                    ),
                    icon2: Icon(
                      HugeIcons.strokeRoundedLeftToRightListBullet,
                      color: !isCalendar ? white : grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBorderedIconButton({
    required Icon icon,
    required Function onpressed,
  }) {
    return InkWell(
      onTap: () => onpressed(),
      child: CustomContainerWidget(
        height: 40,
        width: 40,
        childPaddingBottom: 0,
        childPaddingTop: 0,
        childPaddingLeft: 0,
        childPaddingRight: 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey),
        ),
        child: icon,
      ),
    );
  }
}

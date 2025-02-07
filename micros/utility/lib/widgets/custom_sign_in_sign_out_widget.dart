import 'package:flutter/material.dart';
import '../constant/constant_color.dart';
import 'custom_container.dart';

class CustomSignInSignOutWidget extends StatelessWidget {
  final bool isCheckIn;
  final String checkTime;
  final bool enableShimmer;

  const CustomSignInSignOutWidget(
      {super.key,
      required this.isCheckIn,
      required this.checkTime,
      this.enableShimmer = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainerWidget(
        enableShimmer: enableShimmer,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isCheckIn
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 40,
              width: 40,
              child: Icon(
                Icons.login_outlined,
                color: isCheckIn ? Colors.green : Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isCheckIn ? "Check In" : "Check Out",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge,
                  ),
                  Text(

                    checkTime,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor
                    )
                    ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

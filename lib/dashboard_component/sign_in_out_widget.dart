import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:utility/utility.dart';

class SignInOutWidget extends StatelessWidget {
  final String checkInTime;
  final String checkOutTime;
  final bool? showShimmer;
  final bool showWidget;

  const SignInOutWidget({
    super.key,
    required this.checkInTime,
    required this.checkOutTime,
    this.showShimmer = false,
    required this.showWidget
  });

  @override
  Widget build(BuildContext context) {
    return showWidget == true? showShimmer == true
        ? Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          CustomSignInSignOutWidget(
            checkTime: checkInTime,
            isCheckIn: true,
          ),
          const SizedBox(width: 2),
          CustomSignInSignOutWidget(
            checkTime: checkOutTime,
            isCheckIn: false,
          ),
        ],
      ),
    ) : Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Row(
            children: [

              Expanded(
                child: CustomContainerWidget(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.login_outlined,
                          color: Colors.green ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text( "Check In" ),
                            Text(
                              "09:00 AM",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 2),
              CustomSignInSignOutWidget(
                checkTime: checkOutTime,
                isCheckIn: false,
              ),
            ],
          ),
        )
      ),
    ):Container();;
  }
}

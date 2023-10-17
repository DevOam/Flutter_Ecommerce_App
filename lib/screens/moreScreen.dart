import 'package:flutter/material.dart';
import 'package:splonks/const/colors.dart';
import 'package:splonks/screens/aboutScreen.dart';
import 'package:splonks/screens/inboxScreen.dart';
import 'package:splonks/screens/myOrderScreen.dart';
import 'package:splonks/screens/notificationScreen.dart';
import 'package:splonks/screens/paymentScreen.dart';
import 'package:splonks/utils/helper.dart';
import 'package:splonks/widgets/customNavBar.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "More",
                          style: Helper.getTheme(context).headline5,
                        ),
                        Image.asset(
                          Helper.getAssetName("cart.png", "virtual"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MoreCard(
                      image: Image.asset(
                        Helper.getAssetName("income.png", "virtual"),
                      ),
                      name: "Payment Details",
                      handler: () {
                        Navigator.of(context).pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      image: Image.asset(
                        Helper.getAssetName("shopping_bag.png", "virtual"),
                      ),
                      name: "My Orders",
                      handler: () {
                        Navigator.of(context).pushNamed(MyOrderScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      image: Image.asset(
                        Helper.getAssetName("noti.png", "virtual"),
                      ),
                      name: "Notifications",
                      isNoti: true,
                      handler: () {
                        Navigator.of(context).pushNamed(NotificationScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      image: Image.asset(
                        Helper.getAssetName("mail.png", "virtual"),
                      ),
                      name: "Inbox",
                      handler: () {
                        Navigator.of(context).pushNamed(InboxScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      image: Image.asset(
                        Helper.getAssetName("info.png", "virtual"),
                      ),
                      name: "About Us",
                      handler: () {
                        Navigator.of(context).pushNamed(AboutScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              more: true,
            ),
          )
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({
    Key? key,
    required this.name,
    required this.image,
    this.isNoti = false,
    required this.handler,
  }) : super(key: key);

  final String name;
  final Image image;
  final bool isNoti;
  final VoidCallback handler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        height: 70,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColor.placeholderBg,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColor.placeholder,
                    ),
                    child: image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColor.placeholderBg,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.secondary,
                  size: 17,
                ),
              ),
            ),
            if (isNoti)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(
                    right: 50,
                  ),
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "15",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

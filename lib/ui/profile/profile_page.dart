import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/app_styles.dart';
import '../widgets/text_input.dart';
import 'controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset(
                "assets/svg/background.svg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 64,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => {},
                        child: Container(
                            color: Colors.transparent,
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                "assets/svg/back_icon.svg",
                                width: 24,
                                height: 24,
                                color: Colors.white,
                                fit: BoxFit.contain,
                              ),
                            ))),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(),
                    Text(
                      "Hồ sơ của tôi",
                      style: AppStyles.TextStyleTitleWhiteLargeSize,
                    ),
                    SizedBox(
                      width: 62,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        'Đăng xuất',
                        style: AppStyles.TextStyleRedNormalSize,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SvgPicture.asset(
                  "assets/svg/logo.svg",
                  width: 164,
                  height: 164,
                  fit: BoxFit.fill,
                ),
                // SizedBox(),
                Container(
                  child: Column(
                    children: [
                      TextInput(
                          initValue: "",
                          inputPlaholder: "Nhập số điện thoại",
                          handleInputChanged: (val) {}),
                      TextInput(
                        initValue: "",
                        inputPlaholder: "Nhập email",
                        handleInputChanged: (val) {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

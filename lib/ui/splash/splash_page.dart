import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:view_booters/ui/splash/splash_controller.dart';

import '../utils/app_color.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
    clientId:
        "30738780096-v7lreqtvg4eao73l2n4sgavb4kcv7d2h.apps.googleusercontent.com");

class SplashPage extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Text("CHÀO MỪNG ĐẾN VỚI",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.fade),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  alignment: WrapAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? googleUser =
                              await googleSignIn.signIn();
                          if (googleUser != null) {
                            // Đăng nhập thành công, thực hiện các xử lý tiếp theo
                            // Lấy thông tin user từ googleUser
                            final String email = googleUser.email;
                            final String displayName =
                                googleUser.displayName ?? "";
                            final String photoUrl = googleUser.photoUrl ?? "";
                            final String userId = googleUser.id ?? "";
                            final GoogleSignInAuthentication googleAuth =
                                await googleUser.authentication;
                            final String accessToken =
                                googleAuth.accessToken ?? "";

                            print(
                                "Google Signed in email: $email  name: $displayName avatar: $photoUrl  userId: $userId  accessToken: $accessToken");
                          } else {
                            print("google user is Null");
                          }
                        } catch (error) {
                          // Xử lý lỗi khi đăng nhập
                          print("Loỗi: $error");
                        }
                      },
                      child: Text('Sign in with Google'),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

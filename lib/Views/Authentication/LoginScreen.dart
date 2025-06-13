import 'package:NotesNest/Utility/ResponsiveUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../ViewModels/AuthViewModels/AuthControllers.dart';
import '../../ViewModels/AuthViewModels/FacebookViewModels.dart';
import '../../ViewModels/AuthViewModels/GoogleAuthViewsModels.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Widgets/Buttons/BackWidgets.dart';
import '../../Widgets/Buttons/BottomButton.dart';
import '../../Widgets/Buttons/ButtonWidgets.dart';
import '../../Widgets/DividerWidgets.dart';
import '../../Widgets/InputWidgets.dart';
import '../../Widgets/LogingHeadlines.dart';
import '../../Widgets/Buttons/SocialButton.dart';
import '../FeedScreen.dart';
import 'SingUpScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LightModeController lightModeController =
      Get.put(LightModeController());
  final AuthController authController = Get.put(AuthController());
  final GoogleAuthController googleAuthController = Get.put(GoogleAuthController());
  final FacebookController facebookController = Get.put(FacebookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
          lightModeController.isLightMode.value ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor:
            lightModeController.isLightMode.value ? Colors.white : Colors.black,
        leading: BackWidget(
          onTap: () {},
          imagePath: AppConstants.backBlackIcon,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: lightModeController.isLightMode.value
                            ? Colors.white
                            : Colors.black,
                        padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.055),
                        child: LoginHeadlines(
                          headingText: AppConstants.loginTitle,
                          subHeadingText: AppConstants.loginSubtitle,
                        ),
                      ),
                      SizedBox(height: ResponsiveUtils.height(0.02)),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: lightModeController.isLightMode.value
                                ? Colors.black
                                : Colors.white,
                            borderRadius: ResponsiveUtils.borderRadiusOnly(
                              topLeft: 0.08,
                              topRight: 0.08,
                            ),
                          ),
                          child: Padding(
                            padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.02),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: ResponsiveUtils.height(0.06)),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Obx(
                                          () => facebookController.isLoading.value
                                          ? const CircularProgressIndicator()
                                          : SocialButton(
                                        text: "Facebook",
                                        asset:
                                        AppConstants.facebookIcon,
                                        onPressed: () =>
                                            facebookController
                                                .loginWithFacebook(),
                                      ),
                                    ),
                                    Obx(
                                          () => googleAuthController
                                          .isLoading.value
                                          ? const CircularProgressIndicator()
                                          : SocialButton(
                                        text: "Google",
                                        asset: AppConstants.googleIcon,
                                        onPressed: () =>
                                            googleAuthController
                                                .signInWithGoogle(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: ResponsiveUtils.height(0.01)),
                                DividerWidgets(),
                                SizedBox(height: ResponsiveUtils.height(0.01)),
                                InputField(
                                  hintText: AppConstants.emailHints,
                                  controller:
                                      authController.emailOrMobileController,
                                ),
                                SizedBox(height: ResponsiveUtils.height(0.02)),
                                InputField(
                                  hintText: AppConstants.passwordHint,
                                  isPassword: true,
                                  controller: authController.passwordController,
                                ),
                                SizedBox(height: ResponsiveUtils.height(0.03)),
                                Padding(
                                  padding: ResponsiveUtils.paddingSymmetric(horizontalPercent: 0.02),
                                  child: Obx(
                                    () => authController.isLoading.value
                                        ? CircularProgressIndicator()
                                        : ButtonWidgets(
                                            onTap: () async {
                                              bool isSuccess =
                                                  await authController
                                                      .logInUsers();
                                              if (isSuccess) {
                                                Get.to(FeedScreen());
                                              } else {
                                                Get.off(SignUpScreen());
                                              }
                                            },
                                            buttonText: AppConstants.loginTitle,
                                          ),
                                  ),
                                ),
                                SizedBox(height: ResponsiveUtils.height(0.03)),
                                BottomButton(
                                  text: AppConstants.haveAccount,
                                  sText: AppConstants.signupTitle,
                                  onTap: () {
                                    Get.to(SignUpScreen());
                                  },
                                ),
                                SizedBox(height: ResponsiveUtils.height(0.03)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

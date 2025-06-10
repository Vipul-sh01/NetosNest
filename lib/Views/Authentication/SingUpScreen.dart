import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constents/AppConstents.dart';
import '../../Constents/AppStyles.dart';
import '../../ViewModels/AuthViewModels/AuthControllers.dart';
import '../../ViewModels/AuthViewModels/FacebookViewModels.dart';
import '../../ViewModels/AuthViewModels/GoogleAuthViewsModels.dart';
import '../../ViewModels/CheckboxViewModels.dart';
import '../../ViewModels/DarkModeViewModels.dart';
import '../../Widgets/Buttons/BackWidgets.dart';
import '../../Widgets/Buttons/BottomButton.dart';
import '../../Widgets/Buttons/ButtonWidgets.dart';
import '../../Widgets/CheckBox.dart';
import '../../Widgets/DividerWidgets.dart';
import '../../Widgets/InputWidgets.dart';
import '../../Widgets/LogingHeadlines.dart';
import '../../Widgets/Buttons/SocialButton.dart';
import '../FeedScreen.dart';
import 'LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final CheckBoxController controller = Get.put(CheckBoxController());
  final LightModeController lightModeController = Get.put(LightModeController());
  final AuthController authController = Get.put(AuthController());
  final GoogleAuthController googleAuthController = Get.put(GoogleAuthController());
  final FacebookController facebookController = Get.put(FacebookController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: lightModeController.isLightMode.value
              ? Colors.white
              : Colors.black,
          leading: BackWidget(
            onTap: () {},
            imagePath: AppConstants.backBlackIcon,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 268,
                width: double.infinity,
                color: lightModeController.isLightMode.value
                    ? Colors.white
                    : Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LoginHeadlines(
                  headingText: AppConstants.signupTitle,
                  subHeadingText: AppConstants.loginSubtitle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 670,
                decoration: BoxDecoration(
                  color: lightModeController.isLightMode.value
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => facebookController.isLoading.value
                                ? CircularProgressIndicator()
                                : SocialButton(
                                    text: "Facebook",
                                    asset: AppConstants.facebookIcon,
                                    onPressed: () async {
                                      facebookController.loginWithFacebook();
                                    },
                                  ),
                          ),
                          Obx(
                            () => googleAuthController.isLoading.value
                                ? CircularProgressIndicator()
                                : SocialButton(
                                    text: "Google",
                                    asset: AppConstants.googleIcon,
                                    onPressed: () async {
                                      googleAuthController.signInWithGoogle();
                                    },
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      DividerWidgets(),
                      const SizedBox(height: 20),
                      InputField(
                        hintText: AppConstants.nameHint,
                        keyboardType: TextInputType.text,
                        controller: authController.nameController,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        hintText: AppConstants.emailHint,
                        keyboardType: TextInputType.text,
                        controller: authController.emailOrMobileController,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        hintText: AppConstants.passwordHint,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        controller: authController.passwordController,
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Obx(() => CheckBox(
                                  onPressed: controller.toggleCheckbox,
                                  isChecked: controller.isChecked.value,
                                )),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                AppConstants.termsText,
                                style:
                                    AppStyles.normalText.copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Obx(
                          () => authController.isLoading.value
                              ? CircularProgressIndicator()
                              : ButtonWidgets(
                                  onTap: () async {
                                    bool isSuccess =
                                        await authController.registerSubmit();
                                    if (isSuccess) {
                                      Get.to(FeedScreen());
                                    } else {
                                      Get.off(SignUpScreen());
                                    }
                                  },
                                  buttonText: AppConstants.createAccountText,
                                ),
                        ),
                      ),
                      BottomButton(
                        text: AppConstants.haveAccountText,
                        sText: AppConstants.signIn,
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
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

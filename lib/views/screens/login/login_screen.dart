import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/login_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/screens/settings/change_language.dart';
import 'package:sport_fm/views/screens/settings/privacy_policy_screen.dart';
import 'package:sport_fm/views/widgets/custom_button.dart';
import 'package:sport_fm/views/widgets/custom_loading.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';
import 'package:sport_fm/views/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ChangeLanguageScreen());
              },
              icon: Icon(
                Icons.language,
                color: secondaryColor,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.w),
        children: [
          kSizedBoxH25,
          Image.asset(logoImg),
          kSizedBoxH25,
          Center(
              child: CustomText(
            text: 'welcome'.tr,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          )),
          kSizedBoxH25,
          Center(
              child: CustomText(
            text: 'hint'.tr,
            fontWeight: FontWeight.normal,
            fontSize: 13.sp,
          )),
          kSizedBoxH25,

            CustomTextFormField(
                onChange: (a){
                  loginController.onChangePwdTextField(a);
                },
                controller: loginController.phoneController,
                hintText: 'enter_ph'.tr,
                isValidate: false),

          kSizedBoxH25,
          Obx(
            () => CustomTextFormField(
                obscureText: loginController.isObscure.value,
                onChange: (a){
                  loginController.onChangeTextField(a);
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      loginController.setVisibleOnOff();
                    },
                    icon: Icon(loginController.isObscure.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility)),
                controller: loginController.passwordController,
                hintText: 'enter_pwd'.tr,
                isValidate: false),
          ),
          kSizedBoxH25,
          Obx(
            () => loginController.isLoginLoading.value
                ? Center(child: CustomLoading())
                : IgnorePointer(
                    ignoring: loginController.isPwdTextEmpty.value ||
                        loginController.isTextEmpty.value,
                    child: Obx(()=>
                       CustomButton(
                          bgColor: (loginController.isChecked.value == false)||loginController.isPwdTextEmpty.value || (loginController.isTextEmpty.value)
                              ? secondaryColor.withOpacity(0.5)
                              : secondaryColor,
                          text: 'sign_in'.tr,
                          onTap: () {
                            if (loginController.isChecked.value == true

                                &&loginController
                                    .phoneController.text.isNotEmpty&&
                                loginController
                                    .passwordController.text.isNotEmpty) {
                              loginController.doLogin(
                                  loginController.phoneController.text,
                                  loginController.passwordController.text);
                            }else if(loginController.isChecked.value == false ){
                              Get.snackbar('Warning', 'please_accept'.tr);
                            }
                            else{
                              Get.snackbar("Warning !", "You missed some field");
                            }
                          }),
                    ),
                  ),
          ),
          kSizedBoxH25,
          Row(
            children: [
              Obx(() => IconButton(
                  onPressed: () {
                    loginController.setCheck();
                  },
                  icon: Icon(loginController.isChecked.value
                      ? Icons.check_box
                      : Icons.check_box_outline_blank))),
              InkWell(
                  onTap: () {
                    Get.to(PrivacyPolicyScreen());
                  },
                  child: CustomText(
                    text: 'accept_t_and_c'.tr,
                    fontSize: 12.sp,
                    color: secondaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

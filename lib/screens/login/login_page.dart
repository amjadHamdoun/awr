import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/customColors/my_colors.dart';
import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/mixins/base_mixin.dart';
import '../../injection.dart';
import '../home/home_page.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseMixin {
  late LoginBloc bloc;

  final userController = TextEditingController();
  final pwdController = TextEditingController();

  bool _obscured = true;

  @override
  void initState() {
    bloc = sl<LoginBloc>();
    super.initState();
  }

  void _toggleObscured() {
      _obscured = !_obscured;
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) async {
        if (state.isSuccess!) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (state.error!.isNotEmpty) {
          showInSnackBar(
            context,
            state.error!,
          );

          //No Api Now
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          title: Text(
            "Login".tr(),
            style: TextStyle(
                fontSize: StyleConstants.fontSize.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.white),
          ),
        ),
        body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.isLoading!) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: <Widget>[
                  SizedBox(height: 15.h),
                  Expanded(
                      child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(height: 25.h),
                      Image.asset(
                        'assets/images/awr_logo.jpg',
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back'.tr(),
                            style: TextStyle(
                                fontSize: StyleConstants.fontSize.sp,
                                color: MyColors.textColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      TextFormFieldWidget(
                        hintText: "Email".tr(),
                        controller: userController,
                        isDense: true,
                        focusBorderColor: Theme.of(context).primaryColor,
                      ),
                      TextFormFieldWidget(
                        hintText: "Password".tr(),
                        isPassword: _obscured,
                        toggleObscured: _toggleObscured,
                        suffix: true,
                        controller: pwdController,
                        focusBorderColor: Theme.of(context).primaryColor,
                        isDense: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: ElevatedButtonWidget(
                          onPressed: () {
                            if (userController.text.isNotEmpty &&
                                pwdController.text.isNotEmpty) {
                              bloc.add(LoginEventSubmit(obj: {
                                "email": userController.text,
                                "password": pwdController.text
                              }));
                            } else {
                              showInSnackBar(
                                context,
                                "Fill All Field".tr(),
                              );
                            }
                          },
                          text: "Login".tr(),
                          textColor: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           const ForgotPasswordPage(),
                              //     ));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(3.0.r),
                              child: Text(
                                'Forgot Password?'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: (StyleConstants.fontSize - 2).sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account?'.tr(),
                                  style: TextStyle(
                                    fontSize: (StyleConstants.fontSize - 2).sp,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => SignUpPage(),
                                      //     ));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.0.r),
                                      child: Text(
                                        'SIGN UP'.tr(),
                                        style: TextStyle(
                                            fontSize:
                                                (StyleConstants.fontSize - 2)
                                                    .sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  )),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

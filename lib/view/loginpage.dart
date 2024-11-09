import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import '../bloc/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff344154),
                size: 12.5,
                weight: 1.6,
              ),
              onPressed: () {
                context.go('/');
              }),
          title: const Text("تسجيل الدخول"),
          leadingWidth: 40,
          titleTextStyle: const TextStyle(
              height: 1.667,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: "Ping AR + LT",
              color: Color(0xff344154)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                    const Text(
                      "مرحباً بعودتك!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.222,
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                          fontFamily: "Ping AR + LT",
                          color: Color(0xff151D29)),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(80.0, 10, 80.0, 20),
                      child: Text(
                        "قم بتسجيل الدخول عن طريق البريد الالكتروني وكلمة المرور",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.429,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: "Ping AR + LT",
                            color: Color(0xff99A2B3)),
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Text(
                            "البريد الالكتروني ",
                            style: TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: "Ping AR + LT",
                                color: Color(0xff344154)),
                          ),
                          Text(
                              state.isEmailValid || state.isEmailEmpty
                                  ? ''
                                  : "(البريد الالكتروني غير صحيح)",
                              style: const TextStyle(
                                color: Color(0xffF40105),
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Ping AR + LT",
                              )),
                        ],
                      ),
                      subtitle: TextFormField(
                        onChanged: (email) {
                          context.read<LoginCubit>().emailChanged(email);
                        },
                        style: const TextStyle(
                          color: Color(0xff151D29),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Ping AR + LT",
                        ),
                        obscureText: state.emailVisible,
                        cursorColor: state.isEmailValid
                            ? const Color(0xffFD6F91)
                            : const Color(0xffFC1055),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isEmailEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isEmailValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isEmailEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isEmailValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isEmailEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isEmailValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          filled: true,
                          fillColor: state.isEmailEmpty
                              ? const Color(0xfff7f7f7)
                              : Colors.white,
                          hintText: "البريد الالكتروني",
                          hintStyle: const TextStyle(
                            color: Color(0xff667185),
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "Ping AR + LT",
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.emailVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff667185),
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().toggleEmailVisible();
                            },
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Text(
                            "كلمة المرور ",
                            style: TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: "Ping AR + LT",
                                color: Color(0xff344154)),
                          ),
                          Text(
                              state.isPasswordValid || state.isPasswordEmpty
                                  ? ''
                                  : "(كلمة المرور غير صحيحة)",
                              style: const TextStyle(
                                color: Color(0xffF40105),
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Ping AR + LT",
                              )),
                        ],
                      ),
                      subtitle: TextFormField(
                        onChanged: (password) {
                          context.read<LoginCubit>().passwordChanged(password);
                        },
                        style: const TextStyle(
                          color: Color(0xff151D29),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Ping AR + LT",
                        ),
                        obscureText: state.passwordVisible,
                        cursorColor: state.isPasswordValid
                            ? const Color(0xffFD6F91)
                            : const Color(0xffFC1055),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isPasswordEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isPasswordValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isPasswordEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isPasswordValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.isPasswordEmpty
                                  ? const Color(0xfff7f7f7)
                                  : state.isPasswordValid
                                      ? const Color(0xffA1AAB9)
                                      : const Color(0xffF40105),
                            ),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Color(0xff667185),
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "Ping AR + LT",
                          ),
                          fillColor: state.isPasswordEmpty
                              ? const Color(0xfff7f7f7)
                              : Colors.white,
                          hintText: "كلمة المرور",
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff667185),
                            ),
                            onPressed: () {
                              context
                                  .read<LoginCubit>()
                                  .togglePasswordVisible();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 18.0, 8),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: FlutterSwitch(
                                  toggleSize: 16,
                                  height: 24,
                                  width: 44,
                                  padding: 4,
                                  activeColor: const Color(0xff00DE82),
                                  inactiveColor: const Color(0xffA1AAB9),
                                  inactiveToggleColor: Colors.white,
                                  value: state.rememberMe,
                                  onToggle: (_) {
                                    context
                                        .read<LoginCubit>()
                                        .toggleRememberMe();
                                  },
                                ),
                              ),
                              const Text(
                                "  تذكرني",
                                style: TextStyle(
                                  color: Color(0xff344154),
                                  height: 1.429,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: "Ping AR + LT",
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0, 0, 0),
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                color: Color(0xffFC1055),
                                height: 1.667,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Ping AR + LT",
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xffFC1055),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ListTile(
                      subtitle: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: const Color(0xffFC1055),
                          disabledBackgroundColor: state.isLoading
                              ? const Color(0xffFC1055)
                              : const Color(0xff99A2B3),
                        ),
                        onPressed: state.isLoading ||
                                !state.isEmailValid ||
                                !state.isPasswordValid
                            ? null
                            : () {
                                context.read<LoginCubit>().loginRequested();
                              },
                        child: state.isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.0),
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0xffFFFFFF),
                                  // color: const Color(0xffFC1055),
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: "Ping AR + LT",
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                          color: Color(0xff344154),
                          height: 1.429,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: "Ping AR + LT",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.go('/signupPage');
                        },
                        child: const Text(
                          "قم بإنشاء حساب جديد",
                          style: TextStyle(
                            letterSpacing: 0.02,
                            color: Color(0xffFD6F91),
                            height: 2.0,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: "Ping AR + LT",
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffFD6F91),
                          ),
                        ),
                      )
                    ]),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

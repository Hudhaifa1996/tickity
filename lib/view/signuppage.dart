import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/signup_cubit.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
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
                context.go('/loginPage');
              }),
          title: const Text("انشاء حساب جديد"),
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
            child: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                    const Text(
                      "قم بإنشاء حساب جديد",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.25,
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          fontFamily: "Ping AR + LT",
                          color: Color(0xff151D29)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                          context.read<SignupCubit>().emailChanged(email);
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
                              context.read<SignupCubit>().toggleEmailVisible();
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
                          context.read<SignupCubit>().passwordChanged(password);
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
                                  .read<SignupCubit>()
                                  .togglePasswordVisible();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ListTile(
                      subtitle: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: const Color(0xffFC1055),
                        ),
                        onPressed: !state.isEmailValid || !state.isPasswordValid
                            ? null
                            : () {
                                context.go('/signupPage2');
                              },
                        child: const Padding(
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 16,
                            endIndent: 4,
                            thickness: 1.6,
                            height: 35.0,
                            color: Color(0xffE2E5E9),
                          ),
                        ),
                        Text('او عن طريق'),
                        Expanded(
                          child: Divider(
                            indent: 4,
                            endIndent: 24,
                            thickness: 1.6,
                            height: 35.0,
                            color: Color(0xffE2E5E9),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      subtitle: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: const Color(0xffF4F7FE),
                        ),
                        onPressed: () {
                          context.read<SignupCubit>().googleLoginRequested();
                        },
                        child: state.isLoadingGoogle
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.0),
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0xffFFFFFF),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/googleimage.png'),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const Text(
                                      "  عن طريق جوجل",
                                      style: TextStyle(
                                        color: Color(0xff485568),
                                        height: 1.429,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: "Ping AR + LT",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    ListTile(
                      subtitle: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.facebook,
                          size: 20.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: const Color(0xffF4F7FE),
                        ),
                        onPressed: () {
                          context.read<SignupCubit>().faceBookLoginRequested();
                        },
                        label: state.isLoadingFacebook
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.0),
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0xffFFFFFF),
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  "عن طريق فايسبوك",
                                  style: TextStyle(
                                    color: Color(0xff485568),
                                    height: 1.429,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    fontFamily: "Ping AR + LT",
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "لديك حساب بالفعل؟ ",
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
                          context.go('/loginPage');
                        },
                        child: const Text(
                          "قم بالدخول الى حسابك",
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/signup_cubit.dart';

class SignupPage2 extends StatelessWidget {
  const SignupPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              state.governoratesNames.isEmpty
                  ? context.read<SignupCubit>().governoratesRequested()
                  : null;
              state.districtsNames.isEmpty
                  ? context.read<SignupCubit>().districtsRequested()
                  : null;
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  const Text(
                    "انشاء حساب جديد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        fontFamily: "Ping AR + LT",
                        color: Color(0xff151D29)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  const Text(
                    "رجاءاً قم بملأ المعلومات المطلوبة لتسجيل حسابك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.75,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: "Ping AR + LT",
                        color: Color(0xff667185)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ListTile(
                    title: const Text(
                      "الاسم الثلاثي",
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          fontFamily: "Ping AR + LT",
                          color: Color(0xff344154)),
                    ),
                    subtitle: TextFormField(
                      onChanged: (name) {
                        context.read<SignupCubit>().nameChanged(name);
                      },
                      style: const TextStyle(
                        color: Color(0xff151D29),
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Ping AR + LT",
                      ),
                      cursorColor: const Color(0xffFD6F91),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: state.isNameEmpty
                                ? const Color(0xfff7f7f7)
                                : const Color(0xffA1AAB9),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: state.isNameEmpty
                                ? const Color(0xfff7f7f7)
                                : const Color(0xffA1AAB9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: state.isNameEmpty
                                ? const Color(0xfff7f7f7)
                                : const Color(0xffA1AAB9),
                          ),
                        ),
                        filled: true,
                        fillColor: state.isNameEmpty
                            ? const Color(0xfff7f7f7)
                            : Colors.white,
                        hintText: "مثلاً: محمد جبار حسن",
                        hintStyle: const TextStyle(
                          color: Color(0xff667185),
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: "Ping AR + LT",
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                      title: const Text(
                        "المحافظة",
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: "Ping AR + LT",
                            color: Color(0xff344154)),
                      ),
                      subtitle: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.governorateValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.governorateValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.governorateValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          filled: true,
                          fillColor: state.governorateValue == null
                              ? const Color(0xfff7f7f7)
                              : Colors.white,
                        ),
                        value: state.governorateValue,
                        hint: const Text('اختر المحافظة',
                            style: TextStyle(
                              color: Color(0xff667185),
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: "Ping AR + LT",
                            )),
                        style: const TextStyle(
                          color: Color(0xff151D29),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Ping AR + LT",
                        ),
                        items: state.governoratesNames.map((governorate) {
                          return DropdownMenuItem<String>(
                            value: governorate['id']!.toString(),
                            child: SizedBox(
                                height: 60,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(governorate['name']))),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          context
                              .read<SignupCubit>()
                              .governoratesSelected(newValue!);
                        },
                        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                        isExpanded: true,
                      )),
                  ListTile(
                      title: const Text(
                        "المنطقة",
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: "Ping AR + LT",
                            color: Color(0xff344154)),
                      ),
                      subtitle: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.districtValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.districtValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: state.districtValue == null
                                  ? const Color(0xfff7f7f7)
                                  : const Color(0xffA1AAB9),
                            ),
                          ),
                          filled: true,
                          fillColor: state.districtValue == null
                              ? const Color(0xfff7f7f7)
                              : Colors.white,
                        ),
                        value: state.districtValue,
                        hint: const Text('اختر المنطقة',
                            style: TextStyle(
                              color: Color(0xff667185),
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: "Ping AR + LT",
                            )),
                        style: const TextStyle(
                          color: Color(0xff151D29),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Ping AR + LT",
                        ),
                        items: state.districtsNames.map((district) {
                          return DropdownMenuItem<String>(
                            value: district['id']!.toString(),
                            child: SizedBox(
                                height: 60,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(district['name']))),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          context
                              .read<SignupCubit>()
                              .districtsSelected(newValue!);
                        },
                        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                        isExpanded: true,
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                              state.governorateValue == null ||
                              state.districtValue == null ||
                              state.name.isEmpty
                          ? null
                          : () {
                              context.read<SignupCubit>().registerRequested();
                              context.go("/home");
                            },
                      child: state.isLoading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                              child: CircularProgressIndicator(
                                backgroundColor: Color(0xffFFFFFF),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "انشاء حساب",
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

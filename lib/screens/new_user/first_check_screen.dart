import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_part1/cubits/login/login_cubit.dart';

import '../../cubits/login/login_model_state.dart';

class FirstCheckScreen extends StatefulWidget {
  const FirstCheckScreen({super.key});

  @override
  State<FirstCheckScreen> createState() => _FirstCheckScreenState();
}

class _FirstCheckScreenState extends State<FirstCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginCubit, LoginModel>(
      builder: (BuildContext context, state) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 100, blurRadius: 100, color: Colors.white)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.7),
                        Colors.black.withOpacity(.85),
                        Colors.black.withOpacity(.9),
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
              child: Column(
                children: [
                  const Text(
                    "Create Your Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 190,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(.4))
                            ],
                            color: state.firstText.isNotEmpty
                                ? Colors.orange
                                : Colors.white,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(.4))
                            ],
                            color: state.firstText.length >= 2
                                ? Colors.orange
                                : Colors.white,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(.4))
                            ],
                            color: state.firstText.length >= 3
                                ? Colors.orange
                                : Colors.white,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(.4))
                            ],
                            color: state.firstText.length >= 4
                                ? Colors.orange
                                : Colors.white,
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      ...List.generate(
                        11,
                        (index) => Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 13, top: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                if (index == 9) {
                                  context
                                      .read<LoginCubit>()
                                      .addFirstSymbol((0).toString(), context);
                                } else if (index == 10) {
                                  context
                                      .read<LoginCubit>()
                                      .removeSymbolFirst();
                                } else {
                                  context.read<LoginCubit>().addFirstSymbol(
                                      (index + 1).toString(), context);
                                }
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.3),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: index != 10
                                        ? Text(
                                            index != 9 ? "${index + 1}" : "0",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white),
                                          )
                                        : const Icon(
                                            Icons.backspace,
                                            color: Colors.white,
                                          )),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}

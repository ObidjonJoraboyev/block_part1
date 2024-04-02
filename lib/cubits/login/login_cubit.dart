import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_part1/data/local/storage_repository.dart';
import 'package:block_part1/screens/new_user/second_check_screen.dart';
import 'package:block_part1/screens/old_users/countries_screen.dart';

import 'login_model_state.dart';

class LoginCubit extends Cubit<LoginModel> {
  LoginCubit()
      : super(LoginModel(firstText: "", secondText: "", oldUserText: ""));

  addFirstSymbol(String symbol, BuildContext context) {
    if (state.firstText.length < 4) {
      emit(state.copyWith(firstText: state.firstText + symbol));
    }
    if (state.firstText.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SecondCheckScreen(
              password: state.firstText,
            );
          },
        ),
      );
    }
  }

  addSecondSymbol(String symbol, BuildContext context) {
    if (state.secondText.length < 4) {
      emit(state.copyWith(secondText: state.secondText + symbol));
    }
    if (state.secondText == state.firstText) {
      StorageRepository.setString(key: "password", values: state.secondText);
      StorageRepository.setBool(key: "isOld", value: true);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Saved Password")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            emit(state.copyWith(secondText: ""));
            return const HomeScreen();
          },
        ),
      );
    }
    if (state.secondText != state.firstText && state.secondText.length == 4) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Password")));
    }
  }

  isTruePassword(String symbol, BuildContext context) {
    String savedPassword = StorageRepository.getString(key: "password");
    if (state.oldUserText.length < 4) {
      emit(state.copyWith(oldUserText: state.oldUserText + symbol));
    }
    if (state.oldUserText == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            emit(state.copyWith(oldUserText: ""));
            return const HomeScreen();
          },
        ),
      );
    }

    if (state.oldUserText != savedPassword && state.oldUserText.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Password"),
        ),
      );
      emit(state.copyWith(oldUserText: ""));
    }
  }

  removeSymbolFirst() {
    if (state.firstText.isNotEmpty) {
      emit(state.copyWith(
          firstText: state.firstText.substring(0, state.firstText.length - 1)));
    }
    emit(state);
  }

  removeSymbolSecond() {
    if (state.secondText.isNotEmpty) {
      emit(state.copyWith(
          secondText:
              state.secondText.substring(0, state.secondText.length - 1)));
    }
    emit(state);
  }

  removeSymbolLogin() {
    if (state.oldUserText.isNotEmpty) {
      emit(state.copyWith(
          oldUserText:
              state.oldUserText.substring(0, state.oldUserText.length - 1)));
    }
    emit(state);
  }
}

import 'package:block_part1/screens/old_users/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/countries/countries_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'data/local/storage_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountriesCubit()..fetchData()),
        BlocProvider(create: (_) => LoginCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

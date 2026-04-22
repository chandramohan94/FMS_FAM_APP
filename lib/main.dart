import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'modules/login/cubit/login_cubit.dart';
import 'modules/login/data/login_repository.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(LoginRepository())),
      ],
      child: const MyApp(),
    ),
  );
}
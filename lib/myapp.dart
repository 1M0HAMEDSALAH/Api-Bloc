import 'package:apibloc/bloc/character_event.dart';
import 'package:apibloc/screens/home_screen.dart';
import 'package:apibloc/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/character_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            CharacterBloc(ApiService())..add(FetchCharactersEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}

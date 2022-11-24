import 'package:breaking_project/business_logic/cubit/character_cubit.dart';
import 'package:breaking_project/data/repo/character_repo.dart';
import 'package:breaking_project/data/web_services/charcter_service.dart';
import 'package:breaking_project/presintation/screens/charcter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepo = CharacterRepo(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => characterCubit,
            child: CharcterScreen(),
          ),
        );
    }
  }
}

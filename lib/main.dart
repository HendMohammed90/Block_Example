import 'package:breaking_project/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp(
    router: AppRouter(),
  ));
}

class MovieApp extends StatelessWidget {
  final AppRouter router;
  const MovieApp({Key? key, required this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}

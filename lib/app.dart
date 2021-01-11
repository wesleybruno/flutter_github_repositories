import 'package:flutter/material.dart';
import 'package:github_repositories/app/screens/home_screen.dart';
import 'package:github_repositories/ui/Fontes.dart';

class GitHubRepositoriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fontes.montserrat,
      ),
      home: Scaffold(
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

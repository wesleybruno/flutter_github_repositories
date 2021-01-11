import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_repositories/app.dart';
import 'package:github_repositories/injection_container.dart' as injection;
import 'package:github_repositories/ui/Cores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(GitHubRepositoriesApp());
}

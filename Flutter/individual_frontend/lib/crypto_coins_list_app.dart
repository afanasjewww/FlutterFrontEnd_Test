import 'package:flutter/material.dart';

import 'package:individual_frontend/router/router.dart';
import 'package:individual_frontend/theme/theme.dart';

class FrontendApp extends StatelessWidget {
  const FrontendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}

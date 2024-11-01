import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsat_gpt/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            title: 'Samsat GPT',
            debugShowCheckedModeBanner: false,
            theme: themeDataLight,
            darkTheme: themeDataDark,
            themeMode: state.themeMode,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: const [
              Locale('id', 'ID'),
            ],
          );
        },
      ),
    );
  }
}

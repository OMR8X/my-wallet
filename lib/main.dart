import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/presentation/expense_history/state/cubit/expense_cubit.dart';
import 'package:my_wallet/presentation/home/state/home/home_cubit.dart';
import 'package:my_wallet/presentation/home/view/home_view.dart';
import 'package:my_wallet/presentation/income_history/state/cubit/income_cubit.dart';

import 'core/helpers/styles/sizes_h.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyWallet());
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => IncomeCubit()),
          BlocProvider(create: (context) => ExpenseCubit()),
        ],
        child: MaterialApp(
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          locale: const Locale("ar"),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locales, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locales != null &&
                  locales.languageCode == locale.languageCode) {
                return locales;
              }
            }
            return null;
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            highlightColor: ColorsHelper.borders,
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: ColorsHelper.background,
            appBarTheme: const AppBarTheme(
              centerTitle: false,
              titleTextStyle: FontsStylesHelper.appBar,
              backgroundColor: ColorsHelper.background,
              elevation: 0.0,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: ColorsHelper.borders,
              foregroundColor: ColorsHelper.text1,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(SizesHelper.mainTileWidth(context), 40),
                backgroundColor: ColorsHelper.borders,
                shape: const StadiumBorder(),
              ),
            ),
          ),
          home: const HomeView(),
        ));
  }
}

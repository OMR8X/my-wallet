import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/presentation/home/state/home/home_cubit.dart';
import 'package:my_wallet/presentation/home/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyWallet());
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
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
            scaffoldBackgroundColor: ColorsHelper.background,
            appBarTheme: const AppBarTheme(
              centerTitle: false,
              titleTextStyle: FontsStylesHelper.textStyle18,
              backgroundColor: ColorsHelper.background,
              elevation: 0.0,
            ),
            // focusColor: ColorsHelper.borders,
            // splashColor: ColorsHelper.borders,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: ColorsHelper.borders,
              foregroundColor: ColorsHelper.text1,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(SizesHelper.mainTileWidth(context), 50),
                backgroundColor: ColorsHelper.borders,
                shape: const StadiumBorder(),
              ),
            ),
          ),
          home: const HomeView(),
        ));
  }
}

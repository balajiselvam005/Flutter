import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_tracker.dart';
//import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 42, 150, 238),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 1, 54, 98),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ],
  // ).then((fn){111121
  runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: kDarkColorScheme.secondaryContainer,
          surfaceTintColor: kDarkColorScheme.secondaryContainer,
          shadowColor: kDarkColorScheme.secondary,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 18,
              ),
              titleSmall: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
        dropdownMenuTheme: const DropdownMenuThemeData(
          textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.dark,
      home: const ExpenseTracker(),
    );
  }
}

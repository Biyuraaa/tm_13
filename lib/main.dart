import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_13/counter.dart';
import 'package:tm_13/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            home: const CounterPage(),
          );
        },
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Theme Toggle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final counterCubit = context.read<CounterCubit>();
          counterCubit.increment();

          final isOdd = counterCubit.state % 2 != 0;
          context.read<ThemeCubit>().toggleTheme(isOdd);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


// Implementasi Multi Bloc Provider
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'theme_cubit.dart';
// import 'counter_cubit.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ThemeCubit>(
//           create: (context) => ThemeCubit(),
//         ),
//         BlocProvider<CounterCubit>(
//           create: (context) => CounterCubit(),
//         ),
//       ],
//       child: BlocBuilder<ThemeCubit, ThemeData>(
//         builder: (context, theme) {
//           return MaterialApp(
//             theme: theme,
//             home: HomeScreen(),
//           );
//         },
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final themeCubit = context.read<ThemeCubit>();
//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter Theme Switcher')),
//       body: Center(child: Text('Press the button to toggle theme')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: themeCubit.toggleTheme,
//         child: Icon(Icons.brightness_6),
//       ),
//     );
//   }
// }

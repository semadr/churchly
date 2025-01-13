import 'package:churchly/src/churchly/presentation/bloc/church_finance/church_finance_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/churchly/presentation/screens/homepage.dart';
// import 'package:churchly/src/churchly/presentation/screens/responsive/finance_view.dart';
import 'package:churchly/src/churchly/presentation/screens/routes/d_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChurchFinanceItemProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DRoutes().dInitialRoute,
      routes: Map.from(DRoutes().routes),
      title: 'Churchly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        fontFamily: 'DMSans',
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) => ChurchInfoBloc())),
          BlocProvider(create: ((context) => ChurchLoginBloc())),
          BlocProvider(create: ((context) => ChurchFinanceBloc()))
        ],
        child: const Wrapper(),
        // child: const FinanceView(accountId: 'AGid'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'di/injection_container.dart';
import 'presentation/cubits/portfolio/portfolio_cubit.dart';
import 'presentation/cubits/item_detail/item_detail_cubit.dart';
import 'presentation/pages/portfolio_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final InjectionContainer _di;
  late final PortfolioCubit _portfolioCubit;
  late final ItemDetailCubit _itemDetailCubit;

  @override
  void initState() {
    super.initState();
    _di = InjectionContainer();
    _portfolioCubit = _di.portfolioCubit..loadPortfolio();
    _itemDetailCubit = _di.itemDetailCubit;
  }

  @override
  void dispose() {
    _portfolioCubit.close();
    _itemDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _portfolioCubit),
        BlocProvider.value(value: _itemDetailCubit),
      ],
      child: MaterialApp(
        title: 'Portfólio de Materiais | Trino Pagamentos',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const PortfolioPage(),
      ),
    );
  }
}

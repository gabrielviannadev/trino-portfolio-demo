import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_portfolio_items.dart';
import '../../../domain/usecases/get_kits.dart';
import '../../../domain/usecases/get_footer_data.dart';
import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final GetPortfolioItems _getPortfolioItems;
  final GetKits _getKits;
  final GetFooterData _getFooterData;

  PortfolioCubit({
    required GetPortfolioItems getPortfolioItems,
    required GetKits getKits,
    required GetFooterData getFooterData,
  })  : _getPortfolioItems = getPortfolioItems,
        _getKits = getKits,
        _getFooterData = getFooterData,
        super(const PortfolioInitial());

  Future<void> loadPortfolio() async {
    emit(const PortfolioLoading());

    try {
      final results = await Future.wait([
        _getPortfolioItems(),
        _getKits(),
        _getFooterData(),
      ]);

      emit(PortfolioLoaded(
        items: results[0] as dynamic,
        kits: results[1] as dynamic,
        footerData: results[2] as dynamic,
      ));
    } catch (e) {
      emit(PortfolioError('Falha ao carregar portfólio: $e'));
    }
  }
}

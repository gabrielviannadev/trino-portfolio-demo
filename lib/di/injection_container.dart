import '../data/datasources/mock_portfolio_datasource.dart';
import '../data/repositories/portfolio_repository_impl.dart';
import '../domain/repositories/portfolio_repository.dart';
import '../domain/usecases/get_portfolio_items.dart';
import '../domain/usecases/get_kits.dart';
import '../domain/usecases/get_footer_data.dart';
import '../presentation/cubits/portfolio/portfolio_cubit.dart';
import '../presentation/cubits/item_detail/item_detail_cubit.dart';

class InjectionContainer {
  late final MockPortfolioDatasource _datasource;
  late final PortfolioRepository _repository;
  late final GetPortfolioItems _getPortfolioItems;
  late final GetKits _getKits;
  late final GetFooterData _getFooterData;

  InjectionContainer() {
    _datasource = MockPortfolioDatasource();
    _repository = PortfolioRepositoryImpl(_datasource);
    _getPortfolioItems = GetPortfolioItems(_repository);
    _getKits = GetKits(_repository);
    _getFooterData = GetFooterData(_repository);
  }

  PortfolioCubit get portfolioCubit => PortfolioCubit(
        getPortfolioItems: _getPortfolioItems,
        getKits: _getKits,
        getFooterData: _getFooterData,
      );

  ItemDetailCubit get itemDetailCubit => ItemDetailCubit();
}

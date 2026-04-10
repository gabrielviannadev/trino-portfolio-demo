import '../../domain/entities/portfolio_item.dart';
import '../../domain/entities/kit.dart';
import '../../domain/entities/footer_link.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/mock_portfolio_datasource.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final MockPortfolioDatasource _datasource;

  const PortfolioRepositoryImpl(this._datasource);

  @override
  Future<List<PortfolioItem>> getItems() => _datasource.fetchItems();

  @override
  Future<List<Kit>> getKits() => _datasource.fetchKits();

  @override
  Future<FooterData> getFooterData() => _datasource.fetchFooterData();
}

import '../entities/portfolio_item.dart';
import '../entities/kit.dart';
import '../entities/footer_link.dart';

abstract class PortfolioRepository {
  Future<List<PortfolioItem>> getItems();
  Future<List<Kit>> getKits();
  Future<FooterData> getFooterData();
}

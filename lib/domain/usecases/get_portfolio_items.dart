import '../entities/portfolio_item.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolioItems {
  final PortfolioRepository _repository;

  const GetPortfolioItems(this._repository);

  Future<List<PortfolioItem>> call() => _repository.getItems();
}

import '../entities/kit.dart';
import '../repositories/portfolio_repository.dart';

class GetKits {
  final PortfolioRepository _repository;

  const GetKits(this._repository);

  Future<List<Kit>> call() => _repository.getKits();
}

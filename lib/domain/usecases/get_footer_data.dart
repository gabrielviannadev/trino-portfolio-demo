import '../entities/footer_link.dart';
import '../repositories/portfolio_repository.dart';

class GetFooterData {
  final PortfolioRepository _repository;

  const GetFooterData(this._repository);

  Future<FooterData> call() => _repository.getFooterData();
}

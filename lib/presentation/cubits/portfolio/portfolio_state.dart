import 'package:equatable/equatable.dart';

import '../../../domain/entities/portfolio_item.dart';
import '../../../domain/entities/kit.dart';
import '../../../domain/entities/footer_link.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

final class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

final class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

final class PortfolioLoaded extends PortfolioState {
  final List<PortfolioItem> items;
  final List<Kit> kits;
  final FooterData footerData;

  const PortfolioLoaded({
    required this.items,
    required this.kits,
    required this.footerData,
  });

  @override
  List<Object?> get props => [items, kits, footerData];
}

final class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError(this.message);

  @override
  List<Object?> get props => [message];
}

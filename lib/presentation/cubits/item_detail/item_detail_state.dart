import 'package:equatable/equatable.dart';

import '../../../domain/entities/portfolio_item.dart';

sealed class ItemDetailState extends Equatable {
  const ItemDetailState();

  @override
  List<Object?> get props => [];
}

final class ItemDetailClosed extends ItemDetailState {
  const ItemDetailClosed();
}

final class ItemDetailOpen extends ItemDetailState {
  final PortfolioItem item;
  final int currentImageIndex;

  const ItemDetailOpen({
    required this.item,
    this.currentImageIndex = 0,
  });

  @override
  List<Object?> get props => [item, currentImageIndex];
}

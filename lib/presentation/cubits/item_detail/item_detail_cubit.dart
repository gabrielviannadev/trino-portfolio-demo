import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/portfolio_item.dart';
import 'item_detail_state.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> {
  ItemDetailCubit() : super(const ItemDetailClosed());

  void openItem(PortfolioItem item) {
    emit(ItemDetailOpen(item: item));
  }

  void changeImage(int index) {
    final current = state;
    if (current is ItemDetailOpen) {
      emit(ItemDetailOpen(item: current.item, currentImageIndex: index));
    }
  }

  void closeDetail() {
    emit(const ItemDetailClosed());
  }
}

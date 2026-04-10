import 'package:equatable/equatable.dart';

class PortfolioItem extends Equatable {
  final String id;
  final String slug;
  final String name;
  final String? quantity;
  final String? description;
  final List<String> images;

  const PortfolioItem({
    required this.id,
    required this.slug,
    required this.name,
    this.quantity,
    this.description,
    this.images = const [],
  });

  bool get hasPhotos => images.isNotEmpty;

  @override
  List<Object?> get props => [id, slug, name, quantity, description, images];
}

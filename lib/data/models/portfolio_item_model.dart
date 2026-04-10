import '../../core/constants/app_assets.dart';
import '../../domain/entities/portfolio_item.dart';

class PortfolioItemModel extends PortfolioItem {
  const PortfolioItemModel({
    required super.id,
    required super.slug,
    required super.name,
    super.quantity,
    super.description,
    super.images,
  });

  factory PortfolioItemModel.fromJson(Map<String, dynamic> json) {
    final rawImages = json['images'] as List<dynamic>? ?? [];

    return PortfolioItemModel(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as String?,
      description: json['description'] as String?,
      images: rawImages
          .map((e) => AppAssets.resolveImage(e as String))
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'quantity': quantity,
        'description': description,
        'images': images,
      };
}

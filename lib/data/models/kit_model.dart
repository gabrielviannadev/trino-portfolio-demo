import '../../core/constants/app_assets.dart';
import '../../domain/entities/kit.dart';

class KitEntryModel extends KitEntry {
  const KitEntryModel({
    required super.label,
    super.itemSlug,
    super.thumbnailPath,
    super.isDiscontinued,
  });

  factory KitEntryModel.fromJson(Map<String, dynamic> json) {
    final rawThumb = json['thumbnail'] as String?;
    return KitEntryModel(
      label: json['label'] as String,
      itemSlug: json['item_slug'] as String?,
      thumbnailPath: rawThumb != null ? AppAssets.resolveImage(rawThumb) : null,
      isDiscontinued: json['discontinued'] as bool? ?? false,
    );
  }
}

class KitModel extends Kit {
  const KitModel({required super.title, required super.entries});

  factory KitModel.fromJson(Map<String, dynamic> json) {
    final entries = (json['entries'] as List<dynamic>)
        .map((e) => KitEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);

    return KitModel(title: json['title'] as String, entries: entries);
  }
}

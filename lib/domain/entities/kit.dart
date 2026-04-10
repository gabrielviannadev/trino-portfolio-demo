import 'package:equatable/equatable.dart';

class KitEntry extends Equatable {
  final String label;
  final String? itemSlug;
  final String? thumbnailPath;
  final bool isDiscontinued;

  const KitEntry({
    required this.label,
    this.itemSlug,
    this.thumbnailPath,
    this.isDiscontinued = false,
  });

  bool get isClickable => itemSlug != null;

  @override
  List<Object?> get props => [label, itemSlug, thumbnailPath, isDiscontinued];
}

class Kit extends Equatable {
  final String title;
  final List<KitEntry> entries;

  const Kit({required this.title, required this.entries});

  @override
  List<Object?> get props => [title, entries];
}

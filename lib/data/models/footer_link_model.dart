import '../../domain/entities/footer_link.dart';

class FooterLinkModel extends FooterLink {
  const FooterLinkModel({
    required super.label,
    required super.url,
    super.isExternal,
    super.isThin,
  });

  factory FooterLinkModel.fromJson(Map<String, dynamic> json) {
    return FooterLinkModel(
      label: json['label'] as String,
      url: json['url'] as String,
      isExternal: json['external'] as bool? ?? false,
      isThin: json['thin'] as bool? ?? false,
    );
  }
}

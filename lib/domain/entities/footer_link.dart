import 'package:equatable/equatable.dart';

class FooterLink extends Equatable {
  final String label;
  final String url;
  final bool isExternal;
  final bool isThin;

  const FooterLink({
    required this.label,
    required this.url,
    this.isExternal = false,
    this.isThin = false,
  });

  @override
  List<Object?> get props => [label, url, isExternal, isThin];
}

class FooterData extends Equatable {
  final List<FooterLink> navigationLinks;
  final List<FooterLink> complianceLinks;
  final List<FooterLink> socialLinks;
  final String legalText;
  final String copyright;
  final String cnpj;
  final String phone;
  final String email;
  final String address;

  const FooterData({
    required this.navigationLinks,
    required this.complianceLinks,
    required this.socialLinks,
    required this.legalText,
    required this.copyright,
    required this.cnpj,
    required this.phone,
    required this.email,
    required this.address,
  });

  @override
  List<Object?> get props => [
        navigationLinks,
        complianceLinks,
        socialLinks,
        legalText,
        copyright,
        cnpj,
        phone,
        email,
        address,
      ];
}

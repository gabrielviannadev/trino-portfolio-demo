import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../models/portfolio_item_model.dart';
import '../models/kit_model.dart';
import '../models/footer_link_model.dart';
import '../../domain/entities/footer_link.dart';

class MockPortfolioDatasource {
  static const _simulatedLatency = Duration(milliseconds: 600);

  List<PortfolioItemModel>? _cachedItems;

  Future<List<PortfolioItemModel>> fetchItems() async {
    await Future.delayed(_simulatedLatency);

    if (_cachedItems != null) return _cachedItems!;

    try {
      final jsonString = await rootBundle.loadString(AppAssets.portfolioItemsJson);
      final decoded = json.decode(jsonString) as List<dynamic>;
      _cachedItems = decoded
          .map((e) => PortfolioItemModel.fromJson(e as Map<String, dynamic>))
          .toList(growable: false);
    } catch (_) {
      _cachedItems = _fallbackItems();
    }

    return _cachedItems!;
  }

  Future<List<KitModel>> fetchKits() async {
    await Future.delayed(_simulatedLatency);
    return _mockKits;
  }

  Future<FooterData> fetchFooterData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockFooterData;
  }

  List<PortfolioItemModel> _fallbackItems() => const [
        PortfolioItemModel(
          id: 'wobbler', slug: 'wobbler', name: 'Wobbler',
          quantity: '20 unidades',
          description: 'Wobbler para prateleiras/caixas na rede credenciada.',
          images: ['assets/images/portfolio-wobbler1.png', 'assets/images/portfolio_wobbler2.jpeg'],
        ),
        PortfolioItemModel(
          id: 'placa-de-fachada', slug: 'placa-de-fachada', name: 'Placa de fachada',
          quantity: '220 unidades',
          description: 'Identificação externa do comércio credenciado.',
          images: ['assets/images/portfolio_placa-de-fachada1.png'],
        ),
        PortfolioItemModel(
          id: 'caneta-verde', slug: 'caneta-verde', name: 'Caneta verde',
          quantity: '2.300 unidades',
          description: 'Caneta institucional para uso e distribuição em campo.',
          images: ['assets/images/portfolio_canetas1.jpeg'],
        ),
      ];

  static const _mockKits = [
    KitModel(title: 'Kit do Servidor', entries: [
      KitEntryModel(label: 'Caneca', itemSlug: 'caneca', thumbnailPath: 'assets/images/portfolio_caneca1.jpeg'),
      KitEntryModel(label: 'Caneta', itemSlug: 'caneta-verde', thumbnailPath: 'assets/images/portfolio_canetas1.jpeg'),
      KitEntryModel(label: 'Chaveiro abridor', itemSlug: 'chaveiro-abridor', thumbnailPath: 'assets/images/portfolio_chaveiro-abridor1.jpeg'),
      KitEntryModel(label: 'Folder servidor', itemSlug: 'folder-servidor-modelo-antigo', thumbnailPath: 'assets/images/portfolio_folder-servidor.png'),
      KitEntryModel(label: 'Sacola preta', itemSlug: 'sacola-preta-plastico', thumbnailPath: 'assets/images/portfolio_sacola-preta1.jpeg'),
    ]),
    KitModel(title: 'Kit do PDV', entries: [
      KitEntryModel(label: 'Placa de fachada', itemSlug: 'placa-de-fachada', thumbnailPath: 'assets/images/portfolio_placa-de-fachada1.png'),
      KitEntryModel(label: 'Adesivo grande na fachada', itemSlug: 'adesivo-estabelecimento-grande', thumbnailPath: 'assets/images/portfolio_adesivo-estabelecimento-credenciado-pdv-grande-e-pequeno.jpeg'),
      KitEntryModel(label: 'Adesivo pequeno na fachada ou no interior da loja', itemSlug: 'adesivo-estabelecimento-pequeno', thumbnailPath: 'assets/images/portfolio_adesivo-estabelecimento-credenciado-pdv-grande-e-pequeno.jpeg'),
      KitEntryModel(label: 'Adesivo QR Code', itemSlug: 'adesivo-para-qr-code', thumbnailPath: 'assets/images/portfolio_adesivo-estabelecimento-credenciado-pdv-caixa1.jpeg'),
      KitEntryModel(label: 'Wobbler', itemSlug: 'wobbler', thumbnailPath: 'assets/images/portfolio-wobbler1.png'),
      KitEntryModel(label: 'Folder para comércio (institucional)', itemSlug: 'folder-comercio-modelo-antigo', thumbnailPath: 'assets/images/portfolio_folder-comercio.png'),
      KitEntryModel(label: 'Chaveiro abridor', itemSlug: 'chaveiro-abridor', thumbnailPath: 'assets/images/portfolio_chaveiro-abridor1.jpeg'),
      KitEntryModel(label: 'Caneta', itemSlug: 'caneta-verde', thumbnailPath: 'assets/images/portfolio_canetas1.jpeg'),
      KitEntryModel(label: 'Squeeze (descontinuado)', isDiscontinued: true),
      KitEntryModel(label: 'Sacola de TNT', itemSlug: 'sacola-verde-tnt', thumbnailPath: 'assets/images/portfolio_sacola-de-tnt.jpeg'),
    ]),
    KitModel(title: 'Kit do Prefeito e Influenciadores', entries: [
      KitEntryModel(label: 'Pasta executiva'),
      KitEntryModel(label: 'Caneta touch preta'),
      KitEntryModel(label: 'Chaveiro abridor', itemSlug: 'chaveiro-abridor', thumbnailPath: 'assets/images/portfolio_chaveiro-abridor1.jpeg'),
      KitEntryModel(label: 'Squeeze (descontinuado - apenas influenciadores)', isDiscontinued: true),
      KitEntryModel(label: 'Caneca (apenas influenciadores)', itemSlug: 'caneca', thumbnailPath: 'assets/images/portfolio_caneca1.jpeg'),
      KitEntryModel(label: 'Sacola de TNT', itemSlug: 'sacola-verde-tnt', thumbnailPath: 'assets/images/portfolio_sacola-de-tnt.jpeg'),
    ]),
  ];

  static final _mockFooterData = FooterData(
    navigationLinks: const [
      FooterLinkModel(label: 'Como funciona', url: 'https://trinopagamentos.com/#como-funciona'),
      FooterLinkModel(label: 'Soluções', url: 'https://trinopagamentos.com/#solucoes'),
      FooterLinkModel(label: 'Quem somos', url: 'https://trinopagamentos.com/#quem-somos'),
      FooterLinkModel(label: 'Faça parte', url: 'https://trinopagamentos.com/#faca-parte'),
      FooterLinkModel(label: 'Blog', url: 'https://blog.trinopagamentos.com', isExternal: true),
    ],
    complianceLinks: const [
      FooterLinkModel(label: 'Compliance e Regulatório', url: 'https://compliance.trinopagamentos.com/', isThin: true),
      FooterLinkModel(label: 'Central de Ajuda', url: 'https://ajuda.trinopagamentos.com/', isThin: true),
      FooterLinkModel(label: 'Dados Abertos', url: 'https://dadosabertos.trinopagamentos.com/', isThin: true),
    ],
    socialLinks: const [
      FooterLinkModel(label: 'Instagram', url: 'https://www.instagram.com/trinopagamentos', isExternal: true),
      FooterLinkModel(label: 'LinkedIn', url: 'https://www.linkedin.com/company/trinopagamentos/', isExternal: true),
      FooterLinkModel(label: 'YouTube', url: 'https://www.youtube.com/@trinopagamentos', isExternal: true),
    ],
    legalText:
        'A Trino Pagamentos LTDA (CNPJ: 26.363.066/0001-30) é uma Instituição de '
        'Pagamento, atuando como Emissora de Instrumento Pós-Pago em arranjo de pagamentos '
        'fechado próprio, conforme a Lei nº 12.865/2013 e regulamentação do Banco Central do '
        'Brasil. Oferecemos soluções financeiras digitais através de nossa plataforma tecnológica, '
        'incluindo a emissão e gestão de cartões (físicos e digitais).',
    copyright: '© 2025 Trino Pagamentos LTDA\nTodos os direitos reservados.',
    cnpj: 'CNPJ: 26.363.066/0001-30\nCNPJ: 26.363.066/0002-10',
    phone: '+55 (11) 5128-5600',
    email: 'contato@trinopagamentos.com',
    address: 'R. Gomes de Carvalho, 1356 - 7º andar\nVila Olímpia, São Paulo - SP, 04547-006',
  );
}

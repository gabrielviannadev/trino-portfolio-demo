abstract final class AppAssets {
  static const _imageBase = 'assets/images';
  static const _dataBase = 'assets/data';

  static const logoVerde = '$_imageBase/logo-trino-verde.svg';
  static const logoBranco = '$_imageBase/logo-trino-branco.svg';

  static const portfolioItemsJson = '$_dataBase/portfolio_items.json';

  static String resolveImage(String originalPath) {
    final filename = originalPath.split('/').last;
    return '$_imageBase/$filename';
  }
}

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_active_coin.svg
  String get icActiveCoin => 'assets/icons/ic_active_coin.svg';

  /// File path: assets/icons/ic_active_like.svg
  String get icActiveLike => 'assets/icons/ic_active_like.svg';

  /// File path: assets/icons/ic_close.svg
  String get icClose => 'assets/icons/ic_close.svg';

  /// File path: assets/icons/ic_default_coin.svg
  String get icDefaultCoin => 'assets/icons/ic_default_coin.svg';

  /// File path: assets/icons/ic_default_like.svg
  String get icDefaultLike => 'assets/icons/ic_default_like.svg';

  /// File path: assets/icons/ic_win.svg
  String get icWin => 'assets/icons/ic_win.svg';

  /// List of all assets
  List<String> get values => [
        icActiveCoin,
        icActiveLike,
        icClose,
        icDefaultCoin,
        icDefaultLike,
        icWin
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/promo_items.png
  AssetGenImage get promoItemsPng =>
      const AssetGenImage('assets/images/promo_items.png');

  /// File path: assets/images/promo_items.svg
  String get promoItemsSvg => 'assets/images/promo_items.svg';

  /// File path: assets/images/promo_title.png
  AssetGenImage get promoTitlePng =>
      const AssetGenImage('assets/images/promo_title.png');

  /// File path: assets/images/promo_title.svg
  String get promoTitleSvg => 'assets/images/promo_title.svg';

  /// List of all assets
  List<dynamic> get values =>
      [promoItemsPng, promoItemsSvg, promoTitlePng, promoTitleSvg];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

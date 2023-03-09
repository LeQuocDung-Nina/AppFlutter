import 'package:freezed_annotation/freezed_annotation.dart';

part 'slideshow_model.freezed.dart';
part 'slideshow_model.g.dart';
@freezed
class SlideshowModel with _$SlideshowModel {
  factory SlideshowModel({
    required String id,
    required String link,
    required String namevi,
    required String photo,
  }) = _SlideshowModel;

  factory SlideshowModel.fromJson(Map<String, Object?> json)
  => _$SlideshowModelFromJson(json);
}


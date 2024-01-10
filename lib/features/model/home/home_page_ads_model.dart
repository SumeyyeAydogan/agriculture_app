import 'package:json_annotation/json_annotation.dart';

part 'home_page_ads_model.g.dart';

@JsonSerializable()
class HomeAdsImagesResponseModel {
  String? id;
  String? imageUrl;
  String? urlLink;

  HomeAdsImagesResponseModel(
    this.id,
    this.imageUrl,
    this.urlLink,
  );

  factory HomeAdsImagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeAdsImagesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeAdsImagesResponseModelToJson(this);
}

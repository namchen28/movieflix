// class CastModels {
//   bool? adult;
//   int? gender;
//   int? id;
//   String? knownForDepartment;
//   String? name;
//   String? originalName;
//   double? popularity;
//   String? profilePath;
//   int? castId;
//   String? character;
//   String? creditId;
//   int? order;

//   CastModels(
//       {this.adult,
//       this.gender,
//       this.id,
//       this.knownForDepartment,
//       this.name,
//       this.originalName,
//       this.popularity,
//       this.profilePath,
//       this.castId,
//       this.character,
//       this.creditId,
//       this.order});

//   CastModels.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     gender = json['gender'];
//     id = json['id'];
//     knownForDepartment = json['known_for_department'];
//     name = json['name'];
//     originalName = json['original_name'];
//     popularity = json['popularity'];
//     profilePath = json['profile_path'];
//     castId = json['cast_id'];
//     character = json['character'];
//     creditId = json['credit_id'];
//     order = json['order'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['adult'] = this.adult;
//     data['gender'] = this.gender;
//     data['id'] = this.id;
//     data['known_for_department'] = this.knownForDepartment;
//     data['name'] = this.name;
//     data['original_name'] = this.originalName;
//     data['popularity'] = this.popularity;
//     data['profile_path'] = this.profilePath;
//     data['cast_id'] = this.castId;
//     data['character'] = this.character;
//     data['credit_id'] = this.creditId;
//     data['order'] = this.order;
//     return data;
//   }

//   String get fullProfilePath => profilePath != null
//       ? 'https://image.tmdb.org/t/p/w500/$profilePath'
//       : blankProfilePath;

//   String blankProfilePath =
//       'https://alumni.engineering.utoronto.ca/files/2022/05/Avatar-Placeholder-400x400-1.jpg';
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_model.freezed.dart';
part 'cast_model.g.dart';

@freezed
class CastModels with _$CastModels {
  const factory CastModels({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
  }) = _CastModels;

  factory CastModels.fromJson(Map<String, dynamic> json) =>
      _$CastModelsFromJson(json);
}

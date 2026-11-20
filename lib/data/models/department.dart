import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.freezed.dart';
part 'department.g.dart';

/// Department model representing a hospital department
@freezed
class Department with _$Department {
  const factory Department({
    int? id,
    required String nameAr,
    required String nameEn,
    required String code,
    String? description,
    int? parentId,
    @Default(true) bool isActive,
    String? createdAt,
    String? updatedAt,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  
  /// Convert to map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'code': code,
      'description': description,
      'parent_id': parentId,
      'is_active': isActive ? 1 : 0,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
  
  /// Create from database map
  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      id: map['id'] as int?,
      nameAr: map['name_ar'] as String,
      nameEn: map['name_en'] as String,
      code: map['code'] as String,
      description: map['description'] as String?,
      parentId: map['parent_id'] as int?,
      isActive: (map['is_active'] as int?) == 1,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }
  
  /// Get display name based on language
  String getDisplayName(bool isArabic) {
    return isArabic ? nameAr : nameEn;
  }
}

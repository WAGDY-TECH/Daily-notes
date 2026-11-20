/// Equipment model representing hospital equipment
class Equipment {
  final int? id;
  final String nameAr;
  final String nameEn;
  final String code;
  final int departmentId;
  final String? serialNumber;
  final String? manufacturer;
  final String? model;
  final String? purchaseDate;
  final String? warrantyExpiry;
  final String status;
  final String? location;
  final String? description;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;

  Equipment({
    this.id,
    required this.nameAr,
    required this.nameEn,
    required this.code,
    required this.departmentId,
    this.serialNumber,
    this.manufacturer,
    this.model,
    this.purchaseDate,
    this.warrantyExpiry,
    this.status = 'active',
    this.location,
    this.description,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  /// Convert to map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'code': code,
      'department_id': departmentId,
      'serial_number': serialNumber,
      'manufacturer': manufacturer,
      'model': model,
      'purchase_date': purchaseDate,
      'warranty_expiry': warrantyExpiry,
      'status': status,
      'location': location,
      'description': description,
      'is_active': isActive ? 1 : 0,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /// Create from database map
  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      id: map['id'] as int?,
      nameAr: map['name_ar'] as String,
      nameEn: map['name_en'] as String,
      code: map['code'] as String,
      departmentId: map['department_id'] as int,
      serialNumber: map['serial_number'] as String?,
      manufacturer: map['manufacturer'] as String?,
      model: map['model'] as String?,
      purchaseDate: map['purchase_date'] as String?,
      warrantyExpiry: map['warranty_expiry'] as String?,
      status: map['status'] as String? ?? 'active',
      location: map['location'] as String?,
      description: map['description'] as String?,
      isActive: (map['is_active'] as int?) == 1,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }

  /// Get display name based on language
  String getDisplayName(bool isArabic) {
    return isArabic ? nameAr : nameEn;
  }

  /// Copy with new values
  Equipment copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    String? code,
    int? departmentId,
    String? serialNumber,
    String? manufacturer,
    String? model,
    String? purchaseDate,
    String? warrantyExpiry,
    String? status,
    String? location,
    String? description,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Equipment(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      code: code ?? this.code,
      departmentId: departmentId ?? this.departmentId,
      serialNumber: serialNumber ?? this.serialNumber,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      warrantyExpiry: warrantyExpiry ?? this.warrantyExpiry,
      status: status ?? this.status,
      location: location ?? this.location,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

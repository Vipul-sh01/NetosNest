import '../Utility/ModuleEnum.dart';

class ModuleModel {
  final ModuleName moduleName;
  final String fileUrl;
  final String? previewUrl;
  final String? description;
  final double price;
  final bool isPurchased;

  ModuleModel({
    required this.moduleName,
    required this.fileUrl,
    this.previewUrl,
    this.description,
    required this.price,
    this.isPurchased = false,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      moduleName: ModuleNameExtension.fromString(json['moduleName']),
      fileUrl: json['fileUrl'],
      previewUrl: json['previewUrl'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      isPurchased: json['isPurchased'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'moduleName': moduleName.name,
    'fileUrl': fileUrl,
    'previewUrl': previewUrl,
    'description': description,
    'price': price,
    'isPurchased': isPurchased,
  };
}

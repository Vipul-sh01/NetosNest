enum ModuleName {
  module1,
  module2,
  module3,
  module4,
  module5,
  module6,
  module7,
  module8,
  module9,
  module10
}

extension ModuleNameExtension on ModuleName {
  String get displayName {
    switch (this) {
      case ModuleName.module1:
        return '1';
      case ModuleName.module2:
        return '2';
      case ModuleName.module3:
        return '3';
      case ModuleName.module4:
        return '4';
      case ModuleName.module5:
        return '5';
      case ModuleName.module6:
        return '6';
      case ModuleName.module7:
        return '7';
      case ModuleName.module8:
        return '8';
      case ModuleName.module9:
        return '9';
      case ModuleName.module10:
        return '10';
    }
  }

  static ModuleName fromString(String value) {
    return ModuleName.values.firstWhere(
          (e) => e.name == value,
      orElse: () => ModuleName.module1,
    );
  }
}

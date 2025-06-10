enum University {
  delhiUniversity,
  jawaharlalNehruUniversity,
  banarasHinduUniversity,
  amityUniversity,
  universityOfMumbai,
  universityOfCalcutta,
  aligarhMuslimUniversity,
  annaUniversity,
  osmaniaUniversity,
  savitribaiPhulePuneUniversity,
  university1, // Added constant
}

extension UniversityExtension on University {
  // Getter for display names
  String get displayName {
    switch (this) {
      case University.delhiUniversity:
        return 'University of Delhi';
      case University.jawaharlalNehruUniversity:
        return 'Jawaharlal Nehru University';
      case University.banarasHinduUniversity:
        return 'Banaras Hindu University';
      case University.amityUniversity:
        return 'Amity University';
      case University.universityOfMumbai:
        return 'University of Mumbai';
      case University.universityOfCalcutta:
        return 'University of Calcutta';
      case University.aligarhMuslimUniversity:
        return 'Aligarh Muslim University';
      case University.annaUniversity:
        return 'Anna University';
      case University.osmaniaUniversity:
        return 'Osmania University';
      case University.savitribaiPhulePuneUniversity:
        return 'Savitribai Phule Pune University';
      case University.university1: // Added display name for new constant
        return 'Some New University';
    }
  }

  // Method to convert string to corresponding enum value
  static University fromString(String value) {
    return University.values.firstWhere(
          (e) => e.name == value,
      orElse: () => University.delhiUniversity, // Default if not found
    );
  }
}

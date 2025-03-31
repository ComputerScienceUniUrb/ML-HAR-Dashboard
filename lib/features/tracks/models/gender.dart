enum Gender {
  male,
  female,
  notBinary,
  notAvailable;

  String get translate {
    return switch (this) {
      Gender.male => 'Maschio',
      Gender.female => 'Femmina',
      Gender.notBinary => 'Non binario',
      Gender.notAvailable => 'Non disponibile',
    };
  }
}

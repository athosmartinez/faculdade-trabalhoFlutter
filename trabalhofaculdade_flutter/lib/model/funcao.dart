enum Funcao {
  garcom,
  cozinheiro;

  static Funcao? fromName(String name) {
    for (Funcao enumVariant in Funcao.values) {
      if (enumVariant.name == name) return enumVariant;
    }
    return null;
  }
}

extension FuncaoExtension on Funcao {
  String get label {
    switch (this) {
      case Funcao.garcom:
        return 'Garçom';
      case Funcao.cozinheiro:
        return 'Cozinheiro';
      default:
        return "";
    }
  }

  String get name {
    switch (this) {
      case Funcao.garcom:
        return 'garcom';
      case Funcao.cozinheiro:
        return 'cozinheiro';
      default:
        return "";
    }
  }
}
class AddressModel {
  String cep;
  String logadouro;
  String bairro;

  AddressModel({
    this.cep,
    this.logadouro,
    this.bairro,
  });

  static AddressModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AddressModel(
        cep: map['cep'], logadouro: map['logadouro'], bairro: map['bairro']);
  }
}

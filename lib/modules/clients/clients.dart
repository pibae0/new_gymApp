class ClientsBasicInfo {
  final int id;
  final String name;
  final String sexo;
  final int? frequencia;
  final String alunoCPF;
  final String vencimento;
  final String? objetivo;
  final String? avaliacao;
  final String email;
  final String dataNascimento;
  final String? imagePath;
  final String telefone;

  ClientsBasicInfo(
      {required this.telefone,
      required this.id,
      required this.email,
      required this.sexo,
      this.avaliacao,
      required this.name,
      required this.dataNascimento,
      required this.alunoCPF,
      required this.vencimento,
      this.objetivo,
      this.frequencia,
      this.imagePath});

  factory ClientsBasicInfo.fromJson(Map<String, dynamic> json) {
    return ClientsBasicInfo(
      dataNascimento: json['data_nascimento'] ?? "25/07/2024",
      id: json['id'],
      email: json['email'] ?? "piveta@hotmail.com",
      sexo: json['sexo'],
      avaliacao: json['avaliacao'],
      name: json['nome'] ?? "Pedro",
      alunoCPF: json['cpf'] ?? "00000000000",
      vencimento: json['vencimento_plano_treino'] ?? "LOL",
      telefone: json['telefone'] ?? "99999999",
      imagePath: json['foto'],
    );
  }

  // factory ClientsBasicInfo.fromMap(Map<String, dynamic> map) {
  //   return ClientsBasicInfo(
  //     dataNascimento: map['data_nascimento'] ?? "25/07/2024",
  //     id: map['id'],
  //     email: map['email'] ?? "piveta@hotmail.com",
  //     sexo: map['sexo'],
  //     avaliacao: map['avaliacao'],
  //     name: map['nome'] ?? "Pedro",
  //     alunoCPF: map['cpf'] ?? "00000000000",
  //     vencimento: map['vencimento_plano_treino'] ?? "LOL",
  //     telefone: map['telefone'] ?? "99999999",
  //     imagePath: map['foto'],
  //   );
  // }

  @override
  String toString() {
    return 'ClientsBasicInfo(name: $name, imagePath: $imagePath, dataNascimento: $dataNascimento, frequencia: $frequencia)';
  }
}

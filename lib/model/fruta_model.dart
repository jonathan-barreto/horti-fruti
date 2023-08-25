class FrutaModel {
  String? id;
  String? nome;
  String? preco;
  String? peso;
  String? image;

  FrutaModel({
    this.id,
    this.nome,
    this.preco,
    this.peso,
    this.image,
  });

  FrutaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    preco = json['preco'];
    peso = json['peso'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['preco'] = preco;
    data['peso'] = peso;
    data['image'] = image;
    return data;
  }
}

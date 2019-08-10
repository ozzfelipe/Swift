

class Video {

  String id, titulo, descricao,imagem, canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  static converterJson(Map<String, dynamic> json){
    return Video();
  }

  static Video.fromJson(Map<String, dynamic> json){
    return Video();
  }

}
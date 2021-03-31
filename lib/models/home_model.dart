import 'dart:convert';

class HomeModel {
 String namehome;
 String detailhome;
 String imagehome;
 String content;
  HomeModel({
    this.namehome,
     this.detailhome,
    this.imagehome,
     this.content,
  });
  

  HomeModel copyWith({
    String namehome,
    String detailhome,
    String imagehome,
    String content,
  }) {
    return HomeModel(
      namehome: namehome ?? this.namehome,
      detailhome: detailhome ?? this.detailhome,
      imagehome: imagehome ?? this.imagehome,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'namehome': namehome,
      'detailhome': detailhome,
      'imagehome': imagehome,
      'content': content,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      namehome: map['namehome'],
      detailhome: map['detailhome'],
      imagehome: map['imagehome'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) => HomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeModel(namehome: $namehome, detailhome: $detailhome, imagehome: $imagehome, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeModel &&
      other.namehome == namehome &&
      other.detailhome == detailhome &&
      other.imagehome == imagehome &&
      other.content == content;
  }

  @override
  int get hashCode {
    return namehome.hashCode ^
      detailhome.hashCode ^
      imagehome.hashCode ^
      content.hashCode;
  }
}

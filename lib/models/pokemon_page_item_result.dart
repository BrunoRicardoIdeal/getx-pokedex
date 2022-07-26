import 'dart:convert';

class PokemonPageItemResult {
  String? name;
  String? url;
  PokemonPageItemResult({
    this.name,
    this.url,
  });

  PokemonPageItemResult copyWith({
    String? name,
    String? url,
  }) {
    return PokemonPageItemResult(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonPageItemResult.fromMap(Map<String, dynamic> map) {
    return PokemonPageItemResult(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonPageItemResult.fromJson(String source) =>
      PokemonPageItemResult.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonPageItemResult(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonPageItemResult other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class PokemonEvolutionChain {
  Chain? chain;
  int? id;

  PokemonEvolutionChain({this.chain, this.id});

  PokemonEvolutionChain.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null ? Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chain != null) {
      data['chain'] = chain!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Chain {
  Species? species;
  List<EvolvesTo>? evolvesTo;
  bool? isBaby;

  Chain({this.species, this.evolvesTo, this.isBaby});

  Chain.fromJson(Map<String, dynamic> json) {
    species =
        json['species'] != null ? Species.fromJson(json['species']) : null;
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo!.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    return data;
  }
}

class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class EvolvesTo {
  bool? isBaby;
  Species? species;
  List<EvolvesTo>? evolvesTo;

  EvolvesTo({this.isBaby, this.species, this.evolvesTo});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    isBaby = json['is_baby'];
    species =
        json['species'] != null ? Species.fromJson(json['species']) : null;
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(EvolvesTo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_baby'] = isBaby;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

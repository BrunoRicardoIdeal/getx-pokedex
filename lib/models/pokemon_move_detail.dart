import 'package:pokedex/models/pokemon.dart';

class MoveDetail {
  int? accuracy;
  DamageClass? damageClass;
  int? effectChance;
  List<EffectEntries>? effectEntries;
  List<FlavorTextEntries>? flavorTextEntries;
  DamageClass? generation;
  int? id;
  List<NameUrl>? learnedByPokemon;
  List<Machines>? machines;
  Meta? meta;
  String? name;
  List<Names>? names;
  int? power;
  int? pp;
  int? priority;
  List<StatChanges>? statChanges;
  DamageClass? target;
  DamageClass? type;

  MoveDetail(
      {this.accuracy,
      this.damageClass,
      this.effectChance,
      this.effectEntries,
      this.flavorTextEntries,
      this.generation,
      this.id,
      this.learnedByPokemon,
      this.machines,
      this.meta,
      this.name,
      this.names,
      this.power,
      this.pp,
      this.priority,
      this.statChanges,
      this.target,
      this.type});

  MoveDetail.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    damageClass = json['damage_class'] != null
        ? DamageClass.fromJson(json['damage_class'])
        : null;
    effectChance = json['effect_chance'];
    if (json['effect_entries'] != null) {
      effectEntries = <EffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(EffectEntries.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorTextEntries.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? DamageClass.fromJson(json['generation'])
        : null;
    id = json['id'];
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(Machines.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    name = json['name'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
    power = json['power'];
    pp = json['pp'];
    priority = json['priority'];
    if (json['stat_changes'] != null) {
      statChanges = <StatChanges>[];
      json['stat_changes'].forEach((v) {
        statChanges!.add(StatChanges.fromJson(v));
      });
    }
    target =
        json['target'] != null ? DamageClass.fromJson(json['target']) : null;
    type = json['type'] != null ? DamageClass.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accuracy'] = accuracy;
    if (damageClass != null) {
      data['damage_class'] = damageClass!.toJson();
    }
    data['effect_chance'] = effectChance;
    if (effectEntries != null) {
      data['effect_entries'] = effectEntries!.map((v) => v.toJson()).toList();
    }
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    data['id'] = id;
    if (learnedByPokemon != null) {
      data['learned_by_pokemon'] =
          learnedByPokemon!.map((v) => v.toJson()).toList();
    }
    if (machines != null) {
      data['machines'] = machines!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['name'] = name;
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }

    data['power'] = power;
    data['pp'] = pp;
    data['priority'] = priority;
    if (statChanges != null) {
      data['stat_changes'] = statChanges!.map((v) => v.toJson()).toList();
    }
    if (target != null) {
      data['target'] = target!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class DamageClass {
  String? name;
  String? url;

  DamageClass({this.name, this.url});

  DamageClass.fromJson(Map<String, dynamic> json) {
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

class EffectEntries {
  String? effect;
  DamageClass? language;
  String? shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? DamageClass.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['effect'] = effect;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['short_effect'] = shortEffect;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  DamageClass? language;
  DamageClass? versionGroup;

  FlavorTextEntries({this.flavorText, this.language, this.versionGroup});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? DamageClass.fromJson(json['language'])
        : null;
    versionGroup = json['version_group'] != null
        ? DamageClass.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}

class Machines {
  Machine? machine;
  DamageClass? versionGroup;

  Machines({this.machine, this.versionGroup});

  Machines.fromJson(Map<String, dynamic> json) {
    machine =
        json['machine'] != null ? Machine.fromJson(json['machine']) : null;
    versionGroup = json['version_group'] != null
        ? DamageClass.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (machine != null) {
      data['machine'] = machine!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}

class Machine {
  String? url;

  Machine({this.url});

  Machine.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Meta {
  DamageClass? ailment;
  int? ailmentChance;
  DamageClass? category;
  int? critRate;
  int? drain;
  int? flinchChance;
  int? healing;
  int? statChance;

  Meta(
      {this.ailment,
      this.ailmentChance,
      this.category,
      this.critRate,
      this.drain,
      this.flinchChance,
      this.healing,
      this.statChance});

  Meta.fromJson(Map<String, dynamic> json) {
    ailment =
        json['ailment'] != null ? DamageClass.fromJson(json['ailment']) : null;
    ailmentChance = json['ailment_chance'];
    category = json['category'] != null
        ? DamageClass.fromJson(json['category'])
        : null;
    critRate = json['crit_rate'];
    drain = json['drain'];
    flinchChance = json['flinch_chance'];
    healing = json['healing'];
    statChance = json['stat_chance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ailment != null) {
      data['ailment'] = ailment!.toJson();
    }
    data['ailment_chance'] = ailmentChance;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['crit_rate'] = critRate;
    data['drain'] = drain;
    data['flinch_chance'] = flinchChance;
    data['healing'] = healing;
    data['stat_chance'] = statChance;
    return data;
  }
}

class Names {
  DamageClass? language;
  String? name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? DamageClass.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class StatChanges {
  int? change;
  DamageClass? stat;

  StatChanges({this.change, this.stat});

  StatChanges.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    stat = json['stat'] != null ? DamageClass.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['change'] = change;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

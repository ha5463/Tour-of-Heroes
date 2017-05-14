import 'dart:async';
import 'package:angular2/core.dart';

import 'hero.dart';
import 'mock_heroes.dart';

@Injectable()
class HeroService {
  Future<List<Hero>> getHeros() async => mockHeroes; //stub
  Future<Hero> getHero(int id) async =>
      (await getHeros()).firstWhere((hero) => hero.id == id);
}
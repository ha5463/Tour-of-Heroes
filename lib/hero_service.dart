import 'dart:async';
import 'package:angular2/core.dart';
import 'dart:convert';

import 'hero.dart';
import 'package:http/http.dart';

@Injectable()
class HeroService {
  static const _heroesUrl = 'api/heroes';
  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getHeros() async {
    try {
      final response = await _http.get(_heroesUrl);
      final heroes = _extractData(response)
          .map((value) => new Hero.fromJson(value))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }

  Future<Hero> getHero(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return new Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }
}
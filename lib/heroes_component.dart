import 'dart:async';
import 'package:angular2/core.dart';
import 'hero_detail_component.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'my-heroes',
    templateUrl : 'heroes_component.html',
    styleUrls : const['heroes_component.css']
)
class HeroesComponent implements OnInit{
    Hero selectedHero;
    var heroes;
    final HeroService _heroService;
    final Router _router;
    HeroesComponent(this._heroService,this._router);
    Future<Null> getHeroes() async{
      heroes = await _heroService.getHeros();
    }
    String name;
    void onSelect(Hero hero) {
      selectedHero = hero;
    }
    @override
    ngOnInit() {
      getHeroes();
    }
    Future<Null> gotoDetail() => _router.navigate([
      'HeroDetail',
      {'id': selectedHero.id.toString()}
    ]);
}
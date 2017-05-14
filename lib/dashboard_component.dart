import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:async';
import 'package:firstWebApp/hero.dart';
import 'package:firstWebApp/hero_service.dart';

@Component(
    selector: 'my-dashboard',
    templateUrl: 'dashboard_component.html',
    styleUrls: const ['dashboard_component.css'],
    directives: const[ROUTER_DIRECTIVES]
)
class DashboardComponent implements OnInit{
  List<Hero> heroes;

  final HeroService  _heroservice;
  DashboardComponent(this._heroservice);
  Future<Null> ngOnInit() async{
    heroes = (await _heroservice.getHeros()).skip(1).take(4).toList();
  }
}
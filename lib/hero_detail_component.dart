import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:firstWebApp/hero.dart';
import 'package:angular2/platform/common.dart';
import 'package:firstWebApp/hero_service.dart';
@Component(
  selector: 'my-hero-detail',
  templateUrl : 'hero_detail_component.html'
)
class HeroDetailComponent implements OnInit {
  @Input()
  Hero hero;
  final HeroService _heroService;
  final RouteParams _routeParams;
  final Location _location;

  HeroDetailComponent(this._heroService, this._location, this._routeParams);

  @override
  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) hero = await (_heroService.getHero(id));
  }
  void goBack() => _location.back();
}
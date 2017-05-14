import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'hero_service.dart';
import 'heroes_component.dart';
import 'package:firstWebApp/dashboard_component.dart';
import 'package:firstWebApp/hero_detail_component.dart';

@Component(
    selector: 'my-app',
    template: '''
      <h1>{{title}}</h1>
        <a [routerLink]="['Dashboard']">Dashboard</a>
        <a [routerLink]="['Heroes']">Heroes</a>
      <router-outlet></router-outlet>''',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [HeroService, ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent),
  const Route(path: '/dashboard', name: 'Dashboard', component: DashboardComponent, useAsDefault: true),
  const Route(path: '/detail/:id', name: 'HeroDetail', component: HeroDetailComponent)
])

class AppComponent {
  String title = 'Tour of Heroes';

  String name;
}


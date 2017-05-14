// Copyright (c) 2017, Ajay Agarawal. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:firstWebApp/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:firstWebApp/in_memory_dart_service.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent, [
    provide(Client, useClass: InMemoryDataService)
  ]);
}

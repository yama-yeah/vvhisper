import 'package:js/js.dart';

import 'filter.dart';
import 'web_request.dart';

@JS('chrome.webNavigation.onBeforeNavigate.addListener')
external void addNavigationListener(dynamic callback, URLS urls);

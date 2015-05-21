// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:collection';
import 'package:react/react.dart';
import 'package:react/react_client.dart' as reactClient;
import 'package:react_widgets/react_widgets.dart' as widgets;

main() {
  reactClient.setClientConfiguration();

  render(rootComponent({}), querySelector('#content'));

}

var rootComponent = registerComponent(() => new RootComponent());

class RootComponent extends Component {

  var colors = ['orange', 'red', 'blue', 'purple'];

  getInitialState() {
    return {
      "value": colors[0]
    };
  }

  render() =>
  div({}, [
    h1({"style": {"color": "red"}}, "hejhej"),
    subComponent({}),
    this.state["value"],
    widgets.dropdownList({"style": {"width": "200px"}, "data": colors, "value": this.state["value"], "onChange": (value) => this.setState({"value": value}) }),
  ]);

}


var subComponent = registerComponent(() => new SubComponent());

class SubComponent extends Component {

  var colors = ['orange', 'red', 'blue', 'purple'];

  render() =>
  div({}, [
    h1({"style": {"color": "green"}}, "hejhej"),
  ]);

}

//class SubComponentProps extends LinkedHashMap {
//
//
//}

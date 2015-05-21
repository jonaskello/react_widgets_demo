// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:react/react.dart';
import 'package:react/react_client.dart' as reactClient;
import 'package:react_widgets/react_widgets.dart' as widgets;

main() {

    reactClient.setClientConfiguration();
    widgets.init();
    render(rootComponent({}), querySelector('#content'));

}

var rootComponent = registerComponent(() => new RootComponent());

class RootComponent extends Component {

  var colors = ['orange', 'red', 'blue', 'purple'];

  getInitialState() {
    return {
      "dropdownListValue": colors[0],
      "comboboxValue": colors[0],
      "numberPickerValue": 5,
      "multiselectValue": [colors[0], colors[2]],
      "selectListValue": [colors[0]],
    };
  }

  render() =>
  div({}, [
    h1({"style": {"color": "red"}}, "DEMO"),
    div({"style": {"padding": "10px"}}, [
      "DropdownList: ${this.state["dropdownListValue"]}",
      this.state["value"],
      widgets.dropdownList({
        "style": {"width": "200px"},
        "data": colors,
        "value": this.state["dropdownListValue"],
        "onChange": (value) => this.setState({"dropdownListValue": value})
      }),
    ]),
    div({"style": {"padding": "10px"}}, [
      "Combobox: ${this.state["comboboxValue"]}",
      widgets.combobox({
        "style": {"width": "200px"},
        "data": colors,
        "value": this.state["comboboxValue"],
        "onChange": (value) => this.setState({"comboboxValue": value})}),
    ]),
    div({"style": {"padding": "10px"}}, [
      "NumberPicker: ${this.state["numberPickerValue"]}",
      widgets.numberPicker({
        "style": {"width": "200px"},
        "format": (v, c) => v,
        "parse": (v, c) => v,
        "value": this.state["numberPickerValue"],
        "onChange": (value) => this.setState({"numberPickerValue": value})}),
    ]),
    div({"style": {"padding": "10px"}}, [
      "Multiselect: ${this.state["multiselectValue"]}",
      widgets.multiselect({
        "style": {"width": "200px"},
        "data": colors,
        "value": this.state["multiselectValue"],
        "onChange": (value) => this.setState({"multiselectValue": value})}),
    ]),
    div({"style": {"padding": "10px"}}, [
      "SelectList: ${this.state["selectListValue"]}",
      widgets.selectList({
        "style": {"width": "200px"},
        "data": colors,
        "value": this.state["selectListValue"],
        "onChange": (value) => this.setState({"selectListValue": value})}),
    ]),
    div({"style": {"padding": "10px"}}, [
      "Calendar: ${this.state["calendarValue"]}",
      widgets.calendar({
        "style": {"width": "200px"},
//        "headerFormat": (v, c) => v,
        "parse": (v, c) => v,
        "value": this.state["calendarValue"],
        "onChange": (value) => this.setState({"calendarValue": value})}),
    ]),
  ]);

}


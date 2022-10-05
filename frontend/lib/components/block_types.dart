import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const markdown = "markdown";
const html = "HTML";
const image = "IMAGE";

Widget blockTypes(String value, String text) {
  switch (value) {
    case markdown:
      return Markdown(data: text);
    case html:
      return Html(data: text);
    case image:
      return Container();

    default:
      throw Error();
  }
}

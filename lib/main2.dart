import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overflow with ellipsis',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Overflow with ellipsis'),
        ),
        body: Stack(children: [
          Positioned(left: 50, top: 300, child: _simpleClip(context)),
          Positioned(left: 10, top: 10, child: _textClip(context)),
          Positioned(left: 200, top: 10, child: _richTextClip(context)),
        ]),
      ),
    );
  }

  Widget _simpleClip(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: SizedBox(
        width: 150,
        height: 155,
        child: Text(
          _ipsum,
          overflow: TextOverflow.ellipsis, // what about multiple lines??
          //overflow: TextOverflow.fade, // ok
        ),
      ),
    );
  }

  Widget _textClip(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            color: Colors.green[100],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Text clip'),
              Flexible(
                child: Text(
                  _ipsum,
                  //overflow: TextOverflow.ellipsis,
                  //maxLines: null,
                ),
              ),
              Text('some footer'),
            ],
          )
        ],
      ),
    );
  }

  Widget _richTextClip(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            color: Colors.green[100],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rich text clip'),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 500,
                  text: TextSpan(
                    text: _ipsum,
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(color: Colors.black),
                    children: <TextSpan>[],
                  ),
                ),
              ),
              Text('some footer'),
            ],
          )
        ],
      ),
    );
  }

  String get _ipsum =>
      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''';
}

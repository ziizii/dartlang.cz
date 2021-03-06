import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {
  await window.onLoad.first;

  List<Tip> tips = [];

  const TOMUCHA = 'Tomáš Zvěřina';

  tips.add(new Tip()
    ..name = 'Konstruktory'
    ..description = 'Různé varianty konstruktorů objektů.'
    ..dartPadId = 'a082ec8f0c1a4e7c409195d228234069'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'List (pole)'
    ..description = 'List a pole - v Dartu jednou jsou.'
    ..dartPadId = 'e1f4e71b7d75d29cc7ea9e6870b502c4'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Future'
    ..description = 'Základy asynchronního programování pomocí Futures.'
    ..dartPadId = 'b887b707288c7be532237c466f63f273'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'async / await'
    ..description = 'Pohodlné asynchronní programování pomocí await.'
    ..dartPadId = '3a611f5febde98d5de6c9fe56eb3431b'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Stream'
    ..description = 'Tok dat a událostí.'
    ..dartPadId = '454a0e659a3aea422f78416ddd4ffef1'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Synchronní generátor'
    ..description = 'Iterování přes komplikované struktury.'
    ..dartPadId = 'fe6e4f3f9e14fcbd111fdcd9e3295a93'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'DOM eventy a atributy'
    ..description = 'Přiřazování eventů a změna atributů v DOM.'
    ..dartPadId = 'a1d0bc7572132d99ece391a9c50e5881'
    ..author = 'Honza Bittner'
  );
  
  var benevolentValidator = new BenevolentNodeValidator();
  HtmlElement gallery = querySelector('#tips');

  for (var t in tips) {
    var card = new Element.html(renderTip(t), validator: benevolentValidator);
    gallery.children.add(card);
  }
}

class BenevolentNodeValidator implements NodeValidator {

  @override
  bool allowsAttribute(Element element, String attributeName, String value) {
    return !attributeName.startsWith('on');
  }

  @override
  bool allowsElement(Element element) {
    return element.tagName.toLowerCase() != 'script';
  }
}

// Our Home class dans un autre fichier

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Aves cette package importée dans cette ligne au dessus
// les outils des design sont djà importée et on peut les utiliser
// dans notre projet.

import 'ui/home.dart';

void main() => runApp(new MaterialApp(
      home: QuizApp(),
    ));
// home muriyo main iratandukanye na class home twamye dukoresha iratandukanye
//kandi na home fichier ni propriétés ya MaterialApp

//void main() => runApp(ScaffoldExample());
// runApp() is a class parmi les class du framework.
// dans la class runApp on y passe un argument qui est la
//class qui contient le code de l'app, un objet.
// içi le nom de notre class qui va contenir le code est Home().

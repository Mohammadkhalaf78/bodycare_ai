import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class BodyDiagram extends StatefulWidget {
  const BodyDiagram({super.key});

  @override
  State<BodyDiagram> createState() => _BodyDiagramState();
}

class _BodyDiagramState extends State<BodyDiagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelViewer(src: 'assets/model/ecorche_-_anatomy_study.glb'),
    );
  }
}
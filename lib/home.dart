import 'dart:math';

import 'package:dsi_app/constants.dart';
import 'package:dsi_app/dsi_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Home',
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff7ffe8),
              Color(0xffc2ca94),
            ],
            stops: [0.8, 1.0],
            transform: GradientRotation(pi / 2),
          ),
          image: DecorationImage(
            image: Images.bsiLogo,
          ),
        ),
      ),
    );
  }
}

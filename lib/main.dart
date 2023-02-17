import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'Screen/HomeProvider/HomeProvider.dart';
import 'Screen/view/HomePage.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomePage(),
            },
          );
        },),
      )
  );
}

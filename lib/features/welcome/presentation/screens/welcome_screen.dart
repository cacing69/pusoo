import 'package:flutter/widgets.dart';
import 'package:forui/widgets/button.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome"),
          Text(
            "Eiusmod veniam cillum dolore proident quis commodo magna. Officia exercitation dolor ut nostrud est ut laboris qui. Anim ullamco quis labore in sunt adipisicing proident consequat in nostrud quis Lorem. Cillum incididunt ullamco non officia. Cupidatat ut excepteur veniam cillum eiusmod incididunt et reprehenderit aute labore anim voluptate ad duis. Nostrud enim proident veniam aute culpa Lorem elit minim enim laborum dolore ullamco.",
            textAlign: TextAlign.center,
          ),
          FButton(
            onPress: () {
              context.goNamed(RouteName.home.name);
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}

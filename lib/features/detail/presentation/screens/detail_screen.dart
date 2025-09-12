import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:forui/widgets/scaffold.dart';

class DetailScreen extends StatefulWidget {
  final String movieId;

  const DetailScreen({super.key, required this.movieId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text("Title")),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [Expanded(child: Placeholder())]),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            _buildShortAppbar(context),
          ],
        ),
      ),
    );
  }

  Card _buildShortAppbar(BuildContext context) {
    return Card(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16))),
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'N',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          );
  }
}

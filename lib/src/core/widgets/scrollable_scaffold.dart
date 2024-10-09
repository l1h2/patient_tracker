import 'package:flutter/material.dart';

class ScrollableScaffold extends StatelessWidget {
  const ScrollableScaffold({
    super.key,
    required this.content,
    required this.appBar,
    this.floatingActionButton,
  });

  final SliverAppBar appBar;
  final Widget content;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            appBar,
            SliverToBoxAdapter(child: content),
          ],
        ),
      ),
    );
  }
}

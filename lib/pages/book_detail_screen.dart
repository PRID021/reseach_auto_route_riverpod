import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage<void>()
class BookDetailScreen extends StatelessWidget {
  final String bookId;

  const BookDetailScreen({super.key, @PathParam('id') required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(bookId),
    ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class PaginatedResult<T> {
  final List<T> items;
  final DocumentSnapshot? lastDoc;

  PaginatedResult({required this.items, this.lastDoc});
}

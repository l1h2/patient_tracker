import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createDocument(
    String collectionPath,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collectionPath).add(data);
  }

  Future<Map<String, dynamic>?> readDocument(
    String collectionPath,
    String documentId,
    String idFieldName,
  ) async {
    final DocumentSnapshot document =
        await _db.collection(collectionPath).doc(documentId).get();

    if (!document.exists) return null;
    return _getDocumentData(document, idFieldName);
  }

  Future<List<Map<String, dynamic>>> readDocuments(
    String collectionPath,
    String idFieldName,
  ) async {
    final QuerySnapshot documents = await _db.collection(collectionPath).get();

    return documents.docs
        .map((document) => _getDocumentData(document, idFieldName))
        .toList();
  }

  Future<void> updateDocument(
    String collectionPath,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collectionPath).doc(documentId).update(data);
  }

  Future<void> deleteDocument(
    String collectionPath,
    String documentId,
  ) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }

  Map<String, dynamic> _getDocumentData(
    DocumentSnapshot document,
    String idFieldName,
  ) {
    final data = document.data() as Map<String, dynamic>;
    data[idFieldName] = document.id;
    return data;
  }
}

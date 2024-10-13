import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentReference> createDocument(
    String collectionPath,
    Map<String, dynamic> data,
  ) async {
    return await _db.collection(collectionPath).add(data);
  }

  Future<void> createDocumentWithId(
    String collectionPath,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    await _db.collection(collectionPath).doc(documentId).set(data);
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

  Future<Map<String, dynamic>?> readDocumentByField(
    String collectionPath,
    String fieldName,
    dynamic value,
    String idFieldName,
  ) async {
    final QuerySnapshot querySnapshot = await _db
        .collection(collectionPath)
        .where(fieldName, isEqualTo: value)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) return null;

    final DocumentSnapshot document = querySnapshot.docs.first;
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

  Future<void> updateDocumentField(
    String collectionPath,
    String documentId,
    String fieldName,
    dynamic value,
  ) async {
    await _db.collection(collectionPath).doc(documentId).update({
      fieldName: value,
    });
  }

  Future<void> updateDocumentWithMapFields(
    String collectionPath,
    String documentId,
    Map<String, dynamic> data, [
    List<String>? fieldsToDelete,
  ]) async {
    final Map<String, dynamic> updates = {};

    data.forEach((key, value) {
      if (value is Map) {
        value.forEach((subKey, subValue) {
          updates['$key.$subKey'] = subValue;
        });
      } else {
        updates[key] = value;
      }
    });

    if (fieldsToDelete != null) {
      for (final fieldName in fieldsToDelete) {
        updates[fieldName] = FieldValue.delete();
      }
    }

    await _db.collection(collectionPath).doc(documentId).update(updates);
  }

  Future<void> appendToArray(
    String collectionPath,
    String documentId,
    String arrayName,
    List<dynamic> value,
  ) async {
    await _db.collection(collectionPath).doc(documentId).update({
      arrayName: FieldValue.arrayUnion(value),
    });
  }

  Future<void> deleteField(
    String collectionPath,
    String documentId,
    String fieldName,
  ) async {
    await _db.collection(collectionPath).doc(documentId).update({
      fieldName: FieldValue.delete(),
    });
  }

  Future<void> deleteFields(
    String collectionPath,
    String documentId,
    List<String> fieldNames,
  ) async {
    final Map<String, dynamic> updates = {};

    for (final fieldName in fieldNames) {
      updates[fieldName] = FieldValue.delete();
    }

    await _db.collection(collectionPath).doc(documentId).update(updates);
  }

  Future<void> removeFromArray(
    String collectionPath,
    String documentId,
    String arrayName,
    List<dynamic> value,
  ) async {
    await _db.collection(collectionPath).doc(documentId).update({
      arrayName: FieldValue.arrayRemove(value),
    });
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

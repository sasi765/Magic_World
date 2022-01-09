import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:magic_world/Screens/json.files/json_data.dart';

class MovieService {
  static const String _baseUrl = "movie";
  final CollectionReference _db;
  MovieService() : _db = FirebaseFirestore.instance.collection(_baseUrl);
  Future<MovieEntity> save(MovieEntity entity) async {
    entity.id = _db.doc().id;
    await _db.doc(entity.id).set(entity.toJson());
    return entity;
  }

  Future<List<MovieEntity>> getByTypeAll(String type) async {
    final CollectionReference _dbs =
        FirebaseFirestore.instance.collection(_baseUrl);
    QuerySnapshot query = await _dbs.where("TypeMovie", isEqualTo: type).get();
    List<MovieEntity> products =
        query.docs.map((doc) => MovieEntity.fromSnapshotjson(doc)).toList();
    return products;
  }
}

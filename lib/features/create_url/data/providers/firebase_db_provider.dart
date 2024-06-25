import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseDbProvider = Provider<FirebaseDb>((_) => FirebaseDb());

class FirebaseDb {
  FirebaseFirestore get db => FirebaseFirestore.instance;
}

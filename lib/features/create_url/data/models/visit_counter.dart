import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VisitCounter extends Equatable {
  final DocumentReference? id;
  final String username;
  final String label;
  final int iconsIndex;
  final int colorsIndex;
  final int count;

  const VisitCounter({
    this.id,
    required this.username,
    required this.label,
    required this.iconsIndex,
    required this.colorsIndex,
    required this.count,
  });

  factory VisitCounter.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return VisitCounter(
      id: snapshot.reference,
      username: data?['Username'],
      label: data?['Label'],
      iconsIndex: data?['IconsIndex'],
      colorsIndex: data?['ColorsIndex'],
      count: data?['Count'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "Username": username,
      "Label": label,
      "IconsIndex": iconsIndex,
      "ColorsIndex": colorsIndex,
      "Count": count,
    };
  }

  VisitCounter copyWith({
    String? username,
    String? label,
    int? iconsIndex,
    int? colorsIndex,
    int? count,
  }) {
    return VisitCounter(
      username: username ?? this.username,
      label: label ?? this.label,
      iconsIndex: iconsIndex ?? this.iconsIndex,
      colorsIndex: colorsIndex ?? this.colorsIndex,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [username, label, iconsIndex, colorsIndex, count];
}

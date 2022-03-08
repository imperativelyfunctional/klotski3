import 'package:klotski/game/components/piece.dart';

class PiecePosition {
  final int index;
  final PieceInfo info;

  PiecePosition({required this.index, required this.info});

  PiecePosition.fromJson(Map<String, dynamic> json)
      : index = json['index'] as int,
        info = PieceInfo.values[json['info'] as int];

  Map<String, dynamic> toJson() => {
        'index': index,
        'info': info.index,
      };
}

class Mission {
  final int id;
  final String name;
  final List<PiecePosition> piecePositions;

  Mission({required this.id, required this.name, required this.piecePositions});

  Mission.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'],
        piecePositions = (json['positions'] as List)
            .map((e) => PiecePosition.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'positions': piecePositions.map((e) => e.toJson()).toList(),
      };
}

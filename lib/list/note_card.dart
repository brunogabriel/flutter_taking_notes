import 'package:flutter/material.dart';

import '../data/model/note.dart';

final _cardColors = [
  const Color(0xFF8CB230),
  const Color(0xFF0F6AC0),
  const Color(0xFFEED535),
  const Color(0xFFED6EC7),
  const Color(0xFFD04164),
  const Color(0xFFFD7D24),
  const Color(0xFF748FC9),
  const Color(0xFF62B957),
  const Color(0xFF61CEC0),
  const Color(0xFFA552CC),
];

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _cardColors[index % _cardColors.length];
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(note.content, style: textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: title,
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (title) => title != null && title.isEmpty
                  ? 'Title cannot be empty'
                  : null,
              onChanged: onChangedTitle,
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 6,
              initialValue: description,
              style: textTheme.bodyLarge,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type something...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (title) => title != null && title.isEmpty
                  ? 'Content cannot be empty'
                  : null,
              onChanged: onChangedDescription,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

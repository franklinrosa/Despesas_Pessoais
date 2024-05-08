import 'dart:math';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Color.fromARGB(255, 108, 29, 24),
    Color.fromARGB(255, 129, 33, 146),
    Color.fromARGB(255, 105, 105, 105),
    Color.fromARGB(255, 0, 36, 194),
    Color.fromARGB(255, 71, 43, 1),
    Colors.deepPurple,
    Color.fromARGB(255, 150, 3, 109),
    Color.fromARGB(255, 108, 81, 0),
    Color.fromARGB(255, 82, 55, 155),
    Color.fromARGB(255, 73, 100, 114),
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(10);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          //backgroundColor: const Color.fromARGB(255, 53, 30, 92),
          radius: 35,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${widget.tr.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat("d 'de' MMMM 'de' y", 'pt_BR').format(widget.tr.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.deepPurpleAccent,
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}

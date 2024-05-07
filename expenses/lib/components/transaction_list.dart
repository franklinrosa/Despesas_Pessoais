import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nenhuma Transação!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // height: 250,
                  child: Image.asset(
                    'assets/money.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 53, 30, 92),
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$${tr.value.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat("d 'de' MMMM 'de' y", 'pt_BR').format(tr.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.deepPurpleAccent,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

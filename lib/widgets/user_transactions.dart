// import 'package:flutter/material.dart';
// import '../model/transaction.dart';
// import './new_transaction.dart';
// import './transaction_list.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _transactions = [
//     Transaction(id: '1', title: 'Meal', amount: 200, date: DateTime.now()),
//     Transaction(id: '2', title: 'New Phone', amount: 100, date: DateTime.now()),
//     Transaction(
//         id: '3', title: 'Work Shoes', amount: 300, date: DateTime.now()),
//     Transaction(id: '4', title: 'Coffee', amount: 150, date: DateTime.now()),
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//         id: DateTime.now().toString(),
//         title: txTitle,
//         amount: txAmount,
//         date: DateTime.now());

//     setState(() {
//       _transactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       NewTransaction(newTxHandler: _addNewTransaction),
//       TransactionList(
//         transactions: _transactions,
//       ),
//     ]);
//   }
// }

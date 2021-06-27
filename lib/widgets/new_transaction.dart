import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxHandler;
  NewTransaction({required this.newTxHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _datePicked;

  void _saveTransaction() {
    final title = _titleController.value.text;
    final amount = double.parse(_amountController.value.text);
    if (title.isEmpty || amount <= 0 || _datePicked == null) return;

    widget.newTxHandler(title, amount, _datePicked);
    Navigator.of(context).pop();
  }

  void _showDatePicker() async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _datePicked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                textInputAction: TextInputAction.go,
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) => _saveTransaction(),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _datePicked == null
                          ? 'No date chosen!'
                          : 'Choosen date: ${DateFormat.yMMMd().format(_datePicked!)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                      child: Text('Choose date'),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _saveTransaction,
                child: Text('Add transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

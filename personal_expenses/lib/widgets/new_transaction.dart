import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransactionState');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text == null) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() => _selectedDate = pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isIOS) ...[
                CupertinoTextField(
                  placeholder: 'Title',
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoTextField(
                  placeholder: 'Amount',
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitData(),
                )
              ] else ...[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitData(),
                )
              ],
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}

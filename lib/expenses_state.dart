import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
        title: 'flutterCourse',
        amount: 30,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 300,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpenses(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpenses.indexOf(expense);
    setState(() {
      _registredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted'),
        action: SnackBarAction(label: 'undo', onPressed: (){
          setState(() {
            _registredExpenses.insert(expenseIndex,expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. start adding some'),
    );
    if (_registredExpenses.isNotEmpty) {
      mainContent = Expenselist(
        expenses: _registredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter Expense tracker',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
          )
        ],
      ),
      body: width < 600 ? Column(
        children: [
        Chart(expenses: _registredExpenses),
          Expanded(child: mainContent),
        ],
      ) : Row(children: [
        Expanded(child:  Chart(expenses: _registredExpenses),),
        Expanded(child: mainContent),
      ],)
    );
  }
}

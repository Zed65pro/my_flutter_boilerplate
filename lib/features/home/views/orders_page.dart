import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              DateTimeRange? newDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
                initialDateRange: selectedDateRange,
              );
              if (newDateRange != null) {
                setState(() {
                  selectedDateRange = newDateRange;
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Number of orders
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order #$index'),
            subtitle: Text('Date: ${DateTime.now().subtract(Duration(days: index))}'),
            onTap: () {
              // Navigate to order details
            },
          );
        },
      ),
    );
  }
}

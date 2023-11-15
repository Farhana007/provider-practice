import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_provider/providers/counter_provider.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<CounterProvider>().bgColor,
      appBar: AppBar(
        title: Text("Counter Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Currently Counter number is ${context.watch<CounterProvider>().count}",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().increamentCount();
                    // context.read<CounterProvider>().bgColor;
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().decrementCount();
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

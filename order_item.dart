// @dart=2.9
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded =false;
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(10),child: Column(children: [
      ListTile(title: Text('\$${widget.order.amount}'),
      subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
      trailing:  IconButton(icon: Icon(_expanded?Icons.expand_more:Icons.expand_less),onPressed: (){
        setState(() {
         _expanded=!_expanded;
        });
      },),
      ),
      if(_expanded)Container(padding:EdgeInsets.symmetric(horizontal: 15.0,vertical: 4),height: min(widget.order.products.length*20.0+10,180),
      child: ListView(children: widget.order.products.map((prod)=>Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
        Text(prod.title,style: TextStyle(
    fontSize: 18,
          fontWeight: FontWeight.bold,
    ),),
        Text('${prod.quantity}x \$${prod.price}')
      ],)).toList(),),
      )
    ],),);
  }
}

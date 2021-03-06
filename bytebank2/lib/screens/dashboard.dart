import 'package:bytebank2/screens/contacts_list.dart';
import 'package:bytebank2/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: Column(
          // Alinhamento horizontal.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // Alinhamento vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Container(
              height: 130,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _FeatureItem(
                      'Transfer',
                      Icons.monetization_on,
                      onClick: () => _showContactList(context),
                    ),
                    _FeatureItem(
                      'Transfer feed',
                      Icons.description,
                      onClick: () => _showTransactionsList(context),
                    ),
                  ],
                ),
            ),

          ],
        ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

void _showContactList(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ContactsList(),
    ),
  );

}

class _FeatureItem extends StatelessWidget{

  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap:() => onClick(),
          child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

}
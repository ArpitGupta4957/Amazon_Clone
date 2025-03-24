import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBar extends StatefulWidget {
  const AddressBar({Key? key}) : super(key: key);

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [
            Color(0xff2c3b3a),
            Color(0xff2e6968),
          ],
          stops: [0.5, 1.0 ],
        ),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 20,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 5,top: 2),child: Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),)
        ],
      ),
    );
  }
}

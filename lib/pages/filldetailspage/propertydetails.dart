import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;
import 'package:uuid/uuid.dart';

class FillPropertyDetails extends StatefulWidget {
  final int getindex;
  const FillPropertyDetails({Key? key, required this.getindex})
      : super(key: key);

  @override
  State<FillPropertyDetails> createState() => _FillPropertyDetailsState();
}

class _FillPropertyDetailsState extends State<FillPropertyDetails> {
  TextEditingController _Propertyname = TextEditingController();
  TextEditingController _Propertyaddress = TextEditingController();
  TextEditingController _Propertysize = TextEditingController();
  TextEditingController _Propertdescription = TextEditingController();
  TextEditingController _Propertyrprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Property Details'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _Propertyname,
            decoration: const InputDecoration(
              hintText: 'Property Name',
            ),
          ),
          TextFormField(
            controller: _Propertyrprice,
            decoration: const InputDecoration(
              hintText: 'Property Price',
            ),
          ),
          TextFormField(
            controller: _Propertyaddress,
            decoration: const InputDecoration(
              hintText: 'Property Address',
            ),
          ),
          TextFormField(
            controller: _Propertysize,
            decoration: const InputDecoration(
              hintText: 'Property Size',
            ),
          ),
          TextFormField(
            controller: _Propertdescription,
            decoration: const InputDecoration(
              hintText: 'Property Description',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              provider.addProperty(Property(
                  name: _Propertyname.text,
                  address: _Propertyaddress.text,
                  description: _Propertdescription.text,
                  price: _Propertyrprice.text,
                  image: '',
                  size: _Propertysize.text,
                  status: _Propertysize.text.isNotEmpty
                      ? _Propertysize.text
                      : 'empty',
                  index: widget.getindex,
                  propertyId: const Uuid().v4(),
                  rentee: Rentee(
                    renteeId: const Uuid().v4(),
                    agreementimage: '',
                    businessdetail: '',
                    citizenimage: '',
                    renteeContact: '',
                    renteeEmail: '',
                    renteeName: '',
                  )));
              Navigator.pushNamed(context, route.RouteManager.home);
              provider.setAllTrue(widget.getindex);
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, route.RouteManager.home);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

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
  final TextEditingController _propertyName = TextEditingController();
  final TextEditingController _propertyAddress = TextEditingController();
  final TextEditingController _propertySize = TextEditingController();
  final TextEditingController _propertyDescription = TextEditingController();
  final TextEditingController _propertyPrice = TextEditingController();
  final TextEditingController _propertyStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Property Details'),
        automaticallyImplyLeading: false,
      ),
      body:
          //willpopscope is used to prevent back button from slide
          WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: [
            TextFormField(
              controller: _propertyName,
              decoration: const InputDecoration(
                hintText: 'Property Name',
              ),
            ),
            TextFormField(
              controller: _propertyPrice,
              decoration: const InputDecoration(
                hintText: 'Property Price',
              ),
            ),
            TextFormField(
              controller: _propertyAddress,
              decoration: const InputDecoration(
                hintText: 'Property Address',
              ),
            ),
            TextFormField(
              controller: _propertySize,
              decoration: const InputDecoration(
                hintText: 'Property Size',
              ),
            ),
            TextFormField(
              controller: _propertyDescription,
              decoration: const InputDecoration(
                hintText: 'Property Description',
              ),
            ),
            TextFormField(
              controller: _propertyStatus,
              decoration: const InputDecoration(
                hintText: 'Status',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                provider.addProperty(
                  Property(
                    name: _propertyName.text,
                    address: _propertyAddress.text,
                    description: _propertyDescription.text,
                    price: _propertyPrice.text,
                    image: '',
                    size: _propertySize.text,
                    //yesai ho herna test garns cha
                    status: _propertyStatus.text,
                    index: widget.getindex,
                    propertyId: const Uuid().v4(),
                    fieldStatus: '',
                    rentee: Rentee(
                      renteeId: const Uuid().v4(),
                      agreementimage: '',
                      businessdetail: '',
                      citizenimage: '',
                      renteeContact: '',
                      renteeEmail: '',
                      renteeName: '',
                    ),
                  ),
                );
                print('Index at fill : ${widget.getindex}');
                Navigator.pushNamed(context, route.RouteManager.home);
                provider.setIndexTrue(widget.getindex);
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
      ),
    );
  }
}

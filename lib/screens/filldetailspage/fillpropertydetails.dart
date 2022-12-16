import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
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
  TextEditingController _propertyName = TextEditingController();
  TextEditingController _propertyAddress = TextEditingController();
  TextEditingController _propertySize = TextEditingController();
  TextEditingController _propertyDescription = TextEditingController();
  TextEditingController _propertyPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Property Details'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _propertyName,
            decoration: const InputDecoration(
              hintText: 'Property Name',
            ),
          ),
          TextFormField(
            controller: _propertyPrice,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          ElevatedButton(
            onPressed: () {
              provider.addProperty(
                Property(
                  propertyName: _propertyName.text,
                  address: _propertyAddress.text,
                  description: _propertyDescription.text,
                  price: int.parse(_propertyPrice.text),
                  image: '',
                  size: _propertySize.text,
                  //yesai ho herna test garns cha
                  status: 'paid',
                  index: widget.getindex,
                  propertyId: const Uuid().v4(),
                  fieldStatus: true,
                  rentee: Rentee(
                      renteeId: const Uuid().v4(),
                      agreementimage: '',
                      businessdetail: '',
                      citizenimage: '',
                      renteeContact: '',
                      renteeEmail: '',
                      renteeName: '',
                      renteePayment: Payment(
                          paymentId: const Uuid().v4(),
                          paymentNote: '',
                          paymentDate: null)),
                ),
              );
              print('Index at fill : ${widget.getindex}');
              Navigator.pushNamed(context, route.RouteManager.home);
              // provider.setboolVal(widget.getindex).then(
              //       (value) => provider.getboolVal(),
              //     );

              //provider.getIndexTrue(widget.getindex);
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

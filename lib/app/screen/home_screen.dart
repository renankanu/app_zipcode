import 'dart:async';

import 'package:app_zipcode/app/model/address_model.dart';
import 'package:app_zipcode/app/repository/address_repository.dart';
import 'package:app_zipcode/app/widgets/shimmer_address.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var streamAddress = StreamController<List<AddressModel>>();
  AddressRepository addressRepository;

  @override
  void initState() {
    super.initState();
    addressRepository = AddressRepository();
  }

  @override
  void dispose() {
    streamAddress.close();
    super.dispose();
  }

  getAddress() async {
    streamAddress.sink.add(null);
    try {
      List<AddressModel> address = await addressRepository.searchAddress();
      streamAddress.sink.add(address);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                minWidth: 200,
                onPressed: getAddress,
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Buscar'),
              ),
              StreamBuilder(
                initialData: List<AddressModel>(),
                stream: streamAddress.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<AddressModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return ShimmerAddress();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return Visibility(
                            visible: snapshot.data.isNotEmpty,
                            replacement: Text('Sem dados'),
                            child: ListTile(
                              leading: Icon(
                                Icons.location_city,
                                size: 50,
                              ),
                              title: Text(snapshot.data[index].logradouro),
                              subtitle: Text(snapshot.data[index].bairro),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

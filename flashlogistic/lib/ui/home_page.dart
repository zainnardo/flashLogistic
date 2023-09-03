import 'package:flashlogistic/common/images.dart';
import 'package:flashlogistic/common/navigation.dart';
import 'package:flashlogistic/common/router.dart';
import 'package:flashlogistic/common/styles.dart';
import 'package:flashlogistic/provider/delivery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _deliveryNumCtrl = TextEditingController();
  final FocusNode _deliveryNumFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final delivProv = Provider.of<DeliveryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          width: 300,
          child: Image.asset(imgLogo),
        ),
        backgroundColor: Palette.primeColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgPrimaryBg), fit: BoxFit.fill),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _deliveryNumCtrl,
                  focusNode: _deliveryNumFocus,
                  onFieldSubmitted: (term) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: darkOrange, width: 2.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: primaryGrey),
                    hintText: "Delivery Number",
                    fillColor: primaryWhite,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: primaryOrange, width: 2.0),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please input delivery\n number',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: darkOrange, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkOrange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text('Search Delivery',
            textScaleFactor: 1.0,
            style:
                TextStyle(fontSize: 14, color: primaryBlack, letterSpacing: 2)),
        onPressed: () {
          delivProv.getDataDelivery(_deliveryNumCtrl.text);
        },
      ),
    );
  }
}

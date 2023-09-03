import 'package:flashlogistic/common/images.dart';
import 'package:flashlogistic/common/router.dart';
import 'package:flashlogistic/common/styles.dart';
import 'package:flutter/material.dart';

import '../../common/navigation.dart';

class DataDeliveryPage extends StatefulWidget {
  const DataDeliveryPage({super.key});

  @override
  State<DataDeliveryPage> createState() => _DataDeliveryPageState();
}

class _DataDeliveryPageState extends State<DataDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //NOTE: App Bar
          SliverAppBar(
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: primaryWhite,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Palette.primeColor,
            elevation: 0,
            pinned: true,
            centerTitle: true,
            expandedHeight: 180.0,
            stretch: true,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [
                // StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Image(
                image: AssetImage(imgHeaderList),
                fit: BoxFit.cover,
              ),
            ),
            title: SizedBox(
              height: 50,
              width: 200,
              child: Image.asset(imgLogoWhite),
            ),
          ),
          //== Title Delivery ==
          const SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Palette.primeColor,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(-8.0),
              child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Number :',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                        color: accentOrange,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                      SizedBox(width: 10),
                      Text('Delivery Start Time :',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: accentOrange,
                        fontSize: 17,
                        fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //TODO: Data-Data Delivery
                    Text('Nomor Delivery',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: accentOrange,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
                    // SizedBox(width: 25),
                    Text('Waktu Mulai',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: accentOrange,
                      fontSize: 17,
                      fontWeight: FontWeight.w300)),
                    ],
                  ),
                 ),
               ],
             ),
            ),
          ),
          //== List Content ==
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int Index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryGrey,
                    ),
                    height: 100,
                    width: 200,
                    // color: primaryBlack,
                    child: Text('COBA'),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size(MediaQuery.of(context).size.width ,MediaQuery.of(context).size.height),
          fixedSize: Size(300 ,40),
          backgroundColor: darkOrange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        //TODO: IF server == true change the validation case for name button!
        child: Text('Start Delivery',
            textScaleFactor: 1.0,
            style:
                TextStyle(fontSize: 14, color: primaryBlack, letterSpacing: 2)),
        onPressed: () {
          //TODO: 
          Navigation.pushNoData(deliveryRoute);
        },
      ),
    );
  }
}

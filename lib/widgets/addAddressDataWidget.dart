import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:provider/provider.dart';

import '../pages/add_address.dart';

class AddAddressDataWidget extends StatefulWidget {
  const AddAddressDataWidget({super.key});

  @override
  State<AddAddressDataWidget> createState() => _AddAddressDataWidgetState();
}

class _AddAddressDataWidgetState extends State<AddAddressDataWidget> {

  @override
  Widget build(BuildContext context) {
   List<String>? addressResult = context.watch<BuyNowController>().result;

    return InkWell(
        onTap: ()async{
        await context.read<BuyNowController>().getDataFromAddressPage(context);
          
        },
        child: Container(
            width: 330.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: MyColors.normal, width: 1.w)),
            child: (addressResult == null) ? BeforeAddAddressDataWidget() : afterAddAddressDataWidget(addressResult: addressResult)));
  }

  Widget afterAddAddressDataWidget({required List<String> addressResult}) {
    return Row(
      children: [
        Icon(
          Icons.home,
          color: MyColors.normal,
          size: 80.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                   addressResult[0],
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.normal),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    addressResult[1],
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.normal),
                  ),
                ],
              ),
              Text(
              addressResult[2],
                style: TextStyle(fontSize: 14.sp, color: MyColors.hint),
              ),
              Expanded(
                child: Container(
                  width: 200.w,
                  child: Text(
                    addressResult[3],
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: MyColors.hint,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BeforeAddAddressDataWidget extends StatelessWidget {
  const BeforeAddAddressDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline,
            size: 34.sp,
            color: MyColors.normal,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Add Address",
            style: TextStyle(
                color: MyColors.normal,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

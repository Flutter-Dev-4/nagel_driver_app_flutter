import 'package:driver_app/export.dart';


class CustomerItemDialogue extends StatefulWidget {
  const CustomerItemDialogue({super.key});

  @override
  State<CustomerItemDialogue> createState() => _CustomerItemDialogueState();
}

class _CustomerItemDialogueState extends State<CustomerItemDialogue> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: AppColor.white,
          contentPadding: EdgeInsets.all(10.sp),
          title: AppTextRegular(
            title: appLocale.customerInventoryItems,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryBlack,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.grey40,
                      )
                    ),
                    height: 50.h,
                    padding: EdgeInsets.all(12.sp),
                    child: AppTextMedium(title: appLocale.roomOne, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.primaryBlack,),
                  ),
                  10.x,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.grey40,
                      )
                    ),
                    height: 50.h,
                    padding: EdgeInsets.all(12.sp),
                    child: AppTextMedium(title: appLocale.roomTwo, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.primaryBlack,),
                  ),
                  10.x,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.grey40,
                      )
                    ),
                    height: 50.h,
                    padding: EdgeInsets.all(12.sp),
                    child: AppTextMedium(title: appLocale.roomThree, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.primaryBlack,),
                  ),
                ],
              ),
              20.y,
              Table(
                border: TableBorder.all(
                    color: AppColor.grey40,
                    borderRadius:
                    BorderRadius.circular(10.r)),
                columnWidths: const {
                  0: FixedColumnWidth(45.0),
                  1: FixedColumnWidth(120.0),
                  2: FixedColumnWidth(70.0),
                  3: FixedColumnWidth(75.0),
                },
                children: [
                  // Table Header Row
                  TableRow(
                    decoration: BoxDecoration(
                        color: AppColor.grey40,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        )),
                    children: [
                      headerCell(appLocale.sNo),
                      headerCell(appLocale.productName),
                      headerCell(appLocale.size),
                      headerCell(appLocale.quality),
                    ],
                  ),
                  // Table Data Rows
                  tableRow(appLocale.one, appLocale.endTable, '2x2', appLocale.two),
                  tableRow(appLocale.two, appLocale.floorLamp, appLocale.approxTall, appLocale.one),
                  tableRow(appLocale.three, appLocale.flatPanelTV, '32to45inch', appLocale.one),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerCell(String text) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: AppTextRegular(
        title: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryBlack,
        textAlign: TextAlign.center,
      ),
    );
  }

  // Helper to create data rows
  TableRow tableRow(String id, String name, String size, quantity) {
    return TableRow(
      children: [
        dataCell(id, TextAlign.center),
        dataCell(name, TextAlign.start),
        dataCell(size, TextAlign.start),
        dataCell(quantity, TextAlign.start),
      ],
    );
  }

  // Helper to create data cells
  Widget dataCell(String text, TextAlign? textAlign) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: AppTextMedium(
          title: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryBlack,
          textAlign: textAlign),
    );
  }

}

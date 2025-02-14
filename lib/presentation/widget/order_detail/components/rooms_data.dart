import 'package:driver_app/export.dart';

class RoomsData extends StatefulWidget {
  const RoomsData({super.key});

  @override
  State<RoomsData> createState() => _RoomsDataState();
}

class _RoomsDataState extends State<RoomsData> {
  List<bool> expandedState = List.generate(4, (index) => index == 0);
  List<MultipleImagePickerCubit> imagePickers =
      List.generate(4, (index) => MultipleImagePickerCubit());

  @override
  void dispose() {
    for (var cubit in imagePickers) {
      cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return BlocProvider<MultipleImagePickerCubit>(
      create: (context) => MultipleImagePickerCubit(),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          int roomIndex = index + 1;
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColor.grey30,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextRegular(
                        title: '${appLocale.room} $roomIndex',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryBlack,
                      ),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.red,
                        ),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                expandedState[index] = !expandedState[index];
                              });
                            },
                            icon: Icon(
                              expandedState[index]
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              color: AppColor.white,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (expandedState[index])
                    10.y,
                  if (expandedState[index])
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                          color: AppColor.grey40,
                          borderRadius: BorderRadius.circular(10.r)),
                      columnWidths: const {
                        0: FixedColumnWidth(45.0),
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
                        tableRow(appLocale.one, appLocale.endTable, '2’ x 2’',
                            appLocale.two),
                        tableRow(appLocale.two, appLocale.floorLamp,
                            appLocale.approxTall, appLocale.one),
                        tableRow(appLocale.three, appLocale.flatPanelTV,
                            '32 to 45 inch', appLocale.one),
                      ],
                    ),
                  if (expandedState[index])
                    10.y,
                  if (expandedState[index])
                    BlocProvider.value(
                      value: imagePickers[
                          index], // Provide a unique cubit for each room
                      child:
                          BlocBuilder<MultipleImagePickerCubit, List<XFile>?>(
                        builder: (context, state) {
                          return state != null
                              ? SizedBox(
                                  height: 80.h,
                                  child: ListView(
                                    padding: EdgeInsets.all(5.sp),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<MultipleImagePickerCubit>()
                                              .logoBottomSheet(context);
                                        },
                                        child: DottedBorder(
                                          padding: EdgeInsets.zero,
                                          color: AppColor.grey10,
                                          strokeWidth: 3,
                                          dashPattern: [6, 3],
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(8.r),
                                          child: Container(
                                            height: 80.h,
                                            width: 80.w,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20.h,
                                                horizontal: 10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: AppColor.grey30,
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  AppImages.upload),
                                            ),
                                          ),
                                        ),
                                      ),
                                      10.y,
                                      Wrap(
                                        spacing: 8.w, // Space between images
                                        runSpacing: 8.h,
                                        children: state.isNotEmpty
                                            ? state.map((file) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => Dialog(
                                                          child: InteractiveViewer(
                                                            child: Image.file(
                                                              File(file.path),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Image(
                                                      height: 80.h,
                                                      width: 80.w,
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                          File(file.path)),
                                                    ),
                                                  ),
                                                );
                                              }).toList()
                                            : [],
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                            onTap: () {
                              context
                                  .read<MultipleImagePickerCubit>()
                                  .logoBottomSheet(context);
                            },
                                child: DottedBorder(
                                    padding: EdgeInsets.zero,
                                    color: AppColor.grey10,
                                    strokeWidth: 3,
                                    dashPattern: [6, 3],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(8.r),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: AppColor.grey30,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(AppImages.upload),
                                            10.x,
                                            Expanded(
                                              child: AppTextMedium(
                                                title:
                                                    appLocale.takeAPhotoAndUpload,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.grey50,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
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

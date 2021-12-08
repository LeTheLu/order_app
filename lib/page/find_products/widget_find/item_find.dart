import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:order_app/controllers/find_products_controller.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';


class ItemFind extends StatelessWidget {
  final int index;
  const ItemFind({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindProductsController>(
      init: FindProductsController(),
      builder: (controller) {
        return InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          onTap: (){
            Get.toNamed(Routes.BEVERAGES, arguments: controller.list[index]["id"]);
          },
          child: Container(
              height: 189.11,
              width: 174.5,
              decoration: BoxDecoration(
                  color: ColorApp.listColors[index].withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  border: Border.all(
                      color: ColorApp.listColors[index],
                      width: 1
                  )
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      controller.list[index]["img"] ?? "",
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const Center(child: CircularProgressIndicator());
                        // You can use LinearProgressIndicator or CircularProgressIndicator instead
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Text('Some errors occurred!'),
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    width: 124,
                    child: Text(controller.list[index]["id"] ?? "", overflow: TextOverflow.clip,style: const TextStyle(fontSize: 16, fontFamily: "GilroyBold"),),
                  )
                ],
              )
          ),
        );
      }
    );
  }
}


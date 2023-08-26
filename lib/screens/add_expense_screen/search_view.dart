import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/setting_enum.dart';
import '../../models/setting_model.dart';
import '../../providers/custom_widget_pos_provider/custom_widget_pos_provider.dart';
import '../../providers/settings/setting_manager.dart';

class SearchView extends ConsumerWidget {
  final TextEditingController _categoryController;
  final TextEditingController _subCategoryController;
  const SearchView({
    required TextEditingController categoryController,
    required TextEditingController subCategoryController,
    Key? key,
  }) :
        _subCategoryController = subCategoryController,
        _categoryController = categoryController,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  /// show search widget
      Consumer(builder: (context,ref,child){
        final pos = ref.watch(customWidgetPosPProvider);
        final settings = ref.watch(settingManagerProvider);

        final searchKey = pos.$1 == SettingEnum.category ? _categoryController : _subCategoryController;
        if(pos.$2 == Offset.zero){
          return const SizedBox();
        }
        return Consumer(
          builder: (context,ref,child){
            return Container(
              margin: EdgeInsets.only(top: pos.$2.dy,left: context.width*.02,right: context.width*.02),
              // padding: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: Theme.of(context).canvasColor
                  gradient: LinearGradient(colors: [
                    Colors.blue.withOpacity(.1),
                    Colors.blueGrey.withOpacity(.1)
                  ])
                  ),
               child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  searchKey.text.isNotEmpty? Card(

                    elevation: .6,
                    surfaceTintColor: Colors.blue,
                    child: ListTile(visualDensity: VisualDensity.compact,
                      // tileColor: Theme.of(context).colorScheme.surfaceVariant,
                      title: Text(searchKey.text),
                      trailing: IconButton(
                        icon:const Icon(Icons.check_circle_outline),
                        onPressed: () {
                          ref.read(settingManagerProvider.notifier).addNewSetting(
                              SettingModel(type: pos.$1.name, name: searchKey.text.firstCharToUpper.trim()));
                          ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                        },),
                    ),
                  ): const SizedBox(),
                  Container(
                    padding: EdgeInsets.only(bottom: context.height*.01),
                    constraints: BoxConstraints(
                        minWidth: context.width*.9,
                        maxWidth: context.width,
                        // minHeight: context.height *.1,
                        maxHeight: context.height*.23
                    ),
                  child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: settings.length,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: .2,
                            child: ListTile(
                              dense: true,visualDensity: VisualDensity.compact,
                              // tileColor: Theme.of(context).colorScheme.surfaceVariant,
                              title: Text(settings[index].name),
                              subtitle: Text(settings[index].type),
                              onTap: (){
                                searchKey.text = settings[index].name;
                                ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                              },
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } ,);
      });
  }
}

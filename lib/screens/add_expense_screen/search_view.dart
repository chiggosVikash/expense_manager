import 'package:expense_manager/extensions/media_query_extension.dart';
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
        return Positioned(
          // left: pos.dx,
            top: pos.$2.dy,
            child: Consumer(
              builder: (context,ref,child){
                return Container(
                  constraints: BoxConstraints(
                      minWidth: context.width*.9,
                      maxWidth: context.width,
                      minHeight: context.height *.2,
                      maxHeight: context.height*.3
                  ),
                  // width: context.width,
                  // height: context.height*.3,
                  child: Card(
                    child: Column(
                      children: [
                        searchKey.text.isNotEmpty ? ListTile(title: Text(searchKey.text),
                          trailing: IconButton(
                            icon:const Icon(Icons.check_circle_outline),
                            onPressed: () {
                              ref.read(settingManagerProvider.notifier).addNewSetting(SettingModel(type: pos.$1.name, name: searchKey.text));
                              ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                            },),
                        ): const SizedBox(),
                        Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                              itemCount: settings.length,
                              itemBuilder: (context,index){
                                return ListTile(
                                  title: Text(settings[index].name),
                                  subtitle: Text(settings[index].type),
                                  onTap: (){
                                    searchKey.text = settings[index].name;
                                    ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                                  },
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
              } ,)
        );
      });
  }
}

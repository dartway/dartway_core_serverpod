import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_generic_forms/nit_generic_forms.dart';

extension GenericFormsExtension on WidgetRef {
  NitGenericEntityManager<Entity> dwGenericEntityManager<
    Entity extends SerializableModel
  >({bool allowDelete = false}) => NitGenericEntityManager(
    saveAction: (model) async => await saveModel<Entity>(model),
    deleteAction:
        allowDelete ? (model) async => await deleteModel<Entity>(model) : null,
  );
}

class DwAdminEntityManagerBlock<
  Entity extends SerializableModel,
  FormDescriptor extends NitGenericFormsFieldsEnum<Entity>
>
    extends ConsumerWidget {
  const DwAdminEntityManagerBlock({
    super.key,
    required this.fields,
    required this.listViewBuilder,
    required this.editingFormPresenter,
    this.customBackendFilter,
    this.defaultValuesProvider,
    required this.allowDelete,
  });

  final List<FormDescriptor> fields;
  final Widget Function({required Entity model}) listViewBuilder;

  final DwBackendFilter? customBackendFilter;
  final Function(BuildContext context, Widget editingForm) editingFormPresenter;
  final Future<Map<FormDescriptor, dynamic>> Function(WidgetRef ref)?
  defaultValuesProvider;
  final bool allowDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        InfiniteListView(
          listViewConfig: DwEntityListStateConfig<Entity>(
            backendFilter: customBackendFilter,
            pageSize: 20,
          ),
          listTileBuilder:
              (context, model) => Card(
                child: Row(
                  children: [
                    IconButton(
                      onPressed:
                          () async => editingFormPresenter(
                            context,
                            NitGenericForm<Entity, FormDescriptor>(
                              fields: fields,
                              model: model,
                              entityManager: ref.dwGenericEntityManager(
                                allowDelete: allowDelete,
                              ),
                            ),
                          ),
                      icon: const Icon(Icons.edit),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: listViewBuilder(model: model),
                      ),
                    ),
                  ],
                ),
              ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FilledButton(
            onPressed:
                () async =>
                    !context.mounted
                        ? {}
                        : editingFormPresenter(
                          context,
                          NitGenericForm<Entity, FormDescriptor>(
                            fields: fields,
                            model: null,
                            entityManager: ref.dwGenericEntityManager<Entity>(),
                            defaultValues: await defaultValuesProvider?.call(
                              ref,
                            ),
                          ),
                        ),
            child: const Text('Добавить'),
          ),
        ),
      ],
    );
  }
}

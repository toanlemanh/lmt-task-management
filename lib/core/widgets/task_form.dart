
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_project/features/tasks/model/task_category.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../features/tasks/model/priority_enum.dart';
import '../../features/tasks/model/task_difficulty.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() {
    return _TaskFormState();
  }
}

class _TaskFormState extends State<TaskForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _titleHasError = true;
  bool _detailHasError = true;
  bool _categoryHasError = false;

  var categoryOptions = TaskCategory.values;

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.always,
            initialValue: {
              'priorityEnum': TaskPriority.veryLow.value,
              'categoryEnum': TaskCategory.work.label,
              'difficultyEnum': TaskDifficulty.veryEasy.value,
              'isDone': false,
              'startDate': DateTime.now(),
              'createDate': DateTime.now(),
              'isActive': true,
            },
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'title',
                  decoration: InputDecoration(
                    labelText: 'Title',
                    suffixIcon: _titleHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _titleHasError =
                      !(_formKey.currentState?.fields['title']?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.max(70),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'detail',
                  decoration: InputDecoration(
                    labelText: 'Detail',
                    suffixIcon: _detailHasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _detailHasError =
                      !(_formKey.currentState?.fields['detail']?.validate() ??
                          false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.max(500),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                FormBuilderField<DateTime>(
                  name: 'createDate',
                  initialValue: DateTime.now(),
                  builder: (FormFieldState<DateTime?> field) {
                    return const SizedBox.shrink(); // Hides the field from UI
                  },
                ),
                FormBuilderDateRangePicker(
                  name: 'date_range',
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2030),
                  format: DateFormat('yyyy-MM-dd'),
                  onChanged: _onChanged,
                  decoration: InputDecoration(
                    labelText: 'Date Range',
                    helperText: 'ex: 2025-05-05 - 2025-05-10',
                    hintText: 'Start date - Estimate date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _formKey.currentState!.fields['date_range']
                            ?.didChange(null);
                      },
                    ),
                  ),
                ),
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  initialValue: false,
                  onChanged: _onChanged,
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'I have read and agree to the ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: Colors.blue),
                          // Flutter doesn't allow a button inside a button
                          // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                          /*
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('launch url');
                            },
                          */
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.equal(
                    true,
                    errorText:
                    'You must accept terms and conditions to continue',
                  ),
                ),
                FormBuilderDropdown<String>(
                  name: 'categoryEnum',
                  decoration: InputDecoration(
                    labelText: 'Category',
                    suffix: _categoryHasError
                        ? const Icon(Icons.error)
                        : const Icon(Icons.check),
                    hintText: 'Select category',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: categoryOptions
                      .map((category) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: category.label,
                    child: Text(category.label),
                  ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _categoryHasError = !(_formKey
                          .currentState?.fields['categoryEnum']
                          ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                //Feature: Alert
                FormBuilderSwitch(
                  title: const Text('I Accept the terms and conditions'),
                  name: 'accept_terms_switch',
                  initialValue: true,
                  onChanged: _onChanged,
                ),
                FormBuilderChoiceChips<int>(
                  name: 'difficultyEnum',
                  decoration: const InputDecoration(
                    labelText: 'Difficulty',
                  ),
                  options: List.generate(TaskDifficulty.values.length, (i) => i + 1)
                      .map(
                        (number) => FormBuilderChipOption(
                      value: number,
                      child: Text(TaskDifficulty.fromValue(number).label),
                    ),
                  )
                      .toList(),
                  spacing: 8,
                  selectedColor: Colors.deepPurple,
                ),
                FormBuilderChoiceChips<int>(
                  name: 'priorityEnum',
                  decoration: const InputDecoration(
                    labelText: 'Priority',
                  ),
                  options: List.generate(TaskPriority.values.length, (i) => i + 1)
                      .map(
                        (number) => FormBuilderChipOption(
                      value: number,
                      child: Text(TaskPriority.fromValue(number).label),
                    ),
                  )
                      .toList(),
                  spacing: 8,
                  selectedColor: Colors.deepPurple,
                ),
                //upload image
              ],
            ),
          ),
          const SizedBox(height: 8),
          //submit button section
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      var isValid = _formKey.currentState?.saveAndValidate() ?? false;
                      if (isValid) {
                        final formData = _formKey.currentState?.value;
                        //call viewmodel
                        debugPrint(_formKey.currentState?.value.toString());
                      } else {
                        debugPrint(_formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                    child: const Text('Submit')),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                  },
                  // color: Theme.of(context).colorScheme.secondary,
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
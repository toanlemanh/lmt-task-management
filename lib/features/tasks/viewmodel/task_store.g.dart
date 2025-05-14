// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
  late final _$_titleAtom =
      Atom(name: '_TaskStoreBase._title', context: context);

  String get title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  String get _title => title;

  bool __titleIsInitialized = false;

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, __titleIsInitialized ? super._title : null,
        () {
      super._title = value;
      __titleIsInitialized = true;
    });
  }

  late final _$_detailAtom =
      Atom(name: '_TaskStoreBase._detail', context: context);

  String get detail {
    _$_detailAtom.reportRead();
    return super._detail;
  }

  @override
  String get _detail => detail;

  bool __detailIsInitialized = false;

  @override
  set _detail(String value) {
    _$_detailAtom
        .reportWrite(value, __detailIsInitialized ? super._detail : null, () {
      super._detail = value;
      __detailIsInitialized = true;
    });
  }

  late final _$_isDoneAtom =
      Atom(name: '_TaskStoreBase._isDone', context: context);

  bool get isDone {
    _$_isDoneAtom.reportRead();
    return super._isDone;
  }

  @override
  bool get _isDone => isDone;

  @override
  set _isDone(bool value) {
    _$_isDoneAtom.reportWrite(value, super._isDone, () {
      super._isDone = value;
    });
  }

  late final _$_categoryEnumAtom =
      Atom(name: '_TaskStoreBase._categoryEnum', context: context);

  String get categoryEnum {
    _$_categoryEnumAtom.reportRead();
    return super._categoryEnum;
  }

  @override
  String get _categoryEnum => categoryEnum;

  bool __categoryEnumIsInitialized = false;

  @override
  set _categoryEnum(String value) {
    _$_categoryEnumAtom.reportWrite(
        value, __categoryEnumIsInitialized ? super._categoryEnum : null, () {
      super._categoryEnum = value;
      __categoryEnumIsInitialized = true;
    });
  }

  late final _$_priorityEnumAtom =
      Atom(name: '_TaskStoreBase._priorityEnum', context: context);

  int get priorityEnum {
    _$_priorityEnumAtom.reportRead();
    return super._priorityEnum;
  }

  @override
  int get _priorityEnum => priorityEnum;

  bool __priorityEnumIsInitialized = false;

  @override
  set _priorityEnum(int value) {
    _$_priorityEnumAtom.reportWrite(
        value, __priorityEnumIsInitialized ? super._priorityEnum : null, () {
      super._priorityEnum = value;
      __priorityEnumIsInitialized = true;
    });
  }

  late final _$_difficultyEnumAtom =
      Atom(name: '_TaskStoreBase._difficultyEnum', context: context);

  int get difficultyEnum {
    _$_difficultyEnumAtom.reportRead();
    return super._difficultyEnum;
  }

  @override
  int get _difficultyEnum => difficultyEnum;

  bool __difficultyEnumIsInitialized = false;

  @override
  set _difficultyEnum(int value) {
    _$_difficultyEnumAtom.reportWrite(
        value, __difficultyEnumIsInitialized ? super._difficultyEnum : null,
        () {
      super._difficultyEnum = value;
      __difficultyEnumIsInitialized = true;
    });
  }

  late final _$_startDateAtom =
      Atom(name: '_TaskStoreBase._startDate', context: context);

  DateTime get startDate {
    _$_startDateAtom.reportRead();
    return super._startDate;
  }

  @override
  DateTime get _startDate => startDate;

  bool __startDateIsInitialized = false;

  @override
  set _startDate(DateTime value) {
    _$_startDateAtom.reportWrite(
        value, __startDateIsInitialized ? super._startDate : null, () {
      super._startDate = value;
      __startDateIsInitialized = true;
    });
  }

  late final _$_estimateDateAtom =
      Atom(name: '_TaskStoreBase._estimateDate', context: context);

  DateTime get estimateDate {
    _$_estimateDateAtom.reportRead();
    return super._estimateDate;
  }

  @override
  DateTime get _estimateDate => estimateDate;

  bool __estimateDateIsInitialized = false;

  @override
  set _estimateDate(DateTime value) {
    _$_estimateDateAtom.reportWrite(
        value, __estimateDateIsInitialized ? super._estimateDate : null, () {
      super._estimateDate = value;
      __estimateDateIsInitialized = true;
    });
  }

  late final _$_completeDateAtom =
      Atom(name: '_TaskStoreBase._completeDate', context: context);

  DateTime? get completeDate {
    _$_completeDateAtom.reportRead();
    return super._completeDate;
  }

  @override
  DateTime? get _completeDate => completeDate;

  @override
  set _completeDate(DateTime? value) {
    _$_completeDateAtom.reportWrite(value, super._completeDate, () {
      super._completeDate = value;
    });
  }

  late final _$_imagePathAtom =
      Atom(name: '_TaskStoreBase._imagePath', context: context);

  String? get imagePath {
    _$_imagePathAtom.reportRead();
    return super._imagePath;
  }

  @override
  String? get _imagePath => imagePath;

  @override
  set _imagePath(String? value) {
    _$_imagePathAtom.reportWrite(value, super._imagePath, () {
      super._imagePath = value;
    });
  }

  late final _$_isActiveAtom =
      Atom(name: '_TaskStoreBase._isActive', context: context);

  bool get isActive {
    _$_isActiveAtom.reportRead();
    return super._isActive;
  }

  @override
  bool get _isActive => isActive;

  @override
  set _isActive(bool value) {
    _$_isActiveAtom.reportWrite(value, super._isActive, () {
      super._isActive = value;
    });
  }

  late final _$_createDateAtom =
      Atom(name: '_TaskStoreBase._createDate', context: context);

  DateTime get createDate {
    _$_createDateAtom.reportRead();
    return super._createDate;
  }

  @override
  DateTime get _createDate => createDate;

  bool __createDateIsInitialized = false;

  @override
  set _createDate(DateTime value) {
    _$_createDateAtom.reportWrite(
        value, __createDateIsInitialized ? super._createDate : null, () {
      super._createDate = value;
      __createDateIsInitialized = true;
    });
  }

  late final _$_updatedDateAtom =
      Atom(name: '_TaskStoreBase._updatedDate', context: context);

  DateTime? get updatedDate {
    _$_updatedDateAtom.reportRead();
    return super._updatedDate;
  }

  @override
  DateTime? get _updatedDate => updatedDate;

  @override
  set _updatedDate(DateTime? value) {
    _$_updatedDateAtom.reportWrite(value, super._updatedDate, () {
      super._updatedDate = value;
    });
  }

  late final _$_errorAtom =
      Atom(name: '_TaskStoreBase._error', context: context);

  String? get error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  String? get _error => error;

  @override
  set _error(String? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  void setDone() {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setDone');
    try {
      return super.setDone();
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDetail(String detail) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setDetail');
    try {
      return super.setDetail(detail);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String title) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDate(DateTime startDate) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setStartDate');
    try {
      return super.setStartDate(startDate);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstimateDate(DateTime estimateDate) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setEstimateDate');
    try {
      return super.setEstimateDate(estimateDate);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String imagePath) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setImagePath');
    try {
      return super.setImagePath(imagePath);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

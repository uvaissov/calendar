import 'package:calendar/core/base/base_view_model.dart';
import 'package:calendar/core/locator.dart';
import 'package:calendar/core/models/document.dart';
import 'package:calendar/core/services/dialog_service.dart';
import 'package:calendar/core/services/navigator_service.dart';
import 'package:flutter/services.dart';

class AddAndEditViewModel extends BaseViewModel {
  

  AddAndEditViewModel();

  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  Document _edittingDocument;
  int _currentStep = 0;
  bool _complete = false;
  int _stepsLength = 0;
  String _periodCount;
  String _perPeriodSum;
  DateTime _firstPayDate;
  bool _weekendHoliday = true;
  bool _saturdayWork = false;
  String _description;
  String _nameBank;
  String _name;

  Document get edittingDocument => this._edittingDocument;
  bool get isEditting => this._edittingDocument != null;
  String get toolbar =>
      (this._edittingDocument != null ? 'Редактирование' : 'Создание');
  int get currentStep => this._currentStep;
  bool get complete => this._complete;
  int get stepsLength => this._stepsLength;

  get description => this._description;
  set description(String description) { 
    this._description = description; 
    notifyListeners(); 
  }

  get nameBank => this._nameBank;
  set nameBank(String nameBank) { 
    this._nameBank = nameBank; 
    notifyListeners(); 
  }

  get name => this._name;
  set name(String name) { 
    this._name = name; 
    notifyListeners(); 
  }

  get weekendHoliday => this._weekendHoliday;  
  set weekendHoliday(bool weekendHoliday) {
    this._weekendHoliday = weekendHoliday;
    notifyListeners();
  }
  
  get saturdayWork => this._saturdayWork;
  set saturdayWork(bool saturdayWork) {
    this._saturdayWork = saturdayWork;
    notifyListeners();
  }
  

  set firstPayDate(DateTime firstPayDate) {
    this._firstPayDate = firstPayDate;
    notifyListeners();
  }
  DateTime get firstPayDate => this._firstPayDate;

  set periodCount(periodCount) => this._periodCount = periodCount;
  String get periodCount => this._periodCount;

  set perPeriodSum(perPeriodSum) {
    this._perPeriodSum = perPeriodSum;
    notifyListeners();
  }
  String get perPeriodSum => this._perPeriodSum;

  set edittingDocument(Document edittingDocument) {
    this._edittingDocument = edittingDocument;
    notifyListeners();
  }

  set stepsLength(int value) {
    this._stepsLength = value;
    notifyListeners();
  }

  set currentStep(int value) {
    this._currentStep = value;
    notifyListeners();
  }

  set complete(bool value) {
    this._complete = value;
    notifyListeners();
  }

  next() {    
    this.currentStep + 1 != this.stepsLength
        ? goTo(this.currentStep + 1)
        : this.complete = true;
    if (this.complete)
    _dialogService.showDialog(title: 'Заголовок', description: 'Вы добавили задачу', buttonTitle: 'Ок').whenComplete(() => {
      _navigatorService.pop()
    });
  }

  cancel() {
    if (this.currentStep > 0) {
      goTo(this.currentStep - 1);
    }
  }

  goTo(int step) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    this.currentStep = step;
  }

  selectPeriod(dynamic period) {
    print(period);
  }

  // Add ViewModel specific code here
}

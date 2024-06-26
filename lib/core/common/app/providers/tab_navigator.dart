import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TabNavigator extends ChangeNotifier {
  TabNavigator(this._initialPage) {
    _navigationStack.add(_initialPage);
  }

  final TabItem _initialPage;
  final List<TabItem> _navigationStack = [];

  TabItem get currentPage => _navigationStack.last;

  void push(Widget page) {
    _navigationStack.add(TabItem(child: page));
  }

  void pop() {
    if (_navigationStack.length > 1) _navigationStack.removeLast();
    notifyListeners();
  }

  void popToRoot() {
    _navigationStack
      ..clear()
      ..add(_initialPage);
    notifyListeners();
  }

  void popTo(TabItem page) {
    _navigationStack.remove(page);
    notifyListeners();
  }

  void popUntil(TabItem? page) {
    if (page == null) return popToRoot();
    if (_navigationStack.length > 1) {
      _navigationStack.removeRange(1, _navigationStack.indexOf(page) + 1);
      notifyListeners();
    }
  }

  void pushAndRemoveUntil(TabItem page) {
    _navigationStack
      ..clear()
      ..add(page);
  }
}

class TabNavigatorProvider extends InheritedNotifier<TabNavigator> {
  const TabNavigatorProvider({
    required this.navigator,
    required super.child,
    super.key,
  }) : super(notifier: navigator);
  final TabNavigator navigator;

  static TabNavigatorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabNavigatorProvider>();
  }
}

class TabItem extends Equatable {
  TabItem({required this.child}) : id = const Uuid().v1();

  final Widget child;
  final String id;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarState(0)) {
    on<OnTap>((event, emit) {
      emit(NavbarState(event.index));
    });
  }
  List<(String, String)> navItems = [
    ("assets/icons/home_active.svg", "Home"),
    ("assets/icons/category_active.svg", "Shop"),
    ("assets/icons/shopping_cart_active.svg", "My Cart"),
    ("assets/icons/user_active.svg", "Profile"),
  ];
}

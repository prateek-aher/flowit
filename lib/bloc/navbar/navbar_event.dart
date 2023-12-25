part of 'navbar_bloc.dart';

sealed class NavbarEvent {
  final int index;

  NavbarEvent(this.index);
}

final class OnTap extends NavbarEvent {
  OnTap(super.index);
}

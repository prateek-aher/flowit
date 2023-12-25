import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/navbar/navbar_bloc.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 96.h,
          padding: EdgeInsets.only(top: 17.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: const Alignment(0.00, -1.00),
            end: const Alignment(0, 1),
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.white.withOpacity(0.05)
            ],
          )),
          child: BlocBuilder<NavbarBloc, NavbarState>(
            builder: (context, state) {
              return BottomNavigationBar(
                // useLegacyColorScheme: false,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  BlocProvider.of<NavbarBloc>(context).add(OnTap(index));
                },
                currentIndex: state.index,

                selectedItemColor: const Color(0xffFF7BC3),
                unselectedItemColor: const Color(0xffC0C0C0),
                showUnselectedLabels: true, selectedFontSize: 10.sp,
                unselectedFontSize: 10.sp,
                selectedLabelStyle: GoogleFonts.montserrat(
                  // fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.24,
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                  // fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.24,
                ),
                items: BlocProvider.of<NavbarBloc>(context)
                    .navItems
                    .asMap()
                    .entries
                    .map((e) => BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          e.value.$1,
                          colorFilter: ColorFilter.mode(
                            state.index == e.key
                                ? const Color(0xffFF7BC3)
                                : const Color(0xffc0c0c0),
                            BlendMode.srcIn,
                          ),
                        ),
                        label: e.value.$2))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

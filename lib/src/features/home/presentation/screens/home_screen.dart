import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_event.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_state.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_buttom_navigation_bar.dart';
import '../widgets/custom_drawer.dart';
import 'posts_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> pages = [Page1(), const PostsScreen(), Page3(), Page4()];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.overallBgColor,
      key: _scaffoldKey,
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is DrawerOpenedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scaffoldKey.currentState?.openDrawer();
            });
          } else if (state is DrawerClosedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scaffoldKey.currentState?.closeDrawer();
            });
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget currentPage = pages[0];
            if (state is BottomNavigationPageChanged) {
              currentPage = pages[state.currentIndex];
            }
            return Column(
              children: [
                const CustomAppBar(),
                Expanded(child: currentPage),
              ],
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpen) {
        if (!isOpen) {
          context.read<HomeBloc>().add(CloseDrawerEvent());
        }
      },
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavigationPageChanged) {
            currentIndex = state.currentIndex;
          }
          return CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(PageTappedEvent(index));
            },
          );
        },
      ),
    );
  }
}

// Dummy pages for navigation
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Explore Page'));
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Account Page'));
  }
}

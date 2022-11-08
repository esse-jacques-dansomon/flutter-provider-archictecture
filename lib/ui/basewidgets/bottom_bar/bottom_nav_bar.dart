import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool add_product;
  final bool boutique;
  final bool home;
  final bool profile;
  final bool search;
  final ScrollController? scrollController;

  const CustomBottomNavBar(
      {Key? key,
        this.add_product = false,
        this.boutique = false,
        this.home = false,
        this.profile = false,
        this.search = false,
        this.scrollController

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //if is ios set height to 80
      height: Platform.isIOS ? 80 : 65,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Platform.isIOS ? 80 : 65,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween ,
                children: [
                  CustomBottomBarItem(
                    activeImage:Icons.home,
                    image:Icons.home_outlined,
                    title: 'Accueil',
                    route: AppRoutes.home,
                    item: home,
                    scrollController: scrollController,
                  ),
                  add_product ? const SizedBox(
                    width:  10 ,
                  ) : Container() ,
                  CustomBottomBarItem(
                    activeImage:Icons.shop,
                    image:Icons.shop_outlined,
                    title: 'Boutiques',
                    route: AppRoutes.shop,
                    item: boutique,
                    scrollController: scrollController,

                  ),
                  add_product ? const SizedBox(
                    width:  10 ,
                  ) : Container(width: 40) ,
                  CustomBottomBarItem(
                    activeImage:Icons.search,
                    image:Icons.search_outlined,
                    title: 'Recherche',
                    route: AppRoutes.search,
                    item: search ,
                    scrollController: scrollController,

                  ),
                  add_product ? const SizedBox(
                    width:  10 ,
                  ) : Container() ,
                  CustomBottomBarItem(
                    activeImage:Icons.person,
                    image:Icons.person_outlined,
                    title: 'Profile',
                    route: AppRoutes.profile,
                    item: profile,
                    scrollController: scrollController,

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomBarItem extends StatelessWidget {
  const CustomBottomBarItem({
    Key? key,
    required this.item,
    required this.route,
    required this.title,
    required this.image,
    required this.activeImage,
    this.scrollController,

  }) : super(key: key);

  final bool item;
  final String route;
  final String title;
  final IconData image;
  final IconData activeImage;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, ) {
    return GestureDetector(
      onTap: () {
        if (!item) {
          AppRoutes.goTo(context, route);
        }else{
          if(scrollController != null ){
            scrollController?.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item ? Icon(activeImage, color: AppColors.PRIMARY, size: 28,) : Icon(image),
          item
              ? Text(title, style: const TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.bold))
              : Text(title),
        ],
      ),
    );
  }
}


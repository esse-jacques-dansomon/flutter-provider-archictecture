import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../config/app_colors.dart';
import '../../../config/app_dimenssions.dart';
import '../../../config/app_images.dart';
import '../../../providers/auth_provider.dart';
import '../../../route/routes.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();

}

class _AppDrawerState extends State<AppDrawer> {

  _loadDataBoutique()  {
    Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDataBoutique();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children:[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.PRIMARY,
              ),
              child:  Provider.of<AuthProvider>(context, listen: true).isLoggedIn() ? Consumer<AuthProvider>(
                  builder: (context, authProvider, _){
                    return  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.profilImage ==null ? AppImage.logo :  Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()!.profilImage! ,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const  SizedBox(width: 10,),
                        Flexible(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text(Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.boutiqueName ??'Pas de Nom', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                                const SizedBox(height: 5,),
                                Text('Plan : ${Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.plan ?? 'Plan de Plan'}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
                                const SizedBox(height: 5,),
                                Flexible( child: Text(Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.adresse ?? 'Plan de id', maxLines: 2,   softWrap: false,style: const TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold,color: AppColors.WHITE),)),
                              ],
                            ),
                          ),
                        )

                      ],
                    );
                  }
              ) : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text('Bienvenue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                      SizedBox(height: 5,),
                      Text('Connectez Vous Pour Continuer', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
                    ],
                  )

                ],
              ),
            ),

            const DrawerMenuItem(
              menuName: 'Accueil',
              route: AppRoutes.home,
              icon: Icons.home_outlined,
            ) ,
            const DrawerMenuItem(
              menuName: 'Categories',
              route: AppRoutes.categories,
              icon: Icons.category_outlined,
            ) ,

            Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ?Column(
              children: const [
                DrawerMenuItem(
                  menuName: 'Boutiques Favories',
                  route: AppRoutes.favoritesBoutiques,
                  icon: Icons.shop_2_outlined,
                ) ,
              ],
            ) : Container(),

            const DrawerMenuItem(
              menuName: 'Abonnements',
              route: AppRoutes.abonnements,
              icon: Icons.person_pin_rounded,
            ),
            const DrawerMenuItem(
              menuName: 'Ma Liste d\'Envies',
              route: AppRoutes.wishList,
              icon: Icons.favorite_border,
            ) ,
            ListTile(
              title: Text('Mon compte', style: TextStyle(fontSize: 17, color: Colors.grey[600]),),
            ),


            !Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ?
            Column(
              children: const [
                DrawerMenuItem(
                  menuName: 'Se connecter',
                  route: AppRoutes.login,
                  icon: Icons.login,
                ),
                DrawerMenuItem(
                  menuName: 'Créer un compte',
                  route: AppRoutes.register,
                  icon: Icons.person_add_alt,
                ),
              ],
            )

                :Column(
              children:  [
                const DrawerMenuItem(
                  menuName: 'Changer de Mot de Passe',
                  route: AppRoutes.resetPassword,
                  icon: Icons.password_outlined,
                ),
                const DrawerMenuItem(
                  menuName: 'Dévénir Exclusive',
                  route: AppRoutes.becomeExclusive,
                  icon: Icons.star_half_outlined,
                ),
                //SIGNALER UN PROBLEME
                ListTile(
                  horizontalTitleGap: 5,
                  leading: const Icon(Icons.bug_report, color: AppColors.BLACK,),
                  title: const Text("Signaler un bug", style: TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),  ),
                  onTap: () {
                    // ContactVendor.signalBug();
                  },
                ),
                ListTile(
                  onTap: (){
                    Provider.of<AuthProvider>(context, listen: false).logout();
                    // Provider.of<VendorProvider>(context, listen: false).clear();
                    Navigator.popAndPushNamed(context, AppRoutes.home);
                  },
                  horizontalTitleGap: 5,
                  leading: const Icon( Icons.logout_outlined, color: AppColors.BLACK,),
                  title: const Text('Se Deconnecter', style: TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),),

                ),
              ],
            ),


            //VERSION OF APP DESIGN
            InkWell(
              onTap: (){

              },
              child: Column(
                children: const [
                  Divider(),
                  SizedBox(height: 5,),
                  Text('Version 1.0.0', style: TextStyle(fontSize: 13, color: Colors.grey),),
                  SizedBox(height: 2,),
                  Text('@2022 -Wanter Market', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),),
                  SizedBox(height: 2,),
                  Text('Developped by Agence Cauris', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Divider(),

                ],
              ),
            )

          ]
      ),
    );
  }
}


class DrawerMenuItem extends StatelessWidget {
  final String route;
  final String menuName;
  final IconData icon;

  const DrawerMenuItem({Key? key, required this.route,required this.menuName,required this.icon, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      leading: Icon(icon, color: AppColors.BLACK,),
      title: Text(menuName, style: const TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),  ),
      onTap: () {
        AppRoutes.goTo(context, route);
        },
    )  ;
  }
}


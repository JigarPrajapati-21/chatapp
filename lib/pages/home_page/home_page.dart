import 'package:chatapp/Congif/Strings.dart';
import 'package:chatapp/Congif/images.dart';
import 'package:chatapp/pages/home_page/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  // TabController tabController=TabController(length: 3, vsync: _HomePageState());

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    var theme=Theme.of(context);

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          // backgroundColor: theme.colorScheme.primaryContainer,
          title: Text(AppString.appName,style: theme.textTheme.headlineSmall,),
          leading: Padding(
            padding: const EdgeInsets.all(0),
            child: SvgPicture.asset(AssetsImage.appIconSvg,color: theme.colorScheme.primary,),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: theme.textTheme.bodyLarge,
                unselectedLabelStyle: theme.textTheme.labelLarge,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.all(10),
                tabs: [
              Text("Chats"),
              Text("Groups"),
              Text("Calls"),
            ]),
          ),


        ),


        body: Padding(
          padding: const EdgeInsets.all(10),
          child: TabBarView(
              controller: tabController,
              children: [
                ChatList(),
            Container(),
            Container(),
          ]),
        ),



        
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
          backgroundColor: theme.colorScheme.primary,
          child: Icon(Icons.add,color: theme.colorScheme.onBackground,),
        ),
        
        
      ),
    );
  }
}

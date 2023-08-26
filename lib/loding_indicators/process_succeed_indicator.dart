
import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessSucceed extends ConsumerStatefulWidget {
  final VoidCallback _action;
  final String actionTitle;
  const ProcessSucceed({Key? key,required VoidCallback action,required this.actionTitle}) :_action = action, super(key: key);

  @override
  ConsumerState<ProcessSucceed> createState() => _ProcessSucceedState();
}

class _ProcessSucceedState extends ConsumerState<ProcessSucceed> with TickerProviderStateMixin{
  late AnimationController _controller ;
  late AnimationController _textSlidingController;
  var beginOffset = 0.3;
  var beginOpacity= 0.0;
  var doneInterval = 0.0;

  // late Tween<Offset> textSlidingTween;
  @override
  void initState() {
    super.initState();


    // textSlidingTween = Tween<Offset>(begin: Offset(0, 1),end: Offset.zero);
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 975))..forward()..repeat(reverse: true);

    _textSlidingController = AnimationController(vsync: this,duration: const Duration(milliseconds: 700))..forward();
    Future.delayed(const Duration(seconds: 2)).then((value){
      _textSlidingController.stop();
    });

    // _controller.addStatusListener((status) {
    //   log("status $status");
    // });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sucesss"),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(
            gradient: LinearGradient(tileMode: TileMode.mirror,
                stops: const  [0.2,.43,0.9],
                begin: Alignment.topCenter,end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).colorScheme.secondaryContainer,
                  Theme.of(context).canvasColor,

                  Theme.of(context).canvasColor
                ]),
          ),),


          Positioned(top: context.height*.25,
            child: SizedBox(width: context.width,
              child: Column(
                children: [
                  RepaintBoundary(
                    child: AnimatedBuilder(animation: _controller,
                        builder: (context,child) {
                          final position = Tween<double>(begin: beginOffset,end: 1.0).animate(
                              CurvedAnimation(parent: _controller, curve:  doneInterval>0.0?Interval(0.0, doneInterval,curve: Curves.easeIn):Curves.linear)).value ;
                          final opacity = Tween<double>(begin: beginOpacity,end: 1.0).animate(
                              CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.6,curve: Curves.easeIn))) ;
                          Future.delayed(const Duration(milliseconds: 990),(){
                            beginOffset =  0.7;
                            beginOpacity = 0.1;
                            doneInterval = 0.2;
                          });

                          return Column(
                            children: [
                              Transform.scale(scale: position,
                                child: Container(decoration: BoxDecoration(
                                    gradient: RadialGradient(stops: const [.2,.5,.9],
                                        colors: [
                                          Colors.green.withOpacity(.1),
                                          Colors.green.withOpacity(.2),
                                          Colors.green.withOpacity(.3)
                                        ]),
                                    shape: BoxShape.circle,border: Border.all(color: Colors.green.shade200,
                                    width: MediaQuery.of(context).size.width*.016)),
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*.021),
                                  child:  FadeTransition(opacity:opacity ,
                                      child: Icon(Icons.done_all,color: Colors.green.shade900,size: MediaQuery.of(context).size.height*.06,)),),
                              ),


                            ],
                          );
                        }
                    ),
                  ),
                  SizedBox(height: context.height*.02,),

                  RepaintBoundary(
                    child: AnimatedBuilder(animation: _textSlidingController,
                        builder: (context,child) {
                          final textSlidingOffset = Tween<Offset>(begin: const Offset(-3, -0),end: Offset.zero).animate(
                              CurvedAnimation(parent: _textSlidingController, curve: Curves.linear));

                          return SlideTransition(position: textSlidingOffset,
                              child: Text("Successful",style: GoogleFonts.cantataOne(
                                  color: Theme.of(context).colorScheme.surfaceTint,
                                  fontSize: ((context.width+context.height)*context.aspectRatio)*.04
                              ),));
                        }
                    ),
                  ),
                  SizedBox(height: context.height*.02,),

                  // AnimatedBuilder(
                  //   tween: textSlidingTween,
                  //   duration: Duration(milliseconds: 500),
                  //   builder: (context,Offset value,child) {
                  //     return Transform.translate(offset: value,
                  //         child: Text("Successful"));
                  //   }
                  // ),
                  Icon(Icons.arrow_drop_down,color: Theme.of(context).colorScheme.surfaceTint,),
                  SizedBox(height: context.height*.02,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: context.width*.04,),
                    child: Wrap(spacing: context.width*.03 ,runSpacing: context.width*.015,children: [
                      FilledButton.tonal(onPressed: widget._action, child:  Text(widget.actionTitle)),
                      // FilledButton.tonal(onPressed: (){}, child: const  Text("Button name"))

                    ],),
                  )

                ],
              ),
            ),
          ),



        ],),
      // body: Stack(alignment: Alignment.center,
      //   children: [
      //     Container(margin: EdgeInsets.symmetric(horizontal: context.width*.05),
      //     padding: EdgeInsets.only(top: context.height*.07,left: context.width*.04,right: context.width*.04),
      //     width: context.width,
      //     decoration:  BoxDecoration(color: Theme.of(context).canvasColor,
      //     borderRadius: const BorderRadius.vertical(top: Radius.circular(40),bottom: Radius.circular(20))),
      //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
      //         Text("Log in Successful",style: Theme.of(context).textTheme.headlineLarge!.merge(GoogleFonts.cantataOne(color: Colors.green.shade800),)),
      //
      //         SizedBox(height: context.height*.01,),
      //
      //         Text("Welcome you're in. \nLet's take a look further to complete your profile.",style: Theme.of(context).textTheme.bodySmall,),
      //
      //         SizedBox(height: context.height*.05,),
      //
      //         Center(
      //         child: ElevatedButton(style: ElevatedButton.styleFrom(
      //         minimumSize: Size(context.width*.6, context.height*.05)),
      //         onPressed: (){
      //           Navigator.pop(context);
      //         }, child: Text("Ok",style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(color: Theme.of(context).colorScheme.primary)),)),
      //       ),
      //
      //
      //
      //       ],),),
      //
      //     Positioned(top: (context.height-(context.height*.06))/3.4,
      //       child: AnimatedBuilder(animation: widget.controller,
      //         builder: (context,child) {
      //           debugPrint("_controller val ${widget.controller.value}");
      //           return Transform.scale(scale: widget.controller.value,
      //             child: Container(decoration: BoxDecoration(color: Colors.green.shade50,shape: BoxShape.circle,border: Border.all(color: Colors.green.shade100,
      //             width: MediaQuery.of(context).size.width*.016)),
      //               padding: EdgeInsets.all(MediaQuery.of(context).size.width*.021),
      //               child:  Icon(Icons.done_all,color: Colors.green.shade900,size: MediaQuery.of(context).size.height*.06,),),
      //           );
      //         }
      //       ),
      //     ),
      //
      //   ],
      // ),
    );
  }
}

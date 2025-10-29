import '../core.dart';

class VlabScaffold extends ConsumerWidget {
  final AppBar? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool isLoading;
  final bool showPageLoader;
  
  const VlabScaffold({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.isLoading = false,
    this.body,
    this.bottomNavigationBar,
    this.showPageLoader = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return !isLoading;
      },
      child: Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        backgroundColor: backgroundColor,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

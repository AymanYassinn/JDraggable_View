library jdraggable_view;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Define a custom widget [JDraggableView] for a draggable view with various configuration options.
class JDraggableView extends StatelessWidget {
  // Properties to configure the appearance and behavior of the draggable view.
  /// Nullable Widgets? [leading] & [drawer] & [expandedHeaderBottomBar] & [expandedBody] & [floatingActionButton] & [bottomSheet] & [bottomNavigationBar]*
  final Widget? leading,
      drawer,
      expandedHeaderBottomBar,
      expandedBody,
      floatingActionButton,
      bottomSheet,
      bottomNavigationBar;

  ///Not Nullable  Widgets [title] & [expandedHeader]
  final Widget title, expandedHeader;

  /// bool parameters  [centerTitle] & [alwaysShowTitle] & [alwaysShowLeadingAndAction] & [fullyStretchable]
  final bool centerTitle,
      alwaysShowLeadingAndAction,
      alwaysShowTitle,
      fullyStretchable;

  ///Nullable List Widgets [actions]
  final List<Widget>? actions;

  ///Not Nullable List Widgets [body]
  final List<Widget> body;

  /// Not Nullable double [refreshDisplacement] & [refreshStrokeWidth] & [headerExpandedHeight] & [bottomNavigationBarHeight] & [stretchMaxHeight] & [curvedBodyRadius] & [stretchTriggerOffset]
  final double refreshDisplacement,
      refreshStrokeWidth,
      stretchTriggerOffset,
      headerExpandedHeight,
      bottomNavigationBarHeight,
      stretchMaxHeight,
      curvedBodyRadius;

  /// Nullable Colors [backgroundColor] & [appBarColor] & [refreshBackColor] & [refreshColor]
  final Color? backgroundColor, appBarColor, refreshBackColor, refreshColor;

  /// FloatingActionButtonLocation  [floatingActionButtonLocation]
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// FloatingActionButtonAnimator [floatingActionButtonAnimator]
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// ScrollPhysics [physics]
  final ScrollPhysics? physics;

  /// ScrollController [controller]
  final ScrollController? controller;

  /// RefreshCallback [onRefresh]
  final RefreshCallback? onRefresh;

  /// RefreshIndicatorTriggerMode [refreshTriggerMode]
  final RefreshIndicatorTriggerMode refreshTriggerMode;

  /// Constructor for the draggable view widget.
  const JDraggableView(
      {super.key,
      this.leading,
      this.title = const SizedBox(),
      this.centerTitle = true,
      this.actions,
      this.alwaysShowLeadingAndAction = false,
      this.alwaysShowTitle = false,
      this.headerExpandedHeight = 0.35,
      this.expandedHeader = const SizedBox(),
      this.expandedHeaderBottomBar,
      this.backgroundColor,
      this.appBarColor,
      this.curvedBodyRadius = 20,
      this.body = const [],
      this.drawer,
      this.fullyStretchable = false,
      this.stretchTriggerOffset = 200,
      this.expandedBody,
      this.stretchMaxHeight = 0.9,
      this.bottomSheet,
      this.bottomNavigationBarHeight = kBottomNavigationBarHeight,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.physics,
      this.controller,
      this.onRefresh,
      this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,
      this.refreshBackColor,
      this.refreshColor,
      this.refreshDisplacement = 40.0,
      this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth})
      : assert(headerExpandedHeight > 0.0 &&
            headerExpandedHeight < stretchMaxHeight),
        assert(
          (stretchMaxHeight > headerExpandedHeight) && (stretchMaxHeight < .95),
        );

  @override
  Widget build(BuildContext context) {
    // Wrap the draggable view with a ChangeNotifierProvider to manage its state.
    return ChangeNotifierProvider(
        create: (context) => _DraggableViewState(),
        child: _WidgetN(
          // Pass the configuration properties to the internal widget.
          leading: leading,
          title: title,
          controller: controller,
          centerTitle: centerTitle,
          actions: actions,
          alwaysShowLeadingAndAction: alwaysShowLeadingAndAction,
          alwaysShowTitle: alwaysShowTitle,
          appBarColor: appBarColor,
          backgroundColor: backgroundColor,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          bottomNavigationBarHeight: bottomNavigationBarHeight,
          bottomSheet: bottomSheet,
          curvedBodyRadius: curvedBodyRadius,
          drawer: drawer,
          expandedBody: expandedBody,
          expandedHeader: expandedHeader,
          expandedHeaderBottomBar: expandedHeaderBottomBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          fullyStretchable: fullyStretchable,
          headerExpandedHeight: headerExpandedHeight,
          onRefresh: onRefresh,
          physics: physics,
          refreshBackColor: refreshBackColor,
          refreshColor: refreshColor,
          refreshDisplacement: refreshDisplacement,
          refreshStrokeWidth: refreshStrokeWidth,
          refreshTriggerMode: refreshTriggerMode,
          stretchMaxHeight: stretchMaxHeight,
          stretchTriggerOffset: stretchTriggerOffset,
        ));
  }
}

// Define a custom state class for managing the state of the DraggableView widget.
class _DraggableViewState extends ChangeNotifier {
  // Track whether the view is fully expanded or not.
  bool isFullyExpanded = false;

  // Track whether the view is fully collapsed or not.
  bool isFullyCollapsed = false;

  // Method to update the expanded state of the view.
  void updateExpandedState(bool expanded) {
    // Update the isFullyExpanded property based on the provided 'expanded' parameter.
    isFullyExpanded = expanded;

    // Notify listeners (widgets that are listening to this state) about the change.
    notifyListeners();
  }

  // Method to update the collapsed state of the view.
  void updateCollapsedState(bool collapsed) {
    // Update the isFullyCollapsed property based on the provided 'collapsed' parameter.
    isFullyCollapsed = collapsed;

    // Notify listeners (widgets that are listening to this state) about the change.
    notifyListeners();
  }
}

class _WidgetN extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final bool centerTitle;
  final List<Widget>? actions;
  final bool alwaysShowLeadingAndAction;
  final bool alwaysShowTitle;
  final Widget? drawer;
  final double headerExpandedHeight;
  final Widget expandedHeader;
  final Widget? expandedHeaderBottomBar;
  final Color? backgroundColor;
  final Color? appBarColor;
  final double curvedBodyRadius;
  final List<Widget> body;
  final bool fullyStretchable;
  final double stretchTriggerOffset;
  final Widget? expandedBody;
  final double stretchMaxHeight;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final double? bottomNavigationBarHeight;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final RefreshCallback? onRefresh;
  final RefreshIndicatorTriggerMode refreshTriggerMode;
  final Color? refreshBackColor, refreshColor;
  final double refreshDisplacement, refreshStrokeWidth;

  const _WidgetN(
      {this.leading,
      this.title = const SizedBox(),
      this.centerTitle = true,
      this.actions,
      this.alwaysShowLeadingAndAction = false,
      this.alwaysShowTitle = false,
      this.headerExpandedHeight = 0.35,
      this.expandedHeader = const SizedBox(),
      this.expandedHeaderBottomBar,
      this.backgroundColor,
      this.appBarColor,
      this.curvedBodyRadius = 20,
      this.body = const [],
      this.drawer,
      this.fullyStretchable = false,
      this.stretchTriggerOffset = 200,
      this.expandedBody,
      this.stretchMaxHeight = 0.9,
      this.bottomSheet,
      this.bottomNavigationBarHeight = kBottomNavigationBarHeight,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.physics,
      this.controller,
      this.onRefresh,
      this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,
      this.refreshBackColor,
      this.refreshColor,
      this.refreshDisplacement = 40.0,
      this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth});

  @override
  Widget build(BuildContext context) {
    final dragState = Provider.of<_DraggableViewState>(context);
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final double appBarHeight =
        AppBar().preferredSize.height + curvedBodyRadius;

    final double topPadding = mediaQuery.padding.top;
    final topHeight = appBarHeight + topPadding;
    final double bottomPadding =
        bottomNavigationBar == null ? 0 : kBottomNavigationBarHeight;
    final double expandedHeight = mediaQuery.size.height * headerExpandedHeight;

    final double fullyExpandedHeight =
        mediaQuery.size.height * (stretchMaxHeight);
    return RefreshIndicator(
      displacement: refreshDisplacement,
      backgroundColor: refreshBackColor,
      color: refreshColor,
      strokeWidth: refreshStrokeWidth,
      triggerMode: refreshTriggerMode,
      onRefresh: onRefresh ?? () async {},
      child: Scaffold(
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        drawer: drawer,
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis == Axis.vertical) {
              // isFullyCollapsed
              if (dragState.isFullyExpanded &&
                  notification.metrics.extentBefore > 100) {
                dragState.updateExpandedState(false);
              }
              //isFullyCollapsed
              if (notification.metrics.extentBefore >
                  expandedHeight - AppBar().preferredSize.height - 40) {
                if (!dragState.isFullyCollapsed) {
                  dragState.updateCollapsedState(true);
                }
              } else {
                if (dragState.isFullyCollapsed) {
                  dragState.updateCollapsedState(false);
                }
              }
            }
            return false;
          },
          child: CustomScrollView(
            physics: physics ?? const BouncingScrollPhysics(),
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor:
                    !dragState.isFullyCollapsed ? backgroundColor : appBarColor,
                leading: alwaysShowLeadingAndAction
                    ? leading
                    : !dragState.isFullyCollapsed
                        ? const SizedBox()
                        : leading,
                actions: alwaysShowLeadingAndAction
                    ? actions
                    : !dragState.isFullyCollapsed
                        ? []
                        : actions,
                elevation: 0,
                pinned: true,
                stretch: true,
                centerTitle: centerTitle,
                title: alwaysShowTitle
                    ? title
                    : AnimatedOpacity(
                        opacity: dragState.isFullyCollapsed ? 1 : 0,
                        duration: const Duration(milliseconds: 100),
                        child: title,
                      ),
                collapsedHeight: appBarHeight,
                expandedHeight: dragState.isFullyExpanded
                    ? fullyExpandedHeight
                    : expandedHeight,
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 0.2),
                        child: dragState.isFullyExpanded
                            ? (expandedBody ?? const SizedBox())
                            : expandedHeader,
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: curvedBodyRadius,
                        decoration: BoxDecoration(
                          color:
                              backgroundColor ?? theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(curvedBodyRadius),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0 + curvedBodyRadius,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        curve: Curves.easeInOutCirc,
                        duration: const Duration(milliseconds: 100),
                        height: dragState.isFullyCollapsed
                            ? 0
                            : dragState.isFullyExpanded
                                ? 0
                                : kToolbarHeight,
                        width: mediaQuery.size.width,
                        child: dragState.isFullyCollapsed
                            ? const SizedBox()
                            : dragState.isFullyExpanded
                                ? const SizedBox()
                                : expandedHeaderBottomBar ?? Container(),
                      ),
                    )
                  ],
                ),
                stretchTriggerOffset: stretchTriggerOffset,
                onStretchTrigger: fullyStretchable
                    ? () async {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          if (!dragState.isFullyExpanded) {
                            dragState.updateExpandedState(true);
                          }
                        });
                      }
                    : null,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          height: mediaQuery.size.height -
                              topHeight -
                              bottomPadding,
                          color:
                              backgroundColor ?? theme.scaffoldBackgroundColor,
                        ),
                        Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: dragState.isFullyExpanded ? 25 : 0,
                              width: mediaQuery.size.width,
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: dragState.isFullyExpanded
                                      ? null
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                            //Body
                            ...body
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
      ),
    );
  }
}

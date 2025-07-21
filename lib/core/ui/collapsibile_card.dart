import 'package:flutter/material.dart';

/// Un widget generico che mostra una card con un header sempre visibile
/// e un contenuto che può essere espanso o collassato con un'animazione.
class CollapsibleCard extends StatefulWidget {
  /// Il widget da mostrare nell'header. È sempre visibile e cliccabile
  /// per espandere/collassare il contenuto.
  final Widget header;

  /// Il widget da mostrare nella sezione espandibile.
  final Widget content;

  /// Lo stato iniziale della card (esapansa o collassata).
  /// Default a `false` (collassata).
  final bool initialExpanded;

  /// Il margine esterno della card.
  final EdgeInsetsGeometry? margin;

  /// L'elevazione della card.
  final double? elevation;

  /// La forma della card.
  final ShapeBorder? shape;

  final Widget? extraWidget;

  /// Callback che viene chiamato quando lo stato di espansione cambia.
  final ValueChanged<bool>? onExpansionChanged;

  const CollapsibleCard({
    super.key,
    required this.header,
    required this.content,
    this.initialExpanded = false,
    this.margin,
    this.extraWidget,
    this.elevation,
    this.shape,
    this.onExpansionChanged,
  });

  @override
  State<CollapsibleCard> createState() => _CollapsibleCardState();
}

class _CollapsibleCardState extends State<CollapsibleCard>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late final AnimationController _controller;
  late final Animation<double> _iconTurns;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      // Notifica il cambiamento di stato al widget padre, se interessato
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: widget.margin ?? const EdgeInsets.all(8.0),
      elevation: widget.elevation,
      shape: widget.shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      // Importante per i bordi arrotondati
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // --- Header Cliccabile ---
          InkWell(
            onTap: _toggleExpansion,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: widget.header),
                  const SizedBox(width: 8),
                  if(widget.extraWidget !=null)
                  ...[
                    widget.extraWidget!,
                    const SizedBox(width: 16),
                  ],
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          // --- Contenuto Espandibile ---
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: _isExpanded
                ? Column(
                    children: [
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: widget.content,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

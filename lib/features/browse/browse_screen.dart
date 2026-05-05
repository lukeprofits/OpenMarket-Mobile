// TODO: ConsumerWidget. GridView.builder of ListingCard from browseControllerProvider. Sort/filter chips at top.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/listing.dart';
import 'browse_controller.dart';
import 'widgets/listing_card.dart';

class BrowseScreen extends ConsumerStatefulWidget {
  const BrowseScreen({super.key});

  @override
  ConsumerState<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends ConsumerState<BrowseScreen> {
  final TextEditingController _searchCtl = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtl.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      ref.read(searchQueryProvider.notifier).update(value);
    });
  }

  void _clearSearch() {
    _debounce?.cancel();
    _searchCtl.clear();
    ref.read(searchQueryProvider.notifier).clear();
  }

  void _onCardTap(Listing l) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Tapped ${l.title}')));
  }

  void _onFilterTap() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Filters coming soon')));
  }

  void _onCreateTap() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Create listing coming soon')));
  }

  Future<void> _onRefresh() async {
    ref.invalidate(browseListingsProvider);
    await Future<void>.delayed(const Duration(milliseconds: 350));
  }

  @override
  Widget build(BuildContext context) {
    final listings = ref.watch(browseListingsProvider);
    final query = ref.watch(searchQueryProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        titleSpacing: 12,
        title: TextField(
          controller: _searchCtl,
          onChanged: _onSearchChanged,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search Marketplace',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: query.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _clearSearch,
                    tooltip: 'Clear',
                  ),
            filled: true,
            fillColor: colors.surfaceContainerHigh,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Filters',
            onPressed: _onFilterTap,
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Create listing',
            onPressed: _onCreateTap,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: listings.isEmpty
            ? _EmptyState(query: query, onClear: _clearSearch)
            : GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 240,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                itemCount: listings.length,
                itemBuilder: (context, index) {
                  final l = listings[index];
                  return ListingCard(
                    key: ValueKey(l.cid),
                    listing: l,
                    onTap: () => _onCardTap(l),
                  );
                },
              ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.query, required this.onClear});

  final String query;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.search_off, size: 64, color: colors.outline),
                const SizedBox(height: 16),
                Text(
                  query.isEmpty ? 'Nothing here yet' : 'No matches for "$query"',
                  style: text.titleMedium?.copyWith(color: colors.onSurfaceVariant),
                ),
                if (query.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  TextButton(onPressed: onClear, child: const Text('Clear search')),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

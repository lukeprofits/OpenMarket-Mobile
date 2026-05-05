// TODO: card widget. First image, title, price, optional source-badges from seenFromSources.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/models/listing.dart';

class ListingCard extends StatelessWidget {
  const ListingCard({
    super.key,
    required this.listing,
    required this.onTap,
  });

  final Listing listing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(12);

    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: radius,
              child: Hero(
                tag: 'listing-${listing.cid}',
                child: _ThumbnailImage(
                  url: listing.thumbnailUrl,
                  surface: colors.surfaceContainerHighest,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                listing.formattedPrice,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  listing.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({required this.url, required this.surface});

  final String? url;
  final Color surface;

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Container(color: surface);
    }
    return CachedNetworkImage(
      imageUrl: url!,
      fit: BoxFit.cover,
      memCacheWidth: 700,
      placeholder: (context, _) => Container(color: surface),
      errorWidget: (context, _, _) => Container(
        color: surface,
        alignment: Alignment.center,
        child: Icon(Icons.broken_image_outlined, color: Theme.of(context).colorScheme.outline),
      ),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}

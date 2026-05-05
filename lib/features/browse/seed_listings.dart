// Mock data for the browse grid. Delete this file once the real
// listings repo (DB-backed) is wired in. Lorem Picsum URLs use a stable
// `seed=<n>` segment so the same images load each time.

import '../../core/models/listing.dart';

String _picsum(int seed) => 'https://picsum.photos/seed/openmarket-$seed/600';

final DateTime _now = DateTime.now();
DateTime _ago(Duration d) => _now.subtract(d);

final List<Listing> kSeedListings = [
  Listing(
    cid: 'bafy-seed-01',
    title: 'Mid-century walnut dining table',
    priceCents: 42000,
    createdAt: _ago(const Duration(hours: 3)),
    categories: const ['furniture'],
    thumbnailUrl: _picsum(1),
    location: 'Brooklyn, NY',
  ),
  Listing(
    cid: 'bafy-seed-02',
    title: 'Vintage Polaroid SX-70 land camera',
    priceCents: 18500,
    createdAt: _ago(const Duration(hours: 8)),
    categories: const ['electronics', 'photography'],
    thumbnailUrl: _picsum(2),
    location: 'Portland, OR',
  ),
  Listing(
    cid: 'bafy-seed-03',
    title: 'Specialized Allez road bike, 56cm',
    priceCents: 75000,
    createdAt: _ago(const Duration(days: 1)),
    categories: const ['sporting goods', 'vehicles'],
    thumbnailUrl: _picsum(3),
    location: 'Austin, TX',
  ),
  Listing(
    cid: 'bafy-seed-04',
    title: 'IKEA Poäng armchair, birch veneer',
    priceCents: 8500,
    createdAt: _ago(const Duration(days: 2)),
    categories: const ['furniture'],
    thumbnailUrl: _picsum(4),
    location: 'Seattle, WA',
  ),
  Listing(
    cid: 'bafy-seed-05',
    title: 'Pair of Adirondack chairs, cedar',
    priceCents: 22000,
    createdAt: _ago(const Duration(days: 3)),
    categories: const ['furniture', 'outdoor'],
    thumbnailUrl: _picsum(5),
    location: 'Bend, OR',
  ),
  Listing(
    cid: 'bafy-seed-06',
    title: 'Roland TR-08 drum machine',
    priceCents: 28500,
    createdAt: _ago(const Duration(days: 4)),
    categories: const ['electronics', 'music'],
    thumbnailUrl: _picsum(6),
    location: 'Nashville, TN',
  ),
  Listing(
    cid: 'bafy-seed-07',
    title: 'Le Creuset 5.5qt Dutch oven, marseille',
    priceCents: 15000,
    createdAt: _ago(const Duration(days: 5)),
    categories: const ['home', 'kitchen'],
    thumbnailUrl: _picsum(7),
    location: 'Chicago, IL',
  ),
  Listing(
    cid: 'bafy-seed-08',
    title: 'Hasselblad 500 C/M w/ 80mm f/2.8',
    priceCents: 165000,
    createdAt: _ago(const Duration(days: 6)),
    categories: const ['electronics', 'photography'],
    thumbnailUrl: _picsum(8),
    location: 'San Francisco, CA',
  ),
  Listing(
    cid: 'bafy-seed-09',
    title: 'Indoor monstera deliciosa, 4ft',
    priceCents: 6500,
    createdAt: _ago(const Duration(days: 7)),
    categories: const ['plants', 'home'],
    thumbnailUrl: _picsum(9),
    location: 'Denver, CO',
  ),
  Listing(
    cid: 'bafy-seed-10',
    title: 'Yamaha YAS-280 alto saxophone',
    priceCents: 95000,
    createdAt: _ago(const Duration(days: 9)),
    categories: const ['music'],
    thumbnailUrl: _picsum(10),
    location: 'Boston, MA',
  ),
  Listing(
    cid: 'bafy-seed-11',
    title: 'Eames-style lounge chair + ottoman',
    priceCents: 58000,
    createdAt: _ago(const Duration(days: 11)),
    categories: const ['furniture'],
    thumbnailUrl: _picsum(11),
    location: 'Los Angeles, CA',
  ),
  Listing(
    cid: 'bafy-seed-12',
    title: 'Vitamix 5200 blender, white',
    priceCents: 22500,
    createdAt: _ago(const Duration(days: 14)),
    categories: const ['home', 'kitchen'],
    thumbnailUrl: _picsum(12),
    location: 'Atlanta, GA',
  ),
];

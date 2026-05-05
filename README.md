# OpenMarket

Flutter + Riverpod marketplace browser. Local-first. Listings are content-addressed (CID), pulled in passively from a growing list of sources (Bluetooth, Nostr, IPFS, node gossip, more) and displayed Marketplace style. Posts go out through the same source plugins.

---

## Stack

- **Flutter** `3.41.9-stable` / **Dart** `3.11.5` (pinned via `.tool-versions`)
- **Riverpod** 3.x with codegen (`@riverpod`)
- **freezed** 3.x + **json_serializable** 6.13 for models
- **go_router** 17 for routing
- **web_socket_channel** 3.x (for Nostr)
- Storage: `path_provider` + JSON files. Settings via `shared_preferences`.

All direct dependencies are at the maximum mutually compatible versions for this Flutter SDK. To re-check after a Flutter bump:

```bash
flutter pub outdated                    # see what's available
flutter pub upgrade --major-versions    # bump within ecosystem
```

The pubspec uses `^` ranges so patch and minor security updates roll in automatically on `flutter pub get`. Run `flutter pub upgrade` periodically to refresh `pubspec.lock`. Commit the lockfile so builds are reproducible.

A few transitive packages (`analyzer`, `xml`, `test_api`, etc.) are held back from latest by the Flutter SDK and the riverpod/custom_lint analyzer-version pin. They move forward when you bump Flutter.

---

## Organizing principle

Each external **source** (BLE, Nostr, IPFS, gossip, …) is a self-contained plugin under `lib/sources/<name>/`. Inbound and outbound both flow through the same plugin interface. The rest of the app (`ingest/`, `publish/`, `catalog/`, `features/`) does **not** know about specific sources.

> **Adding a new source = one new folder + one line in `lib/bootstrap.dart`.** No edits to ingest, publish, settings UI, browse, or catalog.

Three top-level data-flow modules sit between sources and UI:

- `ingest/` — pulls raw docs from inbound sources, parses, categorizes, writes to repo.
- `publish/` — takes a Listing, fans out to outbound sources.
- `catalog/` — listing-side primitives (categories, sort, filter).

UI under `features/` is feature-first: each screen has its own folder.

Settings is one global `AppSettings` model with per-source config slots. Each source ships its own settings widget that binds to its slot, so the settings screen never needs editing when you add a source.

---

## Data flow

```
            ┌───────────────┐                    ┌─────────────────┐
 inbound    │ Source (BLE)  │ ── RawDoc ──┐      │ create_item UI  │
 sources    │ Source (Nostr)│ ── RawDoc ──┤      └────────┬────────┘
            │ Source (IPFS) │ ── RawDoc ──┤               │ Listing
            │ Source (...)  │ ── RawDoc ──┤               ▼
            └───────────────┘             ▼      ┌─────────────────┐
                                  ┌──────────────┤ PublishCoordin. │
                                  │ IngestCoord. │  fans out       │
                                  │ parse + cat. │      ▲          │
                                  └──────┬───────┘      │ enabled  │
                                         │ Listing      │ outbound │
                                         ▼              │ sources  │
                                  ┌──────────────┐      │          │
                                  │ Listings repo│      │  BLE     │
                                  │ (keyed by CID)│     │  Nostr   │
                                  └──────┬───────┘      │  IPFS    │
                                         │              │  ...     │
                                         ▼              └──────────┘
                                  ┌──────────────┐
                                  │  Browse UI   │
                                  │ (sort/filter)│
                                  └──────────────┘

         ┌───────── Global Settings (freezed) ─────────┐
         │  app prefs + per-source config slots         │
         │  every source reads its slot; coordinators   │
         │  read enabled flags                          │
         └──────────────────────────────────────────────┘
```

---

## Directory layout

```
lib/
  main.dart                       # entry; wraps in ProviderScope, awaits bootstrap
  app.dart                        # MaterialApp.router, theme, lifecycle observer
  bootstrap.dart                  # loads settings, builds SourceRegistry, starts enabled sources

  core/                           # shared domain + infra used by everything
    models/
      listing.dart                # @freezed Listing; cid is primary key
      raw_doc.dart                # inbound wrapper (bytes + sourceId + receivedAt)
      publish_result.dart         # outbound result type
      app_settings.dart           # global @freezed AppSettings, holds sourceSlots map
    storage/
      listings_repository.dart    # CID-keyed JSON file store; emits stream
      paths.dart                  # app docs / listings dir helpers
      settings_store.dart         # AppSettings <-> shared_preferences
    util/
      logger.dart
    theme/
      app_theme.dart

  sources/                        # PLUGIN LAYER — each subfolder = one source
    source.dart                   # base Source + InboundSource + OutboundSource interfaces
    source_registry.dart          # static list of sources; filters by enabled + supported platform
    source_settings.dart          # helpers for per-source config slot read/write
    bluetooth/
      bluetooth_source.dart       # implements In + Out
      bluetooth_settings.dart     # @freezed config + settings widget for this source
      duty_cycle.dart             # 2s/8s scan timing helper
    nostr/
      nostr_source.dart
      nostr_settings.dart
    node_gossip/
      node_gossip_source.dart     # libp2p / FFI bridge code lives in this folder
      node_gossip_settings.dart
    ipfs/
      ipfs_source.dart            # inbound only initially
      ipfs_settings.dart

  ingest/                         # pull pipeline
    ingest_coordinator.dart       # subscribes to all enabled inbound sources; pipes to parser->categorizer->repo
    parser.dart                   # RawDoc -> Listing (JSON decode + validation)
    categorizer.dart              # adds categories/tags to a Listing

  publish/                        # post pipeline
    publish_coordinator.dart      # given Listing -> fan out to all enabled outbound sources

  catalog/                        # listing-side primitives consumed by browse UI
    categories.dart               # category constants + helpers
    sorting.dart                  # SortOption enum + comparators
    filters.dart                  # Filter interface + composable list

  features/                       # UI, feature-first
    browse/
      browse_screen.dart
      browse_controller.dart      # reads listings stream, applies sort/filter from settings
      widgets/
        listing_card.dart
    item_detail/
      item_detail_screen.dart
      item_detail_controller.dart
    create_item/
      create_item_screen.dart
      create_item_controller.dart # build Listing -> repo.upsertByCid -> publish_coordinator.publish
    settings/
      settings_screen.dart        # iterates SourceRegistry, renders each source's settings widget
      settings_controller.dart

  routing/
    app_router.dart               # go_router config
```

---

## Where does X go?

| Thing | Folder |
|---|---|
| New source (e.g. `LoRa`, `Webhook`) | `lib/sources/<name>/` (+ register in `bootstrap.dart`) |
| New filter for browse | `lib/catalog/filters.dart` |
| New sort option | `lib/catalog/sorting.dart` |
| Change to `Listing` schema | `lib/core/models/listing.dart` (then re-run build_runner) |
| New app-wide setting (theme, default sort, …) | `lib/core/models/app_settings.dart` + UI in `lib/features/settings/` |
| New per-source setting | the source's `<name>_settings.dart` only |
| New screen | `lib/features/<feature>/` + route in `lib/routing/app_router.dart` |
| Inbound JSON validation rule | `lib/ingest/parser.dart` |
| Categorization logic | `lib/ingest/categorizer.dart` |
| Publish result aggregation / retry policy | `lib/publish/publish_coordinator.dart` |
| Anything filesystem | `lib/core/storage/` |
| Theme / colors / typography | `lib/core/theme/app_theme.dart` |
| Lifecycle pause/resume wiring | `lib/app.dart` (calls into `IngestCoordinator`) |
| FFI / native bridge code for a source | inside that source's folder + `android/`, `ios/` native dirs |

---

## Adding a new source — checklist

1. `lib/sources/<name>/<name>_source.dart` — implement `InboundSource`, `OutboundSource`, or both.
2. `lib/sources/<name>/<name>_settings.dart` — `@freezed` config model + a `Widget` that reads/writes its slot in `AppSettings.sourceSlots[id]`.
3. Add one line to the registry construction in `lib/bootstrap.dart`.
4. Done. No edits to `ingest/`, `publish/`, `features/settings/`, or `catalog/`.

Optional: declare `supportedPlatforms` on the source so `SourceRegistry` skips it on incompatible platforms (e.g., BLE source shouldn't run on web).

---

## Conventions

- **Listings are keyed by CID.** Same listing arriving from BLE + Nostr + IPFS = one file in `<appDocs>/listings/<cid>.json`. The repo's `upsertByCid` merges `seenFromSources` and `categories`. Dedup is automatic.
- **Listing.meta is your forward-compat bag.** Fields not yet first-class on the model live there; the parser absorbs unknown JSON without breaking.
- **Sources never touch the repo directly.** They emit `RawDoc`; the ingest coordinator owns parsing and writes.
- **Coordinators never know specific source types.** Only the registry does.
- **Settings are global, single source of truth.** Sources read their slot. UI mutates via `setSourceSlot(id, key, value)`.
- **Errors on publish never throw.** `PublishCoordinator` collects per-source `PublishResult`s; UI surfaces a summary.
- **Long-running source operations should be cancellable.** `InboundSource.stop()` must release sockets/timers/scanners cleanly so lifecycle pause works.

---

## Common commands

```bash
flutter pub get
dart run build_runner watch -d        # while editing freezed/@riverpod files
flutter analyze
flutter test
flutter run                           # iOS sim or Android emu
```

Native permission setup (do before first run on real devices):
- `android/app/src/main/AndroidManifest.xml` — `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `BLUETOOTH_ADVERTISE` for Android 12+.
- `ios/Runner/Info.plist` — `NSBluetoothAlwaysUsageDescription`, plus camera/photo strings if `image_picker` uses them.

---

## Out of scope / explicit non-goals (for now)

- Real IPFS / libp2p / Nostr implementations — placeholder folders only.
- OS-background execution (workmanager, iOS background modes). Plan covers *while app is open*.
- Auth, payments, networking sync beyond source plugins.
- The external producer that drops JSON into the listings dir.
- CI / release signing.

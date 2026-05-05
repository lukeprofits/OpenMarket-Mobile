// TODO: base interfaces.
//   abstract class Source { id, displayName, capabilities: Set<SourceCapability>, supportedPlatforms, settingsType, buildSettingsTile(WidgetRef) }
//   abstract class InboundSource extends Source { Future<void> start(Ref); Future<void> stop(); Stream<RawDoc> get incoming; }
//   abstract class OutboundSource extends Source { Future<PublishResult> publish(Ref, Listing); }
//   enum SourceCapability { inbound, outbound }

ActivateEquipmentCapsuleAction	struct
ActivateImpactTriggerEffectItem	struct
ActivatePasteTipTrigger	struct
ActiveTriggerID	string
The name of an ActiveTriggerPrototype.

ActivityBarStyleSpecification	struct
ActivityMatchingModifiers	struct
AdvancedVolumeControl	struct
AggregationSpecification	struct
AgriculturalCraneProperties	struct
AgriculturalCraneSpeed	struct
AgriculturalCraneSpeedArm	struct
AgriculturalCraneSpeedGrappler	struct
AirbornePollutantID	string
The name of an AirbornePollutantPrototype.

AlternativeBuildTipTrigger	struct
AmbientSoundType	union
Lets the game know in what instances the audio file is played.

AmmoCategoryID	string
The name of an AmmoCategory.

AmmoDamageModifier	struct
AmmoSourceType	union
Used to allow specifying different ammo effects depending on which kind of entity the ammo is used in. [...]

AmmoType	struct
Definition of actual parameters used in attack.

AndTipTrigger	struct
AnimatedVector	struct
Animation	struct
Specifies an animation that can be used in the game. [...]

Animation4Way	struct or Animation
If this is loaded as a single Animation, it applies to all directions. [...]

AnimationElement	struct
AnimationFrameSequence	array[uint16]
This is a list of 1-based frame indices into the spritesheet. [...]

AnimationParameters	struct
AnimationRunMode	union
AnimationSheet	struct
AnimationVariations	struct or Animation or array[Animation]
AnyPrototype	union
A union of all prototypes. [...]

ApplyStarterPackTipTrigger	struct
AreaTriggerItem	struct
ArtilleryRangeModifier	struct
ArtilleryRemoteCapsuleAction	struct
ArtilleryTriggerDelivery	struct
AsteroidChunkID	string
The name of an AsteroidChunkPrototype.

AsteroidGraphicsSet	struct
AsteroidSettings	struct
AsteroidSpawnPoint	struct
AsteroidVariation	struct
AttackParameters	union
Loaded as one of the BaseAttackParameters extensions, based on the value of the type key.

AttackReactionItem	struct
Attenuation	struct
AttenuationType	union
AutoplaceControlID	string
The name of an AutoplaceControl.

AutoplaceSettings	struct
AutoplaceSpecification	struct
Autoplace specification is used to determine which entities are placed when generating map. [...]

BaseAttackParameters	struct
The abstract base of all AttackParameters.

BaseEnergySource	struct
The abstract base of all EnergySources. [...]

BaseModifier	struct
The abstract base of all Modifiers.

BaseStyleSpecification	struct
The abstract base of all StyleSpecifications.

BeaconDistributionModifier	struct
BeaconGraphicsSet	struct
BeaconModuleVisualization	struct
BeaconModuleVisualizations	struct
BeamAnimationSet	struct
BeamAttackParameters	struct
BeamGraphicsSet	struct
BeamTriggerDelivery	struct
BeltReaderLayer	struct
BeltStackSizeBonusModifier	struct
BeltTraverseTipTrigger	struct
BlendMode	union
Determines how sprites/animations should blend with the background. [...]

BoilerPictures	struct
BoolModifier	struct
BorderImageSet	struct
BoundingBox	struct or {MapPosition, MapPosition}
BoundingBoxes are typically centered around the position of an entity. [...]

BoxSpecification	struct
A cursor box, for use in UtilitySprites.

BuildEntityByRobotTipTrigger	struct
BuildEntityTechnologyTrigger	struct
BuildEntityTipTrigger	struct
BuildMode	union
BulkInserterCapacityBonusModifier	struct
BurnerEnergySource	struct
BurnerUsageID	string
The name of a BurnerUsagePrototype.

ButtonStyleSpecification	struct
CameraEffectTriggerEffectItem	struct
CameraStyleSpecification	struct
CapsuleAction	union
Loaded as one of the capsule actions, based on the value of the type key.

CaptureSpawnerTechnologyTrigger	struct
CargoBayConnectableGraphicsSet	struct
CargoBayConnections	struct
Walls should have an even number of variations because they are interleaved.

CargoHatchDefinition	struct
CargoLandingPadLimitModifier	struct
CargoStationParameters	struct
A cargo station is any entity that has the capacity to send cargo units. [...]

ChainTriggerDelivery	struct
ChangeRecipeProductivityModifier	struct
ChangeSurfaceTipTrigger	struct
CharacterArmorAnimation	struct
The data for one variation of character animations.

CharacterBuildDistanceModifier	struct
CharacterCraftingSpeedModifier	struct
CharacterHealthBonusModifier	struct
CharacterInventorySlotsBonusModifier	struct
CharacterItemDropDistanceModifier	struct
CharacterItemPickupDistanceModifier	struct
CharacterLogisticRequestsModifier	struct
CharacterLogisticTrashSlotsModifier	struct
CharacterLootPickupDistanceModifier	struct
CharacterMiningSpeedModifier	struct
CharacterReachDistanceModifier	struct
CharacterResourceReachDistanceModifier	struct
CharacterRunningSpeedModifier	struct
ChargableGraphics	struct
ChartUtilityConstants	struct
CheckBoxStyleSpecification	struct
CircuitConnectorDefinition	struct
Definition of a circuit connector.

CircuitConnectorLayer	struct
CircuitConnectorSecondaryDrawOrder	struct
CircuitConnectorSprites	struct
CircuitNetworkModifier	struct
CircularParticleCreationSpecification	struct
CircularProjectileCreationSpecification	array[{RealOrientation, Vector}]
ClearCursorTipTrigger	struct
CliffDeconstructionEnabledModifier	struct
CliffPlacementSettings	struct
CloudEffectStyle	union
Additional mask which dictates where in the world certain ProcessionLayers are drawn. [...]

CloudsEffectProperties	struct
CloudsTextureCoordinateTransformation	struct
ClusterTriggerItem	struct
CollisionLayerID	string
The name of a CollisionLayerPrototype.

CollisionMaskConnector	struct
The base game provides common collision mask functions in a Lua file in the core lualib.

Color	struct or {float, float, float} or {float, float, float, float}
Table of red, green, blue, and alpha float values between 0 and 1. [...]

ColorHintSpecification	struct
ColorLookupTable	FileName or "identity"
A lookup table (LUT) for the color which maps the original color to a position in the sprite where the replacement color is found. [...]

ColumnAlignment	struct
ColumnWidth	struct
ColumnWidthItem	struct
ComparatorString	union
A string that specifies how the inputs should be compared.

ConnectableEntityGraphics	struct
Graphics for the heat pipe.

ConsumingType	union
Defines which other inputs a CustomInputPrototype consumes.

ControlPoint	struct or {float, float}
CountBasedTipTrigger	struct
CoverGraphicEffectData	struct
Clips the CoverGraphicProcessionLayer.

CoverGraphicProcessionLayer	struct
Draws a layer of cloud texture covering the screen. [...]

CraftFluidTechnologyTrigger	struct
CraftItemTechnologyTrigger	struct
CraftItemTipTrigger	struct
CraftingMachineGraphicsSet	struct
CranePart	struct
CranePartDyingEffect	struct
CraterPlacementDefinition	struct
CreateAsteroidChunkEffectItem	struct
CreateDecorativesTriggerEffectItem	struct
CreateEntityTriggerEffectItem	struct
CreateExplosionTriggerEffectItem	struct
CreateFireTriggerEffectItem	struct
CreateGhostOnEntityDeathModifier	struct
CreateParticleTriggerEffectItem	struct
CreateSmokeTriggerEffectItem	struct
CreateSpacePlatformTechnologyTrigger	struct
CreateStickerTriggerEffectItem	struct
CreateTrivialSmokeEffectItem	struct
CursorBoxType	union
One of the following values:

CyclicSound	struct
Used by BaseAttackParameters to play a sound during the attack.

DamageParameters	struct
Used to specify what type of damage and how much damage something deals.

DamageTileTriggerEffectItem	struct
DamageTriggerEffectItem	struct
DamageTypeFilters	struct or DamageTypeID or array[DamageTypeID]
DamageTypeID	string
The name of a DamageType.

Data	struct
The data table is read by the game to load all prototypes. [...]

DataExtendMethod	builtin
The data.extend method. [...]

DaytimeColorLookupTable	array[{double, ColorLookupTable}]
The first member of the tuple states at which time of the day the LUT should be used. [...]

DeconstructionTimeToLiveModifier	struct
DecorativeID	string
The name of a DecorativePrototype.

DelayedTriggerDelivery	struct
DependenciesMetTipTrigger	struct
This trigger is considered fulfilled when the TipsAndTricksItem::dependencies are fulfilled.

DestroyCliffsCapsuleAction	struct
DestroyCliffsTriggerEffectItem	struct
DestroyDecorativesTriggerEffectItem	struct
DifficultySettings	struct
DirectTriggerItem	struct
Direction	union
Usually specified by using defines.direction.

DirectionString	union
One of the 16 directions, specified with a string.

DoubleSliderStyleSpecification	struct
DropDownStyleSpecification	struct
DropItemTipTrigger	struct
Effect	struct
When applied to modules, the resulting effect is a sum of all module effects, multiplied through calculations: (1 + sum module effects), or (0 + sum) for productivity. [...]

EffectReceiver	struct
EffectRelativeTo	union
Identifies what CloudEffectStyle refers to.

EffectTexture	struct
EffectTypeLimitation	union or array[union]
A list of module effects, or just a single effect. [...]

EffectValue	float
Precision is ignored beyond two decimals - 0.567 results in 0.56 and means 56% etc. [...]

EffectVariation	union
ElectricEnergySource	struct
ElectricUsagePriority	union
Used to specify priority of energy usage in the electric system.

ElementImageSet	struct or ElementImageSetLayer
If this is loaded as a single ElementImageSetLayer, it gets used as base.

ElementImageSetLayer	struct or Sprite
If this is loaded as a Sprite, it gets used as center.

EmptyWidgetStyleSpecification	struct
EnemyEvolutionSettings	struct
EnemyExpansionSettings	struct
EnemySpawnerAbsorption	struct
EnemySpawnerGraphicsSet	struct
Energy	string
Specifies an amount of electric energy in joules, or electric energy per time in watts. [...]

EnergySource	union
Loaded as one of the BaseEnergySource extensions, based on the value of the type key.

EnterVehicleTipTrigger	struct
EntityBuildAnimationPiece	struct
A single tiles worth of animations used when building entities.

EntityID	string
The name of an EntityPrototype.

EntityIDFilter	struct or EntityID
EntityPrototypeFlags	array[union]
An array containing the following values. [...]

EntityStatus	union
EntityTransferTipTrigger	struct
EquipmentCategoryID	string
The name of an EquipmentCategory.

EquipmentGridID	string
The name of an EquipmentGridPrototype.

EquipmentID	string
The name of an EquipmentPrototype.

EquipmentShape	struct
The shape and dimensions of an equipment module.

ExplosionDefinition	EntityID or struct
Fade	struct or AttenuationType
Fades	struct
FastBeltBendTipTrigger	struct
FastReplaceTipTrigger	struct
FeatureFlags	struct
A dictionary of feature flags and their status. [...]

FileName	string
A slash "/" is always used as the directory delimiter. [...]

FlipEntityTipTrigger	struct
FlowStyleSpecification	struct
FluidAmount	double
A fluid amount. [...]

FluidBox	struct
Used to set the fluid amount an entity can hold, as well as the connection points for pipes leading into and out of the entity. [...]

FluidBoxLinkedConnectionID	uint32
FluidEnergySource	struct
FluidID	string
The name of a FluidPrototype.

FluidIngredientPrototype	struct
A fluid ingredient definition.

FluidProductPrototype	struct
A fluid product definition.

FogEffectProperties	struct
FogMaskShapeDefinition	struct
FollowerRobotLifetimeModifier	struct
FootprintParticle	struct
FootstepTriggerEffectItem	struct
FootstepTriggerEffectList	array[FootstepTriggerEffectItem]
ForceCondition	union
One of the following values:

FrameStyleSpecification	struct
FrequencySizeRichness	struct
FuelCategoryID	string
The name of a FuelCategory.

FusionGeneratorDirectionGraphicsSet	struct
FusionGeneratorFluidInputGraphics	struct
FusionGeneratorGraphicsSet	struct
FusionReactorConnectionGraphics	struct
FusionReactorGraphicsSet	struct
GameControllerVibrationData	struct
GameViewSettings	struct
GateOverRailBuildTipTrigger	struct
GeneratingPowerTipTrigger	struct
GhostShimmerConfig	struct
GhostShimmerDistortionData	struct
GhostShimmerOverlayData	struct
GhostTintSet	struct
GigaCargoHatchDefinition	struct
GiveItemModifier	struct
GlobalRecipeTints	struct
GlobalTintEffectProperties	struct
GlowStyleSpecification	struct
GraphStyleSpecification	struct
GroupAttackTipTrigger	struct
GunSpeedModifier	struct
HeatBuffer	struct
Used to specify heat capacity properties without a heat energy source.

HeatConnection	struct
Defines the connections for HeatEnergySource and HeatBuffer.

HeatEnergySource	struct
HorizontalAlign	union
HorizontalFlowStyleSpecification	struct
HorizontalScrollBarStyleSpecification	struct
IconData	struct
One layer of an icon. [...]

IconDrawSpecification	struct
Specification of where and how should be the alt-mode icons of entities be drawn.

IconSequencePositioning	struct
Specification of where and how should be the icons of individual inventories be drawn.

ImageStyleSpecification	struct
IngredientPrototype	union
Item or fluid ingredient.

InsertItemTriggerEffectItem	struct
InserterStackSizeBonusModifier	struct
InstantTriggerDelivery	struct
InterruptibleSound	struct
InvokeTileEffectTriggerEffectItem	struct
ItemCountType	uint32
ItemGroupID	string
The name of an ItemGroup.

ItemID	string
The name of an ItemPrototype.

ItemIDFilter	struct or ItemID
ItemIngredientPrototype	struct
An item ingredient definition.

ItemProductPrototype	struct
An item product definition.

ItemPrototypeFlags	array[union]
An array containing the following values.

ItemStackIndex	uint16
ItemSubGroupID	string
The name of an ItemSubGroup.

ItemToPlace	struct
Item that when placed creates this entity/tile.

KillTipTrigger	struct
LabelStyleSpecification	struct
LaboratoryProductivityModifier	struct
LaboratorySpeedModifier	struct
LayeredSound	struct or Sound
LayeredSprite	struct or array[LayeredSprite]
LayeredSpriteVariations	array[LayeredSprite]
LightDefinition	struct or array[struct]
Specifies a light source. [...]

LightFlickeringDefinition	struct
Specifies the light flicker. [...]

LightProperties	struct
LightningGraphicsSet	struct
LightningPriorityRule	struct
LightningProperties	struct
LightningRuleBase	struct
LimitChestTipTrigger	struct
LineStyleSpecification	struct
LineTriggerItem	struct
LinkedGameControl	union
The internal name of a game control (key binding).

ListBoxStyleSpecification	struct
LoaderStructure	struct
LocalisedString	string or array[LocalisedString]
Localised strings are a way to support translation of in-game text. [...]

LogisticFilterIndex	uint16
LootItem	struct
The items generated when an EntityWithHealthPrototype is killed.

LowPowerTipTrigger	struct
MainSound	struct
ManualTransferTipTrigger	struct
ManualWireDragTipTrigger	struct
MapGenPreset	struct
MapGenPresetAsteroidSettings	struct
MapGenPresetDifficultySettings	struct
MapGenPresetEnemyEvolutionSettings	struct
MapGenPresetEnemyExpansionSettings	struct
MapGenPresetPollutionSettings	struct
The pollution settings, the values are for 60 ticks (1 second).

MapGenSettings	struct
MapGenSize	union
A floating point number specifying an amount. [...]

MapPosition	struct or {double, double}
Coordinates of a tile in a map. [...]

MapTick	uint64
math.huge represents the maximum possible tick.

MaterialAmountType	double
MaterialTextureParameters	struct
Used by TilePrototype.

MathExpression	string
A string that represents a math expression. [...]

MaxFailedAttemptsPerTickPerConstructionQueueModifier	struct
MaxSuccessfulAttemptsPerTickPerConstructionQueueModifier	struct
MaximumFollowingRobotsCountModifier	struct
MinableProperties	struct
The mining properties of objects. [...]

MineEntityTechnologyTrigger	struct
MineItemByRobotTipTrigger	struct
MinimapStyleSpecification	struct
MiningDrillGraphicsSet	struct
Used by MiningDrillPrototype.

MiningDrillProductivityBonusModifier	struct
MiningWithFluidModifier	struct
Mirroring	union
ModSetting	struct
The user-set value of a startup mod setting.

Modifier	union
The effect that is applied when a TechnologyPrototype is researched. [...]

Mods	dictionary[string → string]
A dictionary of mod names to mod versions of all active mods. [...]

ModuleCategoryID	string
The name of a ModuleCategory.

ModuleTint	union
ModuleTransferTipTrigger	struct
MouseCursorID	string
The name of a MouseCursor.

NeighbourConnectable	struct
Defines how this entity connects to its neighbours

NeighbourConnectableConnectionCategory	string
NeighbourConnectableConnectionDefinition	struct
In order for 2 NeighbourConnectable to connect they need to share a connection point at the same position with opposite direction and both accept neighbor's category.

NestedTriggerEffectItem	struct
NoiseExpression	string or boolean or double
A boolean or double as simple values or a string that represents a math expression. [...]

NoiseFunction	struct
The advantage of noise functions over noise expressions is that they have parameters.

NothingModifier	struct
OffshorePumpGraphicsSet	struct
OrTipTrigger	struct
Order	string
The order property is a simple string. [...]

OrientedCliffPrototype	struct
ParticleID	string
The name of a ParticlePrototype.

PasteEntitySettingsTipTrigger	struct
PathFinderSettings	struct
PerceivedPerformance	struct
Not all prototypes that use this type are affected by all properties.

PersistentWorldAmbientSoundDefinition	struct or Sound
PersistentWorldAmbientSoundsDefinition	struct
PersistentWorldAmbientSoundsDefinitionCrossfade	struct
PipeConnectionDefinition	struct
PipePictures	struct
PlaceEquipmentTipTrigger	struct
PlanTrainPathTipTrigger	struct
PlanetPrototypeMapGenSettings	struct
PlaySoundTriggerEffectItem	struct
PlayerInputMethodFilter	union
PlumeEffect	struct
PlumesSpecification	struct
PodAnimationProcessionLayer	struct
PodDistanceTraveledProcessionLayer	struct
PodMovementProcessionLayer	struct
PodOpacityProcessionLayer	struct
PollutionSettings	struct
The pollution settings, the values are for 60 ticks (1 second).

ProbabilityTable	array[ProbabilityTableItem]
Probabilities of all items must add up to 100.

ProbabilityTableItem	{uint8, uint8}
The first number is the value. [...]

ProcessionAudio	struct
ProcessionAudioCatalogue	array[ProcessionAudioCatalogueItem]
Allows a prototype to load variable amount of sounds which may be referenced by index.

ProcessionAudioCatalogueItem	struct
ProcessionAudioEvent	struct
Controls sounds during procession.

ProcessionAudioEventType	union
Type of ProcessionAudioEvent.

ProcessionAudioType	union
Types of ProcessionAudio.

ProcessionAudioUsage	union
Who will hear ProcessionAudioEvent.

ProcessionGraphic	struct
ProcessionGraphicCatalogue	array[ProcessionGraphicCatalogueItem]
Allows a prototype to load variable amount of sprites which may be referenced by index.

ProcessionGraphicCatalogueItem	struct
Either picture or animation must be provided.

ProcessionGraphicType	union
Types of ProcessionGraphic.

ProcessionID	string
The name of a ProcessionPrototype.

ProcessionLayer	union
Describes one aspect of a procession. [...]

ProcessionLayerInheritanceGroupID	string
The name of an ProcessionLayerInheritanceGroup.

ProcessionLayerWithTime	ProcessionLayer
ProcessionSet	struct
Lists arrivals and departures available for travel to a given surface.

ProcessionTimeline	struct
A wrapper for a collection of ProcessionLayers.

ProductPrototype	union
ProductionHealthEffect	struct
ProgrammableSpeakerNote	struct
ProgressBarStyleSpecification	struct
ProjectileAttackParameters	struct
ProjectileTriggerDelivery	struct
PrototypeStrafeSettings	struct
Used by UnitPrototype.

PuddleTileEffectParameters	struct
PumpConnectorGraphics	struct
A mapping of arrays of PumpConnectorGraphicsAnimations to all 4 directions of the pump connection (to a fluid wagon).

PumpConnectorGraphicsAnimation	struct
PushBackTriggerEffectItem	struct
The push back effect used by the discharge defense. [...]

QualityID	string
The name of a QualityPrototype.

RadioButtonStyleSpecification	struct
RadiusVisualisationSpecification	struct
Sprite to be shown around the entity when it is selected/held in the cursor.

RailFenceDirectionSet	struct
RailFenceGraphicsSet	struct
Used for graphics by RailPrototype.

RailFencePictureSet	struct
RailPictureSet	struct
RailPieceLayers	struct
Used for graphics by RailPrototype and RailRemnantsPrototype.

RailPlannerAllowElevatedRailsModifier	struct
RailRenderLayers	struct
RailSignalColorToFrameIndex	struct
RailSignalLightDefinition	struct
RailSignalLights	struct
RailSignalPictureSet	struct
RailSignalStaticSpriteLayer	struct
RailSupportOnDeepOilOceanModifier	struct
RandomRange	union
Define a numerical property in terms of minimum and maximum to be used as a randomly chosen value in that range (inclusively). [...]

RangeMode	union
RangedValue	{float, float} or float
RealOrientation	float
Specified by a float between 0 and 1, including 0 and excluding 1.

RecipeCategoryID	string
The name of a RecipeCategory.

RecipeID	string
The name of a RecipePrototype.

RecipeTints	struct
If no tint is specified, the machine falls back to WorkingVisualisations::default_recipe_tint.

RenderLayer	union
The render layer specifies the order of the sprite when rendering, most of the objects have it hardcoded in the source, but some are configurable. [...]

ResearchIngredient	{ItemID, uint16}
Defines the amount of an item required to research one unit of a technology. [...]

ResearchProgressProductPrototype	struct
A research progress product definition.

ResearchTechnologyTipTrigger	struct
ResearchWithSciencePackTipTrigger	struct
Resistance	struct
Resistances to certain types of attacks from enemy, and physical damage. [...]

ResourceCategoryID	string
The name of a ResourceCategory.

RichTextSetting	union
RollingStockRotatedSlopedGraphics	struct
RotateEntityTipTrigger	struct
RotatedAnimation	struct
RotatedAnimation8Way	struct or RotatedAnimation
A map of rotated animations for all 8 directions of the entity. [...]

RotatedAnimationVariations	RotatedAnimation or array[RotatedAnimation]
RotatedSprite	struct
Specifies series of sprites used to visualize different rotations of the object.

RotatedSpriteFrame	struct
Specifies frame-specific properties of an individual sprite within a RotatedSprite set. [...]

ScriptTriggerEffectItem	struct
ScrollBarStyleSpecification	struct
ScrollPaneStyleSpecification	struct
SegmentEngineSpecification	struct
Used by SegmentedUnitPrototype to define and manage the segments that make up the body of the entity.

SegmentSpecification	struct
A container for an individual instance of a SegmentPrototype within a SegmentEngineSpecification. [...]

SelectionModeData	struct
SelectionModeFlags	union or array[union]
An array containing the following values.

SemiPersistentWorldAmbientSoundDefinition	struct or Sound
SendItemToOrbitTechnologyTrigger	struct
SendSpidertronTipTrigger	struct
SendToOrbitMode	union
SequenceTipTrigger	struct
SetFilterTipTrigger	struct
SetLogisticRequestTipTrigger	struct
SetRecipeTipTrigger	struct
SetTileTriggerEffectItem	struct
Settings	struct
A struct that provides access to the user-set values of startup mod settings.

ShiftAnimationWaypoints	struct
ShootTipTrigger	struct
ShowExplosionOnChartTriggerEffectItem	struct
SignalColorMapping	struct
SignalIDConnector	struct
SimpleBoundingBox	struct or {MapPosition, MapPosition}
An axis aligned bounding box. [...]

SimpleModifier	struct
SimulationDefinition	struct
Used by tips and tricks and main menu simulations. [...]

SingleGraphicProcessionLayer	struct
SliderStyleSpecification	struct
SmokeSource	struct
Definition of the smoke of an entity.

Sound	struct or array[SoundDefinition]
SoundAccent	struct
SoundDefinition	struct or FileName
SoundModifier	struct
SoundModifierType	union
SoundType	union
This defines which slider in the sound settings affects the volume of this sound. [...]

SpaceConnectionAsteroidSpawnDefinition	struct or {EntityID, array[SpaceConnectionAsteroidSpawnPoint]}
SpaceConnectionAsteroidSpawnPoint	struct
SpaceConnectionID	string
The name of a SpaceConnectionPrototype.

SpaceDustEffectProperties	struct
SpaceLocationAsteroidSpawnDefinition	struct
SpaceLocationID	string
The name of a SpaceLocationPrototype.

SpacePlatformTileDefinition	struct
SpacePlatformsModifier	struct
SpaceTileEffectParameters	struct
Nebulae are rendered only behind tiles with the effect, but stars are rendered behind entire terrain. [...]

SpacingItem	struct
SpawnPoint	struct or {double, double}
The definition of a evolution and probability weights for a spawnable unit for a EnemySpawnerPrototype. [...]

SpeechBubbleStyleSpecification	struct
SpiderEngineSpecification	struct
Used by SpiderVehiclePrototype.

SpiderLegPart	struct
SpiderLegSpecification	struct
Used by SpiderEngineSpecification for SpiderVehiclePrototype.

SpiderLegTriggerEffect	struct
SpiderTorsoGraphicsSet	struct
SpiderVehicleGraphicsSet	struct
Used to specify the graphics for SpiderVehiclePrototype.

SpoilToTriggerResult	struct
Sprite	struct
Specifies one picture that can be used in the game. [...]

Sprite16Way	struct
A map of sprites for all 16 directions of the entity.

Sprite4Way	struct or Sprite
Sprites for the 4 major directions of the entity. [...]

SpriteFlags	array[union]
An array containing the following values.

SpriteNWaySheet	struct
SpriteParameters	struct
SpritePriority	union
This sets the "caching priority" of a sprite, so deciding priority of it being included in VRAM instead of streaming it and is therefore a purely technical value. [...]

SpriteSheet	struct
SpriteSizeType	int16
SpriteSource	struct
SpriteUsageHint	union
Provides hint to sprite atlas system, so it can pack sprites that are related to each other to the same sprite atlas.

SpriteUsageSurfaceHint	union
Provides hint to sprite atlas system, so it can try to put sprites that are intended to be used at the same locations to the same sprite atlas.

SpriteVariations	struct or SpriteSheet or array[Sprite]
StackTransferTipTrigger	struct
StateSteeringSettings	struct
StatelessVisualisation	struct
StatelessVisualisations	StatelessVisualisation or array[StatelessVisualisation]
StatusColors	struct
StreamAttackParameters	struct
StreamTriggerDelivery	struct
StretchRule	union
Sets whether a GUI element can be stretched or squashed.

Stripe	struct
Used as an alternative way to specify animations.

StyleSpecification	union
Loaded as one of the BaseStyleSpecification extensions, based on the value of the type key.

StyleWithClickableGraphicalSetSpecification	struct
SurfaceCondition	struct
Requires Space Age to use.

SurfaceID	string
The name of a SurfacePrototype.

SurfacePropertyID	string
The name of a SurfacePropertyPrototype.

SurfaceRenderParameters	struct
SwitchStyleSpecification	struct
TabStyleSpecification	struct
TabbedPaneStyleSpecification	struct
TableStyleSpecification	struct
TechnologyID	string
The name of a TechnologyPrototype.

TechnologySlotStyleSpecification	struct
TechnologyTrigger	union
Loaded as one of the technology triggers, based on the value of the type key.

TechnologyUnit	struct
Either count or count_formula must be defined, never both.

TerritorySettings	struct
TextBoxStyleSpecification	struct
ThrowCapsuleAction	struct
ThrusterGraphicsSet	struct
ThrusterPerformancePoint	struct or {double, double, double}
TileBasedParticleTints	struct
Used for particles created with apply_tile_tint defined.

TileBuildabilityRule	struct
TileEffectDefinitionID	string
The name of an TileEffectDefinition.

TileID	string
The name of a TilePrototype.

TileLightPictures	struct
TileMainPictures	struct
TilePosition	struct or {int32, int32}
Coordinates of a tile on a map where each integer x/y represents a different tile. [...]

TileRenderLayer	union
TileSpriteLayout	struct
TileSpriteLayoutVariant	struct
TileTransitionSpritesheetLayout	struct
The properties from the parent TileSpriteLayoutVariant provide defaults for the TileTransitionVariantLayouts. [...]

TileTransitionVariantLayout	struct
The properties from the parent TileSpriteLayoutVariant provide defaults for the properties defined here. [...]

TileTransitions	struct
Used for TilePrototype graphics. [...]

TileTransitionsBetweenTransitions	struct
TileTransitionsToTiles	struct
TileTransitionsVariants	struct
TimeElapsedTipTrigger	struct
TimeSinceLastTipActivationTipTrigger	struct
TintProcessionLayer	struct
Fullscreen overlay which blends gradient from top to bottom edge of the screen using premultiplied alpha blending.

TipStatus	union
This is used by TipsAndTricksItem for the initial starting status. [...]

TipTrigger	union
Loaded as one of the tip triggers, based on the value of the type key.

ToggleRailLayerTipTrigger	struct
ToggleShowEntityInfoTipTrigger	struct
TrainBrakingForceBonusModifier	struct
TrainStopLight	struct
TrainVisualizationConstants	struct
TransitionApplication	struct
TransportBeltAnimationSet	struct
TransportBeltAnimationSetWithCorners	struct
TransportBeltConnectorFrame	struct
Used to define the graphics for the (in vanilla) yellow frame that is used when a TransportBeltPrototype is connected to the circuit network.

TreeVariation	struct
Tree has number of "dying" stages, which is deduced from frame count of shadow if shadow is defined, otherwise from frame count of trunk. [...]

Trigger	union or array[union]
Loaded as one of the TriggerItem extensions, based on the value of the type key.

TriggerDelivery	union
Loaded as one of the TriggerDeliveryItem extensions, based on the value of the type key.

TriggerDeliveryItem	struct
The abstract base of all TriggerDeliveries.

TriggerEffect	union or array[union]
Loaded as one of the TriggerEffectItem extensions, based on the value of the type key.

TriggerEffectItem	struct
The abstract base of all TriggerEffects.

TriggerEffectWithCooldown	struct
A TriggerEffect with cooldown conditions, used to limit the frequency of trigger effects that would otherwise fire every single tick. [...]

TriggerItem	struct
The abstract base of all Triggers.

TriggerTargetMask	array[string]
An array of names of TriggerTargetType. [...]

TrivialSmokeID	string
The name of a TrivialSmokePrototype.

TurretAttackModifier	struct
TurretBaseVisualisation	struct
TurretGraphicsSet	struct
TurretSpecialEffect	struct
TurretSpecialEffectCenter	struct or Vector
If this is loaded as a single Vector, it is used for all directions.

TurretState	union
UnitAISettings	struct
Used by UnitPrototype and SpiderUnitPrototype.

UnitAlternativeFrameSequence	struct
UnitGroupSettings	struct
UnitSpawnDefinition	struct or {EntityID, array[SpawnPoint]}
It can be specified as a table with named or numbered keys, but not a mix of both. [...]

UnlockQualityModifier	struct
UnlockRecipeModifier	struct
UnlockRecipeTipTrigger	struct
UnlockSpaceLocationModifier	struct
UseConfirmTipTrigger	struct
UseOnSelfCapsuleAction	struct
UsePipetteTipTrigger	struct
UseRailPlannerTipTrigger	struct
VariableAmbientSoundCompositionMode	union
Defines how are individual samples selected and played after each other.

VariableAmbientSoundLayer	struct
VariableAmbientSoundLayerSample	{string, uint32}
First property is the name of a layer. [...]

VariableAmbientSoundLayerStateProperties	struct
VariableAmbientSoundNextStateConditions	struct
VariableAmbientSoundNextStateItem	struct
VariableAmbientSoundNextStateTrigger	union
Defines how a transition to next state is triggered.

VariableAmbientSoundState	struct
VariableAmbientSoundStateType	union
VariableAmbientSoundVariableSound	struct
Vector	struct or {double, double}
A vector is a two-element array or dictionary containing the x and y components. [...]

Vector3D	struct or {float, float, float}
If this is specified as a three-element array then the array items are x, y and z, in that order.

Vector4f	struct or {float, float, float, float}
VehicleLogisticsModifier	struct
VerticalAlign	union
VerticalFlowStyleSpecification	struct
VerticalScrollBarStyleSpecification	struct
VirtualSignalID	string
The name of a VirtualSignalPrototype.

VisualState	struct
VoidEnergySource	struct
Void energy sources provide unlimited free energy.

WaterReflectionDefinition	struct
Entity water reflection. [...]

WaterTileEffectParameters	struct
Weight	double
Weight of an object. [...]

WireConnectionPoint	struct
Definition of a point where circuit network wires can be connected to an entity.

WirePosition	struct
Used by WireConnectionPoint.

WorkerRobotBatteryModifier	struct
WorkerRobotSpeedModifier	struct
WorkerRobotStorageModifier	struct
WorkingSound	struct or Sound
This type is used to produce sound from in-game entities when they are working/idle.

WorkingVisualisation	struct
Used by crafting machines to display different graphics when the machine is running.

WorkingVisualisations	struct
WorldAmbientSoundDefinition	struct or Sound
boolean	builtin
A variable type which can have one of two values: true or false. [...]

double	builtin
Format uses a dot as its decimal delimiter. [...]

float	builtin
Format uses a dot as its decimal delimiter. [...]

int16	builtin
16 bit signed integer. [...]

int32	builtin
32 bit signed integer. [...]

int64	builtin
64 bit signed integer.

int8	builtin
8 bit signed integer. [...]

string	builtin
Strings are enclosed in double-quotes.

uint16	builtin
16 bit unsigned integer. [...]

uint32	builtin
32 bit unsigned integer. [...]

uint64	builtin
64 bit unsigned integer.

uint8	builtin
8 bit unsigned integer. [...]

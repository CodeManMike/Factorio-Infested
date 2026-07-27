return {
  ["ichor-hive-core"] = { kind = "hive-core", is_biological = true },
  ["ichor-substrate-node"] = { kind = "substrate-source", is_biological = true },
  ["ichor-neural-pylon-1"] = { kind = "neural", is_biological = true, radius = 18 },
  ["ichor-growth-chamber-1"] = {
    kind = "bio-building",
    is_biological = true,
    requires_substrate = true,
    requires_neural = true,
    can_mutate = true,
    can_feralize = true,
    feral_variant = "ichor-feral-growth-chamber"
  },
  ["ichor-feral-growth-chamber"] = { kind = "feral-building", is_feral = true },
  ["ichor-nutrient-vat-1"] = {
    kind = "bio-building",
    is_biological = true,
    requires_substrate = true,
    requires_neural = true,
    can_mutate = true,
    can_feralize = false
  },
  ["ichor-digestive-smelter-1"] = {
    kind = "bio-building",
    is_biological = true,
    requires_substrate = true,
    requires_neural = true,
    can_mutate = true,
    can_feralize = false
  }
}

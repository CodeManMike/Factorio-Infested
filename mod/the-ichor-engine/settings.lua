data:extend({
  {
    type = "bool-setting",
    name = "ichor-debug-mode",
    setting_type = "runtime-global",
    default_value = false,
    order = "a"
  },
  {
    type = "string-setting",
    name = "ichor-difficulty",
    setting_type = "startup",
    default_value = "hostile",
    allowed_values = {"symbiotic", "hostile", "apex", "feral-world"},
    order = "b"
  },
  {
    type = "double-setting",
    name = "ichor-substrate-spread-multiplier",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
    order = "c"
  },
  {
    type = "bool-setting",
    name = "ichor-lock-cargo-before-escape",
    setting_type = "startup",
    default_value = true,
    order = "d"
  }
})

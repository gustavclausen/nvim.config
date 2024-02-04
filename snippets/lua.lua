require("luasnip.loaders.from_lua").lazy_load()
local env = SNIP_ENV

return {
  env.s(
    "plugin",
    env.fmt(
      [[
        return {{
          "{}",
          config = function ()
          end
        }}
      ]],
      {
        env.i(1, "text"),
      }
    )
  ),
}

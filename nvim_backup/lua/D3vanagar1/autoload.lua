-- Provides a lazy autoload mechanism similar to Vimscript's autoload mechanism.
--
-- Examples:
--
--    " Vimscript - looks for function named `D3vanagar1#foo#bar#baz()` in
--    " autoload/D3vanagar1/foo/bar.vim):
--
--    call D3vanagar1#foo#bar#baz()
--
--    -- Lua - lazy-loads these files in sequence before calling
--    -- `D3vanagar1.foo.bar.baz()`:
--    --
--    --    1. lua/D3vanagar1/foo.lua (or lua/D3vanagar1/foo/init.lua)
--    --    2. lua/D3vanagar1/foo/bar.lua (or lua/D3vanagar1/foo/bar/init.lua)
--    --    3. lua/D3vanagar1/foo/bar/baz.lua (or lua/D3vanagar1/foo/bar/baz/init.lua)
--
--    local D3vanagar1 = require'D3vanagar1'
--    D3vanagar1.foo.bar.baz()
--
--    -- Note that because `require'D3vanagar1'` appears at the top of the top-level
--    -- init.lua, the previous example can be written as:
--
--    D3vanagar1.foo.bar.baz()
--
local autoload = function(base)
  local storage = {}
  local mt = {
    __index = function(_, key)
      if storage[key] == nil then
        storage[key] = require(base .. '.' .. key)
      end
      return storage[key]
    end
  }

  return setmetatable({}, mt)
end

return autoload

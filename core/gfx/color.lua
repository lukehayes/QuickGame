-----------------------------------------------------------
-- Color.
--
-- Helper methods and static color fields.
--
-- @module core.gfx.color
local Color = {}

-----------------------------------------------------------
-- Color.RED
-- @table Color.RED
Color.RED   = {r = 1, g = 0, b = 0, a = 1}

-----------------------------------------------------------
-- Color.GREEN
-- @table Color.GREEN
Color.GREEN = {r = 0, g = 1, b = 0, a = 1}

--- Color.BLUE
Color.BLUE  = {r = 0, g = 0, b = 1, a = 1}

--- Color.BLACK
Color.BLACK = {r = 0, g = 0, b = 0, a = 1}

--- Color.WHITE
Color.WHITE = {r = 1, g = 1, b = 1, a = 1}

--- Color.LIGHT_GRAY
Color.LIGHT_GRAY = {r = 0.8, g = 0.8, b = 0.8, a = 1}

--- Color.DARK_GRAY
Color.DARK_GRAY = {r = 0.25, g = 0.25, b = 0.25, a = 1}

--- Color.DEBUG
Color.DEBUG = {r = 1, g = 0, b = 1, a = 1}

return Color

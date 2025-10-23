local ui = dofile("tower_ui.lua")
local core = dofile("tower_core.lua")

-- Lade gespeicherten Stand
core.load()

-- Zeichne UI
ui.draw()

-- Starte Touchscreen Input Loop
ui.input()

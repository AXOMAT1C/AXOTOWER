local core = dofile("tower_core.lua")
local tower = dofile("tower.lua")
local texts = dofile("texts.lua")
local ui = dofile("tower_ui.lua")

-- Init Tower
tower.init()

-- Init UI
ui.init(tower, texts)

-- Load Saved State
core.load()

-- UI zeichnen + Input starten
ui.draw()
ui.input()

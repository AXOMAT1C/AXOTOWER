local ui = {}
local tower = dofile("tower.lua")
local texts = dofile("texts.lua")

ui.lang = "de"

local width, height = term.getSize()

-- Zeichnet einen Button für ein Projekt
local function draw_button(x, y, w, h, label, done)
    paintutils.drawFilledBox(x, y, x+w, y+h, done and colors.lime or colors.gray)
    term.setCursorPos(x + 1, y)
    term.write(label)
end

function ui.draw()
    term.clear()
    term.setCursorPos(1,1)
    print("--- "..texts.get_text(ui.lang, "projects").." ---\n")

    local row = 3 -- Startzeile für Projekte
    for _, cat in ipairs({"primary","secondary"}) do
        term.setCursorPos(1, row)
        print(texts.get_text(ui.lang, cat)..":")
        row = row + 1

        local projects = tower.get_projects(cat)
        for i, p in ipairs(projects) do
            draw_button(2, row, 20, 1, p.name, p.done)
            row = row + 2 -- Abstand zwischen Buttons
        end
        row = row + 1
    end
    print("\nTippe auf ein Feld, um es zu togglen.")
end

function ui.input()
    while true do
        local event, side, x, y = os.pullEvent("monitor_touch")
        -- Berechne, welches Projekt getoggled wird
        local row = y - 3 -- Header offset
        local primary_len = #tower.get_projects("primary")
        local category, index

        if row <= primary_len then
            category = "primary"
            index = row
        elseif row > primary_len and row <= primary_len + #tower.get_projects("secondary") then
            category = "secondary"
            index = row - primary_len
        else
            category = nil
            index = nil
        end

        if category and index then
            tower.toggle(category, index)
            ui.draw()
        end
    end
end

return ui

local ui = {}

-- Init mit Tower und Textmodul
function ui.init(tower_module, texts_module)
    ui.tower = tower_module
    ui.texts = texts_module
    ui.lang = "de"
end

-- Button zeichnen
local function draw_button(x, y, w, h, label, done)
    paintutils.drawFilledBox(x, y, x+w, y+h, done and colors.lime or colors.gray)
    term.setCursorPos(x+1, y)
    term.write(label)
end

-- UI zeichnen
function ui.draw()
    term.clear()
    term.setCursorPos(1,1)
    print("--- "..ui.texts.get_text(ui.lang,"projects").." ---\n")
    local row = 3

    for _, cat in ipairs({"primary","secondary"}) do
        term.setCursorPos(1,row)
        print(ui.texts.get_text(ui.lang, cat)..":")
        row = row + 1

        local projects = ui.tower.get_projects(cat)
        for i, p in ipairs(projects) do
            draw_button(2,row,20,1,p.name,p.done)
            row = row + 2
        end
        row = row + 1
    end
    print("\nTippe auf ein Feld, um es zu togglen.")
end

-- Touchscreen Input
function ui.input()
    while true do
        local event, side, x, y = os.pullEvent("monitor_touch")
        local row = y - 3
        local primary_len = #ui.tower.get_projects("primary")
        local category, index

        if row <= primary_len then
            category = "primary"
            index = row
        elseif row > primary_len and row <= primary_len + #ui.tower.get_projects("secondary") then
            category = "secondary"
            index = row - primary_len
        end

        if category and index then
            ui.tower.toggle(category,index)
            ui.draw()
        end
    end
end

return ui

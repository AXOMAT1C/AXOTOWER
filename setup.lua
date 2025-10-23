-- Setup Skript für AXOTOWER (CraftOS 1.9 / CC Tweaks)
-- Erstellt Ordner, lädt alle Dateien einzeln per wget und startet init.lua

local folder = "AXOTOWER"

-- Ordner erstellen, falls nicht vorhanden
if not fs.exists(folder) then
    fs.makeDir(folder)
end

-- Liste der Dateien mit Raw GitHub URLs
local files = {
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower_core.lua", name = "tower_core.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower.lua", name = "tower.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/texts.lua", name = "texts.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower_ui.lua", name = "tower_ui.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/init.lua", name = "init.lua"}
}

-- Dateien herunterladen
for _, f in ipairs(files) do
    local path = folder.."/"..f.name
    if not fs.exists(path) then
        print("Downloading "..f.name.." ...")
        shell.run("wget "..f.url.." "..path)
    else
        print(f.name.." exists, skipping.")
    end
end

print("\nDownload complete. Starte AXOTOWER...\n")

-- init.lua laden und starten
dofile(folder.."/init.lua")

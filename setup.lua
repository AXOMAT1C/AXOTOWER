-- Setup Skript für AXOTOWER in CC Tweaks
-- Erstellt den Ordner, lädt alle Dateien herunter und startet init.lua

local folder = "AXOTOWER"

-- Ordner erstellen, falls er nicht existiert
if not fs.exists(folder) then
    fs.makeDir(folder)
end

-- Wechsle in den Ordner
shell.run("cd "..folder)

-- Liste der Dateien mit Raw GitHub URLs
local files = {
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/init.lua", name = "init.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower_core.lua", name = "tower_core.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower.lua", name = "tower.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/tower_ui.lua", name = "tower_ui.lua"},
    {url = "https://raw.githubusercontent.com/AXOMAT1C/AXOTOWER/main/texts.lua", name = "texts.lua"},
}

-- Dateien herunterladen
for _, f in ipairs(files) do
    if not fs.exists(folder.."/"..f.name) then
        print("Downloading "..f.name.." ...")
        shell.run("wget "..f.url.." "..f.name)
    else
        print(f.name.." exists, skipping.")
    end
end

print("\nDownload complete. Starte AXOTOWER...\n")
shell.run("cd "..folder)
dofile(folder.."/init.lua")

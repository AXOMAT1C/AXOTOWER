local core = {}

core.save_file = "tower_state.dat"

-- Beispiel-Datenstruktur
core.state = {
    primary = {},
    secondary = {}
}

-- Speichern
function core.save()
    local file = fs.open(core.save_file, "w")
    file.write(textutils.serialize(core.state))
    file.close()
end

-- Laden
function core.load()
    if fs.exists(core.save_file) then
        local file = fs.open(core.save_file, "r")
        core.state = textutils.unserialize(file.readAll())
        file.close()
    end
end

return core

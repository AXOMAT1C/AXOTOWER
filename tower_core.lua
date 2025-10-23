local core = {}
core.datafile = "tower_state.txt"
core.state = {
    projects = {},
    primary = {},
    secondary = {}
}

-- Speichern
function core.save()
    local file = fs.open(core.datafile, "w")
    if file then
        file.write(textutils.serialize(core.state))
        file.close()
        return true
    end
    return false
end

-- Laden
function core.load()
    if fs.exists(core.datafile) then
        local file = fs.open(core.datafile, "r")
        core.state = textutils.unserialize(file.readAll()) or core.state
        file.close()
        return true
    end
    return false
end

-- Projekt hinzufügen
function core.add_project(name, category)
    category = category:lower()
    if not core.state[category] then
        core.state[category] = {}
    end
    table.insert(core.state[category], {name = name, done = false})
    core.save()
end

-- Projekt abhaken
function core.toggle_project(category, index)
    if core.state[category] and core.state[category][index] then
        core.state[category][index].done = not core.state[category][index].done
        core.save()
    end
end

return core

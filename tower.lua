local core = dofile("tower_core.lua")
local tower = {}

-- Beispielprojekte
local default_projects = {
    primary = {
        {name="Projekt 1", done=false},
        {name="Projekt 2", done=false},
    },
    secondary = {
        {name="Projekt A", done=false},
        {name="Projekt B", done=false},
    }
}

-- Initialisierung (nur wenn leer)
function tower.init()
    if not core.state.primary or #core.state.primary == 0 then
        core.state = default_projects
    end
end

-- Hol Projekte einer Kategorie
function tower.get_projects(category)
    return core.state[category] or {}
end

-- Toggle Done
function tower.toggle(category, index)
    local projects = tower.get_projects(category)
    if projects[index] then
        projects[index].done = not projects[index].done
        core.save()
    end
end

return tower

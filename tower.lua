local tower = {}
local core = dofile("tower_core.lua")

function tower.get_projects(category)
    category = category:lower()
    return core.state[category] or {}
end

function tower.add(category, name)
    core.add_project(name, category)
end

function tower.toggle(category, index)
    core.toggle_project(category, index)
end

return tower

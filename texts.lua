local texts = {}

texts.data = {
    de = {
        projects = "Projekte",
        primary = "Primäre Ziele",
        secondary = "Sekundäre Ziele",
    },
    en = {
        projects = "Projects",
        primary = "Primary Goals",
        secondary = "Secondary Goals",
    },
    pl = {
        projects = "Projekty",
        primary = "Cele główne",
        secondary = "Cele drugorzędne",
    }
}

function texts.get_text(lang, key)
    lang = lang or "de"
    if texts.data[lang] and texts.data[lang][key] then
        return texts.data[lang][key]
    end
    return key
end

return texts

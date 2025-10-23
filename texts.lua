local texts = {
    de = {
        primary = "Prim\u00e4re Ziele",
        secondary = "Sekund\u00e4re Ziele",
        projects = "Projekte",
        save_success = "Speichern erfolgreich!",
        load_fail = "Keine gespeicherten Daten gefunden."
    },
    en = {
        primary = "Primary Goals",
        secondary = "Secondary Goals",
        projects = "Projects",
        save_success = "Save successful!",
        load_fail = "No saved data found."
    },
    pl = {
        primary = "Cele g\u0142\u00f3wne",
        secondary = "Cele poboczne",
        projects = "Projekty",
        save_success = "Zapisano pomy\u015blnie!",
        load_fail = "Brak zapisanych danych."
    }
}

local function get_text(lang, key)
    lang = lang:lower()
    if texts[lang] and texts[lang][key] then
        return texts[lang][key]
    else
        return key
    end
end

return { get_text = get_text }

fx_version "cerulean"
game "gta5"

lua54 "yes"

author "Zerio#0880"
description "Free and stunning progress bar made by Zerio from store.zerio-scripts.com"

escrow_ignore {
    "*.lua",
    "locales/*.lua",
    "client/*.lua",
}

shared_scripts {
    "locale.lua",
    "locales/*.lua",
}

client_scripts {
    "config.lua",
    "client/functions.lua",
    "client/main.lua"
}

files {
    "html/libs/*.js",
    "html/style.css",
    "html/index.html"
}

ui_page "html/index.html"
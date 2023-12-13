fx_version 'cerulean'
games { 'gta5' }

author 'Peppe Premium'
description 'ESX Health and Armor Save/Restore Script'
version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- If you're using mysql-async
    'server.lua'
}

client_scripts {
    'client.lua'
}

dependencies {
    'es_extended', -- Depend on the version of ESX you are using
    'mysql-async'  -- If you're using mysql-async
}

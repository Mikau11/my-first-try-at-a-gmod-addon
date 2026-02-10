--Shared Script

-- ------------------------------------------ --
-- --------------Shared Variables------------ --
-- ------------------------------------------ --
local suicide_death_count = 0
local npc_death_count = 0
local plaeyr_death_count = 0

local npc_kill_count = 0
local npc_kill_first = True

-- ------------------------------------------ --
-- --------------Hook Functions-------------- --
-- ------------------------------------------ --



--Player spawn stuff, Death stuff
function on_first_respawn(player)
    player:ChatPrint("Welcome to my addon!")
    player:ChatPrint("To see a list of commands")
end

function Spawn(player)
	player:ChatPrint( player:Nick() .. " has spawned!" ) --nick means nickname
end

function ondeath(dead_player, inflictor, murderer)
    if dead_player == murderer or dead_player == inflictor or not murderer:IsValid() then
        suicide_death_count = suicide_death_count + 1
        dead_player:ChatPrint(dead_player:Nick() .. " has killed themselves!!!!!")
        if suicide_death_count >= 5 then
            dead_player:ChatPrint("You've killed yourself " .. suicide_death_count .. " times!")
        end
    elseif not murderer:IsPlayer() then
        npc_death_count = npc_death_count + 1
        dead_player:ChatPrint(dead_player:Nick() .. " was killed by " .. murderer:GetModel())
        if npc_death_count >= 5 then
            dead_player:ChatPrint("You've been killed by an npc " .. npc_death_count .. " times!")
        end
    else 
        dead_player:ChatPrint(dead_player:Nick() .. " was killed by " .. murderer:Nick())
        if plaeyr_death_count >= 5 then
            dead_player:ChatPrint("You've been killed by " .. murderer:Nick() .. plaeyr_death_count .. " times!")
            dead_player:ChatPrint("They must really hate you!")
        end
    end
end

function onnpckilled(npc_name, player_killer, inflictor)
    npc_kill_count = npc_kill_count + 1
    if player_killer:IsPlayer() then
        if npc_kill_first == True then
            player_killer:ChatPrint(player_killer:Nick() .. " has killed an npc!")
        else
            player_killer:ChatPrint(player_killer:Nick() .. " has killed another npc!")
        end
        if npc_kill_count >=5 then
            player_killer:ChatPrint(player_killer:Nick() .. " has killed " ..npc_kill_count .. "npcs!")
        end
    end
    npc_kill_first = False
end

--Text commands
function commands(sender, text, teamChat)
    if text == "!crowbar" then
        sender:Give("weapon_crowbar")
    elseif text == "!gravitygun" then
        sender:Give("weapon_physcannon")
    elseif text == "!stunstick" then
        sender:Give("weapon_stunstick")
    elseif text == "!pistol" then
        sender:Give("weapon_pistol")
        sender:Give("item_ammo_pistol")
    elseif text == "!revolver" then
        sender:Give("weapon_357")
        sender:Give("item_ammo_357_large")
    elseif text == "!smg" then
        sender:Give("weapon_smg1")
        sender:Give("item_ammo_smg1_grenade")
    elseif text == "!pulserifle" then
        sender:Give("weapon_ar2")
        sender:Give("item_ammo_ar2_altfire")
    elseif text == "!shotgun" then
        sender:Give("weapon_shotgun")
        sender:Give("item_box_buckshot") --buckshot?, more like ****shot hahahhahahahahahahahahahahaha, i am so unfunny
    elseif text == "crossbow" then
        sender:Give("weapon_crossbow")
    elseif text == "!grenade" then
        sender:Give("weapon_frag")
    elseif text == "!rocketlauncher" then
        sender:Give("weapon_rpg")
    elseif text == "!slam" then
        sender:Give("weapon_slam")
    elseif text == "!bugbait" then
        sender:Give("weapon_bugbait")
    elseif text == "!kill" then
        sender:Kill()
    elseif text == "!respawn" then
        sender:Spawn()
    end
end

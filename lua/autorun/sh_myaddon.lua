--Shared Script


-- ------------------------------------------ --
-- --------------Hook Functions-------------- --
-- ------------------------------------------ --

--Player spawn stuff
function on_first_respawn(player)
    player:ChatPrint("Welcome to my addon!")
    player:ChatPrint("To see a list of commands")
end

function Spawn(player)
	player:ChatPrint( player:Nick() .. " has spawned!" ) --nick means nickname
end

function ondeath(dead_player, inflictor, murderer)
    if dead_player == murderer or dead_player == inflictor then
        dead_player:ChatPrint(dead_player:Nick() .. " has killed themselves!!!!!")
    elseif not murderer:IsPlayer() then
        dead_player:ChatPrint(dead_player:Nick() .. " was killed by" .. murderer:GetModel())
    else 
        dead_player:ChatPrint(dead_player:Nick() .. " was killed by" .. murderer:Nick())
    end
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

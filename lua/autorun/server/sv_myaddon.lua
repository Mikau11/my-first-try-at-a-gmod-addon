--Server Script
include("autorun/sh_myaddon.lua")
print("Hello Gmod!")


--Hooks
hook.Add("PlayerSay", "MyAddonChatCommmands", commands)
hook.Add("PlayerDeath", "Gee_I_Dunno", ondeath)
hook.Add("PlayerInitialSpawn", "first_spawn", on_first_respawn)
hook.Add("PlayerSpawn", "not_first_spawn", Spawn)
hook.Add("OnNPCKilled", "KILL_KILL_KILL_KILL", onnpckilled)
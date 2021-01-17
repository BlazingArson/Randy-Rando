if SERVER then
  AddCSLuaFile()

  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_rdr.vmt")
end

roles.InitCustomTeam(ROLE.name, {
    icon = "vgui/ttt/dynamic/roles/icon_rdr",
    color = Color(131,62,90, 255)
})

function ROLE:PreInitialize()
  self.color = Color(131,62,90, 255)

  self.abbr = "rdr" -- abbreviation
  self.surviveBonus = 0.5 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -16 -- multiplier for teamkill

  self.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment
  self.defaultTeam = TEAM_RANDYRANDO
  self.fallbackTable = {}

  self.conVarData = {
    pct = 0.17, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 12, -- minimum amount of players until this role is able to get selected
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)
    random = 25,
}
end

if SERVER then

  function ROLE:GiveRoleLoadout(ply, isRoleChange) -- gives it a loadout on round start
       ply:GiveEquipmentWeapon("weapon_ttt2mg_randomat") 
  end


  function ROLE:RemoveRoleLoadout(ply, isRoleChange) -- removes loadout on role change
        ply:StripWeapon("weapon_ttt2mg_randomat") 
  end
end
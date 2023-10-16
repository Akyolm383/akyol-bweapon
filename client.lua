local blacklistweapon = {
  GetHashKey("WEAPON_PISTOL"),
  GetHashKey("WEAPON_SMG"),
  GetHashKey("WEAPON_SHOTGUN"),
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(Config.kontrolsure)
    local playerped = PlayerPedId()
    local currentWeapon = GetSelectedPedWeapon(playerped)

    local blacklistmi = false
    for i = 1, #blacklistweapon do
      if currentWeapon == blacklistweapon[i] then
        blacklistmi = true
        break
      end
    end

    if blacklistmi then
      RemoveAllPedWeapons(playerped, true)
    end
  end
end)

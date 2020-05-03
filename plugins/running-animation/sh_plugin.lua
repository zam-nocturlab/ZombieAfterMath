PLUGIN.name = "Running animation"
PLUGIN.author = "TheRealBimo"
PLUGIN.desc = "Add an animation on weapon when you're running."
 
function PLUGIN:CalcMainActivity(client, velocity)
    if (!IsValid(client)) then
        return false
    end
    if(client == NULL) then return end
    local Length2D = velocity:Length2D()
    if (client:GetActiveWeapon() == NULL) then return end
    if (client:GetActiveWeapon():GetClass() == NULL) then return end
    if (client:GetActiveWeapon():GetClass() == "nut_keys") then
        if (Length2D > 100) then -- 100 is my walk speed
            client:GetActiveWeapon():SetHoldType("normal")
        elseif (Length2D > 0 and client:Crouching()) then -- 0 is not moving
            client:GetActiveWeapon():SetHoldType("normal")
        elseif (!client:OnGround()) then
            client:GetActiveWeapon():SetHoldType("normal")
        else
            client:GetActiveWeapon():SetHoldType("passive")
        end
    end
   
    if (client:GetActiveWeapon():GetClass() == "nut_hands") then
        if (!client:isWepRaised()) then
            if (Length2D > 100) then
                client:GetActiveWeapon():SetHoldType("normal")
            elseif (Length2D > 0 and client:Crouching()) then
                client:GetActiveWeapon():SetHoldType("normal")
            elseif (!client:OnGround()) then
                client:GetActiveWeapon():SetHoldType("normal")
            end
        else
            client:GetActiveWeapon():SetHoldType("fist")
        end
    end
   
end

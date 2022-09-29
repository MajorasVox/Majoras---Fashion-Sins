local function GetForwardPosition(char, distanceMult, fromPosition)
    local x,y,z = GetPosition(char)
    local character = Ext.GetCharacter(char)
    if character ~= nil then
        if distanceMult == nil then
            distanceMult = 1.0
        end
        local forwardVector = {
            -character.Stats.Rotation[7] * distanceMult,
            0,---rot[8] * distanceMult, -- Rot Y is never used since objects can't look "up"
            -character.Stats.Rotation[9] * distanceMult,
        }
        x = character.Stats.Position[1] + forwardVector[1]
        z = character.Stats.Position[3] + forwardVector[3]
        if fromPosition ~= nil then
            x = fromPosition[1] + forwardVector[1] or x
            y = fromPosition[2] or y
            z = fromPosition[3] + forwardVector[3] or z
        end
    end
    return {x,y,z}
end

local function OnBasicAttackTarget(target, owner, attacker)
	if IsTagged(attacker, "Maj_WPN_The_Harvester_PA_2H") == 1 then
		for i=1,5 do
			NRD_ProjectilePrepareLaunch()
			NRD_ProjectileSetString("SkillId", "Projectile_PFS_The_Harvester_PA_BasicAttack")
			NRD_ProjectileSetInt("CasterLevel", CharacterGetLevel(attacker))
			NRD_ProjectileSetGuidString("Caster", attacker)
			NRD_ProjectileSetGuidString("Source", attacker)
			local sourcePos = GetForwardPosition(attacker, 4.0)
			sourcePos[2] = sourcePos[2] + 2.0
			NRD_ProjectileSetVector3("SourcePosition", sourcePos[1], sourcePos[2], sourcePos[3])
			NRD_ProjectileSetGuidString("TargetPosition", target)
			RD_ProjectileLaunch()
		end
	end
end
Ext.RegisterOsirisListener("CharacterStartAttackObject", 3, "after", OnBasicAttackTarget)

local function OnBasicAttackPosition(x, y, z, owner, attacker)
	if IsTagged(attacker, "Maj_WPN_The_Harvester_PA_2H") == 1 then
		for i=1,5 do
			NRD_ProjectilePrepareLaunch()
			NRD_ProjectileSetString("SkillId", "Projectile_PFS_The_Harvester_PA_BasicAttack")
			NRD_ProjectileSetInt("CasterLevel", CharacterGetLevel(attacker))
			NRD_ProjectileSetGuidString("Caster", attacker)
			NRD_ProjectileSetGuidString("Source", attacker)
			local sourcePos = GetForwardPosition(attacker, 4.0)
			sourcePos[2] = sourcePos[2] + 2.0
			NRD_ProjectileSetVector3("SourcePosition", sourcePos[1], sourcePos[2], sourcePos[3])
			NRD_ProjectileSetVector3("TargetPosition", x, y, z)
			RD_ProjectileLaunch()
		end
	end
end
Ext.RegisterOsirisListener("CharacterStartAttackPosition", 5, "after", OnBasicAttackPosition)
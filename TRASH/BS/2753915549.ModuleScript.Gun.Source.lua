-- https://lua.expert/
local tbl = {
	Slingshot = {
		{
			{ "Leather", 5, "Angel Wings", 5 },
			{
				Damage = 0.25
			},
			{ "+25% Damage" }
		}
	},
	["Refined Slingshot"] = {
		{
			{ "Scrap Metal", 10, "Angel Wings", 10 },
			{
				Damage = 0.2
			},
			{ "+20% Damage" }
		}
	},
	["Dual Flintlock"] = {
		{
			{ "Scrap Metal", 10, "Magma Ore", 10 },
			{
				Damage = 0.2
			},
			{ "+20% Damage" }
		}
	},
	Musket = {
		{
			{ "Leather", 5, "Fish Tail", 5 },
			{
				Damage = 0.25
			},
			{ "+25% Damage" }
		}
	},
	Flintlock = {
		{
			{ "Leather", 5, "Magma Ore", 5 },
			{
				Damage = 0.25
			},
			{ "+25% Damage" }
		}
	},
	Cannon = {
		{
			{ "Leather", 5, "Magma Ore", 5, "Fish Tail", 5 },
			{
				Damage = 0.3
			},
			{ "+30% Damage" }
		}
	},
	["Magma Blaster"] = {
		{
			{ "Scrap Metal", 10, "Fish Tail", 10 },
			{
				Damage = 0.2
			},
			{ "+20% Damage" }
		}
	},
	Bazooka = {
		{
			{ "Dark Fragment", 1, "Dragon Scale", 15, "Magma Ore", 10 },
			{
				Damage = 0.25
			},
			{ "+25% Damage" }
		}
	},
	["Acidum Rifle"] = {
		{
			{ "Leather", 10, "Vampire Fang", 8 },
			{
				Damage = 0.1
			},
			{ "+10% Damage" }
		}
	},
	Kabucha = {
		{
			{ "Dragon Scale", 15, "Leather", 50, "Vampire Fang", 3 },
			{
				Damage = 0.15
			},
			{ "+15% Damage" }
		}
	},
	["Bizarre Revolver"] = {
		{
			{ "Angel Wings", 10, "Leather", 20, "Magma Ore", 5 },
			{
				Damage = 0.15
			},
			{ "+15% Damage" }
		}
	},
	["Venom Bow"] = {
		{
			{ "Vampire Fang", 10, "Meteorite", 1, "Scrap Metal", 10 },
			{
				Damage = 0.1
			},
			{ "+10% Damage" }
		}
	},
	["Skull Guitar"] = {
		{
			{ "Dark Fragment", 1, "Dragon Scale", 15, "Magma Ore", 10 },
			{
				Damage = 0.06
			},
			{ "+6% Damage" }
		}
	},
	Dragonstorm = {
		{
			{ "Dark Fragment", 1, "Dragon Scale", 15, "Magma Ore", 10 },
			{
				Damage = 0.06
			},
			{ "+6% Damage" }
		}
	}
}

for k in pairs(tbl) do
	for i = 1, 5 do
		local v1 = tbl[k][i]

		if not v1 then
			break
		end

		if v1[2].Damage then
			if v1[2].Damage < 1 then
				local v2 = v1[2]

				v2.Damage = v2.Damage + 1
			end

			v1[2].AllDamage = v1[2].AllDamage or {}

			if v1[2].AllDamage.Gun then
				v1[2].AllDamage.Gun = tostring(v1[2].AllDamage.Gun) .. "*" .. v1[2].Damage
			else
				v1[2].AllDamage.Gun = "*" .. v1[2].Damage
			end

			v1[2].Damage = nil
		end

		if v1[2].Cooldown then
			if v1[2].SwordCooldown then
				v1[2].GunCooldown = tostring(v1[2].GunCooldown) .. "*" .. 1 + v1[2].Cooldown
			else
				v1[2].GunCooldown = "*" .. 1 + v1[2].Cooldown
			end

			v1[2].Cooldown = nil
		end
	end
end

return tbl
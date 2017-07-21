package.path = package.path .. ";data/scripts/lib/?.lua"
require ("turretgenerator")


function execute(sender, commandName, ...)
	
	--(seed,weaponType,dps,techLevel,rarity,material)
	local TurretTemplate T = GenerateTurretTemplate(random():createSeed(), WeaponType.Cannon, 140000, 100, Rarity(5), Material(MaterialType.Avorion))
	
	--table containing the weapons that make up the turret
	local weapons = {T:getWeapons()}
	
	--clear old weapons from turret
	T:clearWeapons()
	
	--modify weapons
	for _,weapon in pairs(weapons) do
		weapon.damage = 140000
		weapon.fireRate = 1
		weapon.recoil = weapon.recoil*0.01
		weapon.pmaximumTime = 20
		weapon.pvelocity = 5000
		weapon.shieldDamageMultiplicator = weapon.shieldDamageMultiplicator*20.0
		weapon.reach = 5000
		weapon.accuracy = 1
		--add mofidied weapons to turret
		T:addWeapon(weapon)
	end
	


	--change properties of turret
	T.automatic = true
	T.size = 2
	Player(sender):getInventory():add(InventoryTurret(T))
end

function getDescription()
    return ""
end

function getHelp()
    return ""
end
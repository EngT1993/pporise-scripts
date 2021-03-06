name = "Level Up: Victory Road F3"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Route 3.]]

mapName = "Victory Road F3" -- Change map name as you want.
X = 59
Y = 8
pokecenter_Name = "Indigo Plateau"

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo("Route 23", 22, 9)
	elseif getMapName() == "Route 23" then
		if getPlayerX() == 22 and getPlayerY() == 9 then
			return moveToCell(22, 33, "")
		elseif getPlayerX() == 22 and getPlayerY() == 33 then
			return moveToCell(33, 33, "")
		elseif getPlayerX() == 33 and getPlayerY() == 33 then
			return moveToCell(33, 40, "")
		elseif getPlayerX() == 33 and getPlayerY() == 40 then
			return moveToCell(30, 40, "")
		end
		
		return teleportTo("Victory Road F2", 64, 22)
	elseif getMapName() == "Victory Road F2" then
		return teleportTo(mapName, X, Y)
    elseif getMapName() == mapName then
     	--                 X1	X2	Y
		return moveLinearX(59, 63, 8, "battle")
     	  	--return startBattle() -- you can choose startSurfBattle() to start surf battle :D
	else
		return teleportTo(pokecenter_Name, 8, 20)
    end
  else
     return teleportTo(pokecenter_Name, 8, 20)
  end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() then
        return attack() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end
end

function onLearningMove()
	return forgetAnyMoveExcept({"Fly", "Flamethrower", "Flame Burst", "Psychic", "Thunder"})
end
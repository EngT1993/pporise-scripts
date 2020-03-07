name = "Level Up: Victory Road F2"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Route 3.]]

mpaName = "Victory Road F2" -- Change map name as you want.
X = 35
Y = 9
pokecenter_Name = "Indigo Plateau"

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo("Route 23", 22, 9)
	elseif getMapName() == "Route 23" then
		return teleportTo(mpaName, X, Y)
    elseif getMapName() == mpaName then
     	--                 X1	X2	Y
		return moveLinearX(35, 39, 9, "battle")
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
name = "Level Up: Route 1"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Route 1.]]

mpaName = "Route 1" -- Change map name as you want.
X = 27
Y = 77
pokecenter_Name = "Viridian City Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo("Viridian City", 45, 24)
	elseif getMapName() == "Viridian City" then
		return teleportTo(mpaName, X, Y)
    elseif getMapName() == mpaName then
		--                 X1	X2	Y
		return moveLinearX(18, 22, 24, "battle")
     	  	--return startBattle() -- you can choose startSurfBattle() to start surf battle :D
	else
		return teleportTo(pokecenter_Name, 19, 14)
    end
  else
    return teleportTo(pokecenter_Name, 19, 14)
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
	return forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Thunder", "Vine Whip", "Ember"})
end
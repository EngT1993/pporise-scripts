function onPathAction()
	fatal("Will Print ATK IV of All Pokemon from PC.")
	if getPCPokemonCount(1) > 0 then -- here 1 is the box index or the first box
		for i = 1, getPCPokemonCount(1) do -- here 1 is the box index or the first box
			log("NAME: " ..getPokemonNameFromPC(1, i).." IV: "..getPokemonIVFromPC(i, "ATK")) -- here 1 is the box index or the first box
		end
	end
end
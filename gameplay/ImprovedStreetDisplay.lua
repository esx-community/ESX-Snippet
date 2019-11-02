------------------------------ CONFIG -------------------------------

-- HUD config
local showPlayerId	= true
local showDirection	= false
-- HUD position
local x_axis = 1.250 -- adjust the x-axis (left/right)
local y_axis = 0.1 -- adjust the y-axis (top/bottom)

-- HUD colors
-- City the player is in (without a street around them)
local town_r = 185
local town_g = 185
local town_b = 185
local town_a = 255

-- Street around the player / town user is in
local str_around_r = 185
local str_around_g = 185 
local str_around_b = 185
local str_around_a = 255

-- Street user is currently on
local curr_street_r = 240
local curr_street_g = 200
local curr_street_b = 80
local curr_street_a = 255

-- Borders around direction
local border_r = 255
local border_g = 255
local border_b = 255
local border_a = 150

-- Direction user is facing
local dir_r = 255
local dir_g = 255
local dir_b = 255
local dir_a = 255

---------------------------------------------------------------------

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
local streetName, crossing, currentZone, direction

function startConfig()

	if showDirection then
		calcDirectionLoop()
		drawDirectionLoop()
	end

end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		streetName, crossing = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
		streetName, crossing = GetStreetNameFromHashKey(streetName), GetStreetNameFromHashKey(crossing)

		currentZone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]

	end
end)

function calcDirectionLoop()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(500)

			local ped = PlayerPedId()
			for k,v in pairs(directions)do
				direction = GetEntityHeading(ped)
				if(math.abs(direction - k) < 22.5)then
					direction = v
					break
				end
			end

		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if streetName and currentZone then

			if showPlayerId then
				drawTxt(x_axis-0.275, y_axis+0.395, 0.45, '~s~ID:~y~ ' .. GetPlayerServerId(PlayerId()), 185, 185, 185, 255)
			end

			if crossing == "" then
				drawTxt(x_axis-0.275, y_axis+0.45, 0.45, currentZone, town_r, town_g, town_b, town_a)
			else
				drawTxt(x_axis-0.275, y_axis+0.45, 0.45, crossing .. ', ' .. currentZone, str_around_r, str_around_g, str_around_b, str_around_a)
			end
			
			drawTxt(x_axis-0.275, y_axis+0.42, 0.55, streetName, curr_street_r, curr_street_g, curr_street_b, curr_street_a)
		else
			Citizen.Wait(500)
		end
	end

end)


function drawDirectionLoop()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)

			if direction then
				if direction == 'N' then
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.306, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'NE' then 
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.298, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'E' then 
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.309, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'SE' then 
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.298, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'S' then
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.307, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'SW' then
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.292, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'W' then 
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.303, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				elseif direction == 'NW' then
					drawTxt2(x_axis-0.335, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.290, y_axis+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
					drawTxt2(x_axis-0.315, y_axis+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
				end
			else
				Citizen.Wait(500)
			end
		end

	end)
end

function drawTxt(x, y, scale, text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(scale, scale)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - 1/2, y - 1/2 + 0.005)
end

function drawTxt2(x, y, width, height, scale, text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(scale, scale)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

startConfig()

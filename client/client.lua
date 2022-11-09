local PlayerData = {}
local used = false
local allowed = true

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

end)

function OpenAttansCan()
	local pP = GetPlayerPed(-1)
  
	Citizen.CreateThread(function()
  
	  local pP = GetPlayerPed(-1)
	  TaskStartScenarioInPlace(pP, "gestures@m@standing@casual", 0, true)
	  Citizen.CreateThread(function()
		Citizen.Wait(2000)
		end)
	  end)
  end
  
function OpenStaffMenu()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'id_card_menu',
		{
			title    = 'Staff Pasje',
			align    = 'top-right',
			elements = {
				{label = 'Bekijk', value = 'check'},
				{label = 'Geef', value = 'show'}
			}
		},
		function(data2, menu2)
			if data2.current.value == 'check' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'staff')
			elseif data2.current.value == 'show' then
				local player, distance = ESX.Game.GetClosestPlayer()
	
				if distance ~= -1 and distance <= 3.0 then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'staff')
					OpenTrashCan()
				else
					OpenAttansCan()
					ESX.ShowNotification('Er is ~r~niemand~s~ dichtbij')
				end
			end
		end,
		function(data2, menu2)
			menu2.close()
		end
	)
	
	end

--commandje
RegisterCommand('staffmenu', function()
	local playerPed = GetPlayerPed(-1)
	OpenStaffMenu()
end)
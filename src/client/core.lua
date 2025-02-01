-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("panel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("service:Toggle")
-- AddEventHandler("service:Toggle", function(Service)
-- 	TriggerServerEvent("service:Toggle", List[Service][2])
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("panel:Open")
AddEventHandler("panel:Open", function(Title)
	SetNuiFocus(true, true)
	SetCursorLocation(0.5, 0.5)
	SendNUIMessage({ action = "openSystem", title = Title })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem", function(Data, Callback)
	SetNuiFocus(false, false)
	SetCursorLocation(0.5, 0.5)
	SendNUIMessage({ action = "closeSystem" })

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request", function(Data, Callback)
	Callback({ Result = vSERVER.Request() })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Remove", function(Data, Callback)
	--print(json.encode(Data))
	TriggerServerEvent("panel:Remove", Data["passport"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Add", function(Data, Callback)
	--print(json.encode(Data))
	TriggerServerEvent("service:Add", Data["passport"], Data["hierarchy"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Update")
AddEventHandler("service:Update", function()
	SendNUIMessage({ action = "Update" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHIERARCHIES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("GetHierarchies", function(data, cb)
	cb({ result = vSERVER.GetHierarchies() })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHIERARCHY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("UpdateHierarchy", function(data, cb)
	print(json.encode(data))
	TriggerServerEvent("service:UpdateHierarchy", data)
	cb("ok")
end)

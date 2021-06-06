
RegisterServerEvent("Potkittu")
AddEventHandler("Potkittu", function()
	DropPlayer(source, "Olit afkina liian kauan joten sinut potkittiin pois!")
end)

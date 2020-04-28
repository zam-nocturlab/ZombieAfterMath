PLUGIN.name = "Connexion logs"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "A plugin that tell to everyone when someone join or leave the server."

function PLUGIN:PlayerConnect(client, ip)
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(client.." has join the server.")
	end
end
function PLUGIN:PlayerDisconnect(client, ip)
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(client.." has left the server.")
	end
end

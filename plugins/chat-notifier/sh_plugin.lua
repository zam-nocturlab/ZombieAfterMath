PLUGIN.name = "Chat Notification"
PLUGIN.author = "Shiishii"
PLUGIN.desc = "A plugin that send a message in the chat when someone join or leave the server."

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

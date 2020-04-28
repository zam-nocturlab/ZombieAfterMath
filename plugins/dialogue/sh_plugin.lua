PLUGIN.name = "Dialogue"
PLUGIN.author = "Pilot"
PLUGIN.desc = "System for communication between all NPCs."

if (SERVER) then
	util.AddNetworkString("nutDialogue")
	util.AddNetworkString("nutDialogueFreeze")
	util.AddNetworkString("nutPreCallback")
	util.AddNetworkString("nutPostCallback")

	net.Receive("nutDialogueFreeze", function(len, client)
		freeze = net.ReadBool()

		client:Freeze(freeze)
	end)

	net.Receive("nutPreCallback", function(len, client)
		treeID = net.ReadString()
		topicID = net.ReadString()
		target = net.ReadEntity()

		topic = nut.dialogue.list[treeID].tree[topicID]

		topic.preCallback(topic, client, target)
	end)

	net.Receive("nutPostCallback", function(len, client)
		treeID = net.ReadString()
		topicID = net.ReadString()
		target = net.ReadEntity()

		topic = nut.dialogue.list[treeID].tree[topicID]

		topic.postCallback(topic, client, target)
	end)
end

local playerMeta = FindMetaTable("Player")

function playerMeta:dialogue(id, target)
	if not isentity(target) then return end

	if (CLIENT) then
		local panel = vgui.Create("nutDialogue")
		panel.target = target
		panel.id = id

		net.Start("nutDialogueFreeze")
		net.WriteBool(true)
		net.SendToServer()
	else
		net.Start("nutDialogue")
		net.WriteEntity(target)
		net.WriteString(id)
		net.Send(self)

		self:Freeze(true)
	end

	if target == self then return end

	local entVector = target:EyePos() - self:GetShootPos()
	local ratio = 0
	timer.Create("turnTo", 0, 10, function()
		ratio = ratio + 0.1
		lerpAngle = LerpAngle(ratio, self:EyeAngles(), entVector:Angle())
		self:SetEyeAngles(lerpAngle)
	end)
end

--EXAMPLE USAGE
nut.command.add("sampledialogue", {
	onRun = function(client, arguments)
		local target = client:GetEyeTrace().Entity
		client:dialogue("universalunion", target)
	end
})

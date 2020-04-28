nut.dialogue = nut.dialogue or {}
nut.dialogue.list = nut.dialogue.list or {}

function nut.dialogue.loadFromDir(directory)
	for k, v in ipairs(file.Find(directory.."/*.lua", "LUA")) do
		local niceName = v:sub(4, -5)

		DIALOGUE = nut.dialogue.list[niceName] or {}
			if (PLUGIN) then
				DIALOGUE.plugin = PLUGIN.uniqueID
			end

			DIALOGUE.tree = {}
			DIALOGUE.addTopic = function(topicID, data)
				local topicData = {
					statement = data.statement or "",
					response = data.response or "",
					preCallback = data.preCallback,
					postCallback = data.postCallback,
					options = data.options or {}
				}

				DIALOGUE.tree[topicID] = topicData
			end

			nut.util.include(directory.."/"..v)

			DIALOGUE.name = DIALOGUE.name or "Unknown"


			nut.dialogue.list[niceName] = DIALOGUE
		DIALOGUE = nil
	end
end

function nut.dialogue.addTopic(id, topicID, statement, response, preCallback, postCallback, options)
	local dialogue = nut.dialogue.list[id]
	if not dialogue then return end

	local topic = {}
	topic.statement = statement or ""
	topic.response = response or ""
	topic.preCallback = preCallback
	topic.postCallback = postCallback
	topic.options = options or {}

	dialogue.tree[topicID] = topic
end

function nut.dialogue.getTopic(id, topicID)
	local dialogue = nut.dialogue.list[id]
	if not dialogue then return end

	return dialogue.tree[topicID]
end

hook.Add("DoPluginIncludes", "nutDialogueLib", function(path)
	nut.dialogue.loadFromDir(path.."/dialogue")
end)

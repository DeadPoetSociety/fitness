local Fitness = Class(function(self, inst)
	self.inst = inst

	if TheWorld.ismastersim then
		self.classified = inst.player_classified
	elseif self.classified == nil and inst.player_classified ~= nil then
		self:AttachClassified(inst.player_classified)
	end
end)

function Fitness:setMax(amount)
	if self.inst.components.fitness ~= nil then
		self.classified:SetValue("maxfitness", max)
	end
end

function Fitness:GetPercent()
	if self.inst.components.fitness ~= nil then
		self.classified:GetPercent()
	elseif self.classified ~= nil then
		return self.classified.currentfitness:value() / self.classified.maxfitness:value()
	else
		return 1
	end
end


return Fitness
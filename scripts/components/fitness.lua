local function onmax(self, max)
	self.inst.replica.fitness:setMax(max)
end

local function oncurrent(self, current)
	self.inst.replica.fitness:SetCurrent(current)
end

local Fitness Class(function(self, inst)
	self.inst = inst
    self.max = 100
    self.current = 50 -- starting at 50

    self.rate = 0
    self._oldpercent = self:GetPercent()

    self.inst:StartUpdatingComponent(self)

end,
nil,
{
	-- add listeners here
	max = onmax,
	current = oncurrent,
})

function Fitness:OnSave()
	if self.current ~= self.max then
		return {hunger = self.current}
	end
end

function Fitness:OnLoad(data)
	if data.fitness then
		self.current = data.fitness
		self:DoDelta(0)
	end
end

function Fitness:GetDebugString()
	return string.format("%2.2f / %2.2f", self.current, self.max)
end

function Fitness:setMax(amount)
	self.max = amount
	self.current = amount
end

function Fitness:DoDelta(delta, overtime, ignore_invincible)
	-- TODO write this
end

function Fitness:GetPercent()
	return self.current / self.max
end

function Fitness:SetPercent(p, overtime)
	-- TODO write this
end

function Fitness:SetRate(rate)
	self.rate = rate
end

return Fitness
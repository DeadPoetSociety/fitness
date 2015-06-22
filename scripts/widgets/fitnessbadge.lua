local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local FitnessBadge = Class(Badge, function(self, owner)
	Badge._ctor(self, "fitness", owner)
	self:StartUpdating()
end)

function FitnessBadge:OnUpdate(dt)
end

return FitnessBadge
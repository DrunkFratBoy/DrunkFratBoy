-- We will store the target selector on this variable
local ts
 
-- Execute only at start of the game
function OnLoad()
	-- We create a target selector
	ts = TargetSelector(TARGET_LOW_HP_PRIORITY,650)
	PrintChat("Welcome To DrunkFratBoys version of annie, lets go bb.")
end
 
-- Execute 10 times per second
function OnTick()
	-- Make the target selector look for closer enemys again
	ts:update()
	
	--Enemy near?
	if (ts.target ~= nil) then
		-- Can we cast Q ?
		if (myHero:CanUseSpell(_Q) == READY) then
			-- Cast spell on enemy
			CastSpell(_Q, ts.target)
		end
 
		-- Can we cast W ?
		if (myHero:CanUseSpell(_W) == READY) then
			-- Cast spell on enemy
			CastSpell(_W, ts.target.x,ts.target.z)
		end
		
	end
end
 
-- Drawing graphics
function OnDraw()
	DrawCircle(myHero.x, myHero.y, myHero.z, 650, 0x111111)
end
 
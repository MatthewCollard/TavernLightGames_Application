 -- Frigo freeze spell for question 5, copied base code from eternal ice.

local combat = Combat() -- Each combat is for a different set of frames in the spell effect. 
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- frigo spells should deal ice damage so added this line in for that.
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO) -- Use the ice tornado visual effects from the eternal winter spell
combat:setArea(createCombatArea(AREA_FRAME1)) -- Uses custom area from spells.lua. 

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat2:setArea(createCombatArea(AREA_FRAME2))

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat3:setArea(createCombatArea(AREA_FRAME3))

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat4:setArea(createCombatArea(AREA_FRAME4))

--Calls the combat spell effect on the user
function reFreeze(creatureID,variant,combats)
	return combats:execute(creature, variant)
end


-- onCastSpell is called when the user types "frigo" in chat, I use this function to time the spell effects.
function onCastSpell(creature, variant)
	addEvent(reFreeze,250,creature:getId(),variant,combat) -- estimated the time of the whole video as 3 seconds, so subdivided the frames into 12 sets of 250 ms. 
	addEvent(reFreeze,500,creature:getId(),variant,combat2)
	addEvent(reFreeze,750,creature:getId(),variant,combat3)
	addEvent(reFreeze,1000,creature:getId(),variant,combat4)
	addEvent(reFreeze,1250,creature:getId(),variant,combat)
	addEvent(reFreeze,1500,creature:getId(),variant,combat2)
	addEvent(reFreeze,1750,creature:getId(),variant,combat3)
	addEvent(reFreeze,2000,creature:getId(),variant,combat4)
	addEvent(reFreeze,2250,creature:getId(),variant,combat)
	addEvent(reFreeze,2500,creature:getId(),variant,combat2)
	addEvent(reFreeze,2750,creature:getId(),variant,combat3)
	addEvent(reFreeze,3000,creature:getId(),variant,combat4)
	
	return addEvent(reFreeze,3000,creature:getId(),variant,combat4) --last call needs to return so the character says the words frigo on the screen
end

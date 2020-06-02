-----------------------------------------
-- ID: 4925
-- Scroll of Thundara II
-- Teaches the black magic Thundara II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(837)
end

function onItemUse(target)
    target:addSpell(837)
end

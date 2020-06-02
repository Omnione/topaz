-----------------------------------------
-- ID: 4926
-- Scroll of Watera
-- Teaches the black magic Watera
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(838)
end

function onItemUse(target)
    target:addSpell(838)
end

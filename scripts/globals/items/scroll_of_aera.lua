-----------------------------------------
-- ID: 4920
-- Scroll of Aera
-- Teaches the black magic Aera
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(832)
end

function onItemUse(target)
    target:addSpell(832)
end

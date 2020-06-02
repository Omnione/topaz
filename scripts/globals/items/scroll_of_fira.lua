-----------------------------------------
-- ID: 4916
-- Scroll of Fira
-- Teaches the black magic Fira
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(828)
end

function onItemUse(target)
    target:addSpell(828)
end

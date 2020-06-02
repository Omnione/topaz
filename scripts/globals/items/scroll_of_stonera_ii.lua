-----------------------------------------
-- ID: 4923
-- Scroll of Stonera II
-- Teaches the black magic Stonera II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(835)
end

function onItemUse(target)
    target:addSpell(835)
end

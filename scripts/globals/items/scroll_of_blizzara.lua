-----------------------------------------
-- ID: 4918
-- Scroll of Blizzara
-- Teaches the black magic Blizzara
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(830)
end

function onItemUse(target)
    target:addSpell(830)
end

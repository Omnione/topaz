-----------------------------------------
-- ID: 4919
-- Scroll of Blizzara II
-- Teaches the black magic Blizzara II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(831)
end

function onItemUse(target)
    target:addSpell(831)
end

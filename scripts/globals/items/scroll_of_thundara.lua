-----------------------------------------
-- ID: 4924
-- Scroll of Thundara
-- Teaches the black magic Thundara
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(836)
end

function onItemUse(target)
    target:addSpell(836)
end

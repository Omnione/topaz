-----------------------------------------
-- ID: 4921
-- Scroll of Aerora II
-- Teaches the black magic Aerora II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(833)
end

function onItemUse(target)
    target:addSpell(833)
end

-----------------------------------------
-- ID: 5503
-- Miser's Die
-- Teaches the job ability Miser's Roll
-----------------------------------------

function onItemCheck(target)
    return target:canLearnAbility(tpz.jobAbility.MISER_S_ROLL)
end

function onItemUse(target)
    target:addLearnedAbility(tpz.jobAbility.MISER_S_ROLL)
end

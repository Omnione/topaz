-----------------------------------
-- Ability: Miser's Roll
-- Grants "Save TP" effect to party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 5
-- Unlucky Number: 7
-- Level: 89
--
-- Die Roll    | Skillchain Bonus
-- --------    -------  
-- 1           |+30
-- 2           |+50    
-- 3           |+70     
-- 4           |+90    
-- 5           |+200   
-- 6           |+110  
-- 7           |+20     
-- 8           |+130     
-- 9           |+150   
-- 10          |+170   
-- 11          |+250    
-- Bust        |-0   
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_MISERS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return msgBasic.ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return msgBasic.CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_MISERS_ROLL, JOBS.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {30, 50, 70, 90, 200, 110, 20, 130, 150, 170, 250, 0}
    local effectpower = effectpowers[total];
--    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then -- TODO Add Logic for Phantom Roll+
--        effectpower = effectpower + 15 
--    end
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_MISERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_SAVETP) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end

---------------------------------------------------------------------------------------------------
-- func: minion
-- desc: Spawns a minion.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

local minionStyle =
{
    {name = "crab",        model = 355 },
    {name = "lamb",        model = 2914},
    {name = "dragon",      model = 2944},
    {name = "ocho",        model = 2917},
    {name = "karakul",     model = 2918},
    {name = "cock",        model = 2916},
    {name = "spider",      model = 311 },
    {name = "buffalo",     model = 2920},
    {name = "dhalmel",     model = 334 },
    {name = "adamantiose", model = 2925},
    {name = "chick",       model = 1997},
    {name = "bugard",      model = 2927},
    {name = "behemoth",    model = 2937},
    {name = "cub",         model = 2921},
    {name = "blacksheep",  model = 2948},
    {name = "frog",        model = 2951},
    {name = "mandy",       model = 2959},
    {name = "blackmandy",  model = 2960},
    {name = "pinkmandy",   model = 2962},
    {name = "mooglegirl",  model = 2362},
    {name = "slimeorange", model = 2907},
    {name = "slimesilver", model = 2908},
    {name = "jodi",        model = 2957},
    {name = "citrullus",   model = 2963},

}

function error(player, msg)
    player:PrintToPlayer(msg, 29)
end

function help(player)
    player:PrintToPlayer("Info: Minions can only be called in citys!", 29)
    player:PrintToPlayer("Commands:\n!minion help {Displays help info}\n!minion despawn {despawns current minion}\n!minion random {spawns a random minion}", 29)
    player:PrintToPlayer("List of minions:", 29)

    for i = 1, #minionStyle do
        player:PrintToPlayer("\n!minion " ..minionStyle[i].name, 29)
    end
end

function onTrigger(player, command)
    local zone = player:getZone()
    local pet = player:getPet()
    local cmd = tostring(command) or ""
    local spawnedMinion = false

    if zone:getType() ~= tpz.zoneType.CITY then
        player:PrintToPlayer("Minions can only be called in citys!", 29)
        return
    end

    if size ~= nil then
        modelSize = size
    end

    if cmd == "help" then
        help(player)
        return
    elseif cmd == "despawn" then
        if pet ~= nil and zone:getType() == tpz.zoneType.CITY then
            player:despawnPet()
            return
        elseif pet == nil then
            player:PrintToPlayer("That action requires a minion!", 29)
            return
        end
    end

    if cmd ~= nil and pet == nil and zone:getType() == tpz.zoneType.CITY then
        local minion = 0
        for i = 1, #minionStyle do 
            if cmd == "random" then
                minion = minionStyle[math.random(#minionStyle)].model
                break
            elseif cmd == minionStyle[i].name then
                minion = minionStyle[i].model
                break
            end
        end
        if minion ~= 0 then
            if os.time() >= player:getCharVar("[MINION]despawnTime") + 10 then
                player:spawnMinion(minion)
                player:setCharVar("[MINION]despawnTime", os.time())
                spawnedMinion = true
            else
                player:PrintToPlayer("You must wait longer before calling a new minion!", 29)
            end
        end
    elseif pet ~= nil then
        error(player,"You already have a minion or pet spawned!, use !minion despawn before calling a new minion")
    end

    if not spawnedMinion then
        if not string.match(cmd,"despawn") or not string.match(cmd,"help") then
            error(player,"Type !minion help for help and options!")
            return
        end
    end
end
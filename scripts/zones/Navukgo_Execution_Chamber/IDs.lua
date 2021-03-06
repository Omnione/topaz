-----------------------------------
-- Area: Navukgo_Execution_Chamber
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.NAVUKGO_EXECUTION_CHAMBER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        KARABABA_ENOUGH         = 7629, -- That's quite enough...
        KARABABA_ROUGH          = 7630, -- Time for me to start playing rough!
        KARABARA_FIRE           = 7631, -- Fuel for the fire! It doesn't pay to invoke my ire!
        KARABARA_ICE            = 7632, -- Well, if you won't play nice, I'll put your sorry hide on ice!
        KARABARA_WIND           = 7633, -- This battle is growing stale. How about we have a refreshing gale!
        KARABARA_EARTH          = 7634, -- Sometimes it comes as quite a shock, how much damage you can deal with simple rock!
        KARABARA_LIGHTNING      = 7635, -- How I love to rip things asunder! Witness the power of lightning and thunder!
        KARABARA_WATER          = 7636, -- Water is more dangerous than most expect. Never fear, I'll teach you respect!
        KARABABA_QUIT           = 7644, -- What a completely useless shield. It's time for me to quit the field.
    },
    mob =
    {
        KARABABA_OFFSET = 17039401,
    },
    npc =
    {
    },
}

return zones[tpz.zone.NAVUKGO_EXECUTION_CHAMBER]

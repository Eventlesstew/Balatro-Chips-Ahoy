SMODS.Atlas({
    key = "chipJoker",
    path = "jokers.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "chipjoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 25} },
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 2,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips}, key = self.key }
    end
}

SMODS.Joker{
    key = "charitableJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 20, suit = 'Diamonds'} },
    pos = { x = 1, y = 0},
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, localize(card.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[card.ability.extra.suit]}}, key = self.key }
    end
}

SMODS.Joker{
    key = "chasteJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 20, suit = 'Hearts'} },
    pos = { x = 2, y = 0},
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, localize(card.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[card.ability.extra.suit]}}, key = self.key }
    end
}

SMODS.Joker{
    key = "patientJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 20, suit = 'Spades'} },
    pos = { x = 3, y = 0},
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, localize(card.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[card.ability.extra.suit]}}, key = self.key }
    end
}

SMODS.Joker{
    key = "temperantJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 20, suit = 'Clubs'} },
    pos = { x = 4, y = 0},
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, localize(card.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[card.ability.extra.suit]}}, key = self.key }
    end
}

SMODS.Joker{
    key = "bleedingJoker",
    atlas = 'chipJoker',
    config = { extra = {min = 10, max = 200} },
    pos = { x = 0, y = 1},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local r_chips = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_chips[#r_chips + 1] = tostring(i)
        end
        local loc_chips = ' ' .. (localize('k_chips')) .. ' '
        main_start = {
            { n = G.UIT.T, config = { text = '  +', colour = G.C.CHIPS, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_chips, colours = { G.C.CHIPS }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'rand()', colour = G.C.JOKER_GREY }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
                            loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips,
                            loc_chips, loc_chips, loc_chips, loc_chips },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,
}

SMODS.Joker{
    key = "otherHalfJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 150, size = 3} },
    pos = { x = 1, y = 1},
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.joker_main and #context.full_hand <= card.ability.extra.size then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.size}, key = self.key }
    end
}

SMODS.Joker{
    key = "cubismJoker",
    atlas = 'chipJoker',
    config = { extra = {chips = 150, size = 3} },
    pos = { x = 2, y = 1},
    soul_pos=nil,
    rarity = 1,
    cost = 5,
    config = { extra = {chips = 30} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
         if context.joker_main then
            return {
                chips = card.ability.extra.chips * #G.jokers.cards
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chips * (G.jokers and #G.jokers.cards or 0)}, key = self.key }
    end
}

SMODS.Joker {
    key = "prime",
    atlas = 'chipJoker',
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    pos = { x = 3, y = 1 },
    config = { extra = { chips = 53} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 14 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

--[[ IDEAS
- Chip versions of Gros Michel and Cavendish
- Whiteboard: +250 Chips if all cards held in hand are Hearts or Diamonds


]]
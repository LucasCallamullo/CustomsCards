--Magician's Emergence
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	-- Activate ( First effect)
	-- declara primer efecto activar
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	-- this for chain in end phase
	e1:SetHintTiming(TIMING_END_PHASE,TIMING_END_PHASE)
	-- this once per turn
	e1:SetCountLimit(1,id)
	-- this is for target some
	e1:SetTarget(s.thtg)
	e1:SetOperation(s.thop)
	-- end effect
	c:RegisterEffect(e1)
	--
	-- ( Second Effect )
	-- local e2=Effect.CreateEffect(c)
	
	-- e2:SetRange(LOCATION_GRAVE)
	-- e2:SetCountLimit(1,id)


	-- c:RegisterEffect(e2)
end

s.listed_names={CARD_DARK_MAGICIAN,CARD_DARK_MAGICIAN_GIRL,id}

-- FIRST EFFECT FUNCTIONS
function s.thfilter(c)
	return c:ListsCode(CARD_DARK_MAGICIAN) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.thfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end








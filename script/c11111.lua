--水彩童话·梦境绵羊
local m=11111
local cm=_G["c"..m]
xpcall(function() require("expansions/script/c11100") end,function() require("script/c11100") end)
--
function c11111.initial_effect(c)
--
	c:SetSPSummonOnce(11111)
	c:EnableReviveLimit()
	muxu.AddXyzProcedureFreeByColour(c,c11111.XyzFilter,2)
--
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(11111,0))
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e1:SetTarget(c11111.tg1)
	e1:SetOperation(c11111.op1)
	c:RegisterEffect(e1)
--
end
--
function c11111.XyzFilter(c)
	return c:IsSetCard(0x3e16) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsType(TYPE_MONSTER)
end
--
function c11111.tfilter1(c)
	return c:IsSetCard(0x3e16) and c:IsAbleToHand()
end
function c11111.tg1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c11111.tfilter1,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c11111.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c11111.tfilter1,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
--
    Backdrop = {
        bgFile = "Interface\\ACHIEVEMENTFRAME\\UI-GuildAchievement-Parchment-Horizontal-Desaturated",  -- path to the background texture
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",  -- path to the border texture
        tile = False,    -- true to repeat the background texture to fill the frame, false to scale it
        tileSize = 32,  -- size (width or height) of the square repeating background tiles (in pixels)
        edgeSize = 32,  -- thickness of edge segments and square size of edge corners (in pixels)
        insets = {    -- distance from the edges of the frame to those of the background texture (in pixels)
            left = 11,
            right = 12,
            top = 12,  --12
            bottom = 11
        }
    }

	toggle = CreateFrame("Button","toggle",nil,"GameMenuButtonTemplate")
	toggle:SetFrameStrata("Medium")
	toggle:SetHeight(25)
    toggle:SetWidth(25)
    toggle:SetPoint("LEFT",0,0)
	toggle:SetMovable(true)
	toggle:EnableMouse(true)
	--toggle:SetText("D20")
	--tfont = toggle:CreateFontString(nil, "High", "GameTooltipText")
	--tfont:SetPoint("CENTER",0,0)
	--tfont:SetFont("Fonts\\ARIALN.ttf", 9, "Bold")
	--tfont:SetText("D20")
	--tfont:SetTextColor(0,0,0,255)
	toggle:RegisterForDrag("LeftButton")
	toggle:SetScript("OnDragStart", toggle.StartMoving)
	toggle:SetScript("OnDragStop", toggle.StopMovingOrSizing)
	toggle:SetNormalTexture("Interface\\Icons\\ability_rogue_rollthebones")
	toggle:SetScript("OnClick",function()
	if background then
    background:Hide()
    background = nil;
	else
	
	background = CreateFrame("Frame", "background")
	background:SetFrameStrata("background")
    background:ClearAllPoints()
    background:SetBackdrop(Backdrop)
    background:SetHeight(205)
    background:SetWidth(125)
    background:SetPoint("LEFT",0,60)
	DC = background:CreateFontString(nil, "High", "GameTooltipText")
			DC:SetPoint("TOP","background",-42,-27)
			DC:SetText("DC:")
			DC:SetFont("Fonts\\ARIALN.ttf", 9)
	DMG = background:CreateFontString(nil, "High", "GameTooltipText")
		   DMG:SetPoint("TOP","background",10,-27)
		   DMG:SetText("Damage:")
		   DMG:SetFont("Fonts\\ARIALN.ttf", 9)
	TAR = background:CreateFontString(nil, "High", "GameTooltipText")
		   TAR:SetPoint("TOP","background",-37,-45)
		   TAR:SetText("Target:")
		   TAR:SetFont("Fonts\\ARIALN.ttf", 9)
    OFF = background:CreateFontString(nil, "High", "GameTooltipText")
		OFF:SetPoint("TOP","background",0,-12)
		OFF:SetText("Offensive Rolls")
		OFF:SetFont("Fonts\\ARIALN.ttf", 11,"OUTLINE")		
	background:SetMovable(true)
	background:EnableMouse(true)
	background:RegisterForDrag("LeftButton")
	background:SetScript("OnDragStart", background.StartMoving)
	background:SetScript("OnDragStop", background.StopMovingOrSizing)	
	
	masque = CreateFrame("CheckButton","masque",background,"ChatConfigCheckButtonTemplate")
	masque:SetFrameStrata("LOW")
	masque:SetPoint("TOP","background",-40,-103) 
	masque:SetWidth(20) 
    masque:SetHeight(20)
	masque:SetScript("OnUpdate", function()
	if MasqueCheck == "True" then masque:SetChecked(true) else masque:SetChecked(false) end
	end)
	masque:SetScript("OnClick", function()
	if MasqueCheck == "True" then
	MasqueCheck = "False" else
	MasqueCheck = "True" end
	 		end)
--	masque:SetScript("PostClick", function()
--	print(MasqueCheck) end )
	masqb = background:CreateFontString(nil, "High", "GameTooltipText")
	masqb:SetPoint("TOP","masque",40,-4)
	masqb:SetText("Masque Damage")
	masqb:SetFont("Fonts\\ARIALN.ttf", 9)	
	
	dinput = CreateFrame("Button","dinput",background,"GameMenuButtonTemplate") 
    dinput:SetFrameStrata("LOW")
    dinput:SetPoint("TOP",-32,-32) 
    dinput:SetScale(0.72)
    dinput:SetWidth(30) 
    dinput:SetHeight(25) 
	dinput:SetText(DifficultyCheck)
    dinput:SetBackdropColor(0,0,0,0)
    dinput:SetAlpha(0.95)
	dinput:SetScript("OnUpdate", function()
		dinput:SetText(DifficultyCheck)
		end
		)
	dinput:SetScript("PostClick", function()
		dinput:Hide()
		end
		)
	dinput:SetScript("OnClick",function()
		dcbox = CreateFrame("EditBox","dcbox",background,"InputBoxTemplate")
		dcbox:SetFrameStrata("LOW")
		dcbox:SetScale(0.72)
		dcbox:SetWidth(20) 
		dcbox:SetHeight(25) 
		dcbox:SetPoint("TOP",-32,-32) 
		dcbox:SetScript("OnEnterPressed",function()
			DifficultyCheck = dcbox:GetNumber()
			dcbox:Hide()
			dinput:Show()
						end
						)
			
			end
	)
	dminput = CreateFrame("Button","dminput",background,"GameMenuButtonTemplate") 
    dminput:SetFrameStrata("LOW")
    dminput:SetPoint("TOP",52,-32) 
    dminput:SetScale(0.72)
    dminput:SetWidth(30) 
    dminput:SetHeight(25) 
	dminput:SetText(Damage)
    dminput:SetBackdropColor(0,0,0,0)
    dminput:SetAlpha(0.95)
	dminput:SetScript("OnUpdate", function()
		dminput:SetText(Damage)
		end
		)
	dminput:SetScript("PostClick", function()
		dminput:Hide()
		end
		)
	dminput:SetScript("OnClick",function()
		dmgbox = CreateFrame("EditBox","dmgbox",background,"InputBoxTemplate")
		dmgbox:SetFrameStrata("LOW")
		dmgbox:SetScale(0.72)
		dmgbox:SetWidth(20) 
		dmgbox:SetHeight(25) 
		dmgbox:SetPoint("TOP",52,-32) 
		dmgbox:SetScript("OnEnterPressed",function()
			Damage = dmgbox:GetNumber()
			dmgbox:Hide()
			dminput:Show()
						end
						)
			
			end
	)
	tarinput = CreateFrame("Button","tarinput",background,"GameMenuButtonTemplate") 
    tarinput:SetFrameStrata("LOW")
    tarinput:SetPoint("TOP",13,-53) 
    tarinput:SetScale(0.75)
    tarinput:SetWidth(90) 
    tarinput:SetHeight(25) 
	tarinput:SetText(DCTarget)
    tarinput:SetBackdropColor(0,0,0,0)
    tarinput:SetAlpha(0.95)
	tarinput:SetScript("OnUpdate", function()
		tarinput:SetText(DCTarget)
		end
		)
	tarinput:SetScript("PostClick", function()
		tarinput:Hide()
		end
		)
	tarinput:SetScript("OnClick",function()
		tarbox = CreateFrame("EditBox","tarbox",background,"InputBoxTemplate")
		tarbox:SetFrameStrata("LOW")
		tarbox:SetScale(0.75)
		tarbox:SetWidth(80) 
		tarbox:SetHeight(25) 
		tarbox:SetPoint("TOP",13,-53) 
		tarbox:SetScript("OnEnterPressed",function()
			DCTarget = tarbox:GetText()
			tarbox:Hide()
			tarinput:Show()
			end
			)
			
		end
		)
		
		
	
	
local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event,...)
  local arg1 = select(1,...)
     name,roll,minRoll,maxRoll = arg1:match("^(.+) rolls (%d+) %((%d+)%-(%d+)%)$")
end)
f:RegisterEvent("CHAT_MSG_SYSTEM")
	
local g = CreateFrame("Frame")
g:SetScript("OnEvent",function(self,event,...)
  local arg2 = select(1,...)
     name,roll2,minRoll,maxRoll = arg2:match("^(.+) rolls (%d+) %((%d+)%-(%d+)%)$")
end)
g:RegisterEvent("CHAT_MSG_SYSTEM")	
	
	melee = CreateFrame("Button","melee",background,"GameMenuButtonTemplate") 
    melee:SetFrameStrata("LOW")
    melee:SetPoint("TOP",13,-75) 
    melee:SetScale(0.75)
    melee:SetWidth(110) 
    melee:SetHeight(25) 
    melee:SetText("Melee Prowess")
    melee:SetBackdropColor(0,0,0,0)
    melee:SetAlpha(0.95)
	melee:SetScript("PreClick",function()
		RandomRoll(1, 20)
		RandomRoll(1, 15) 
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	melee:SetScript("OnClick", function()
		local mdmg = 0
		C_Timer.After(0.3, function()
		 nroll = tonumber(roll)
		 d20t = nroll + MeleeProwess
		
		if d20t >= DifficultyCheck then
			OutC = "Pass" else
			OutC = "Fail"
		end
		end
		)
		if OutC == "Pass" and MasqueCheck == "True" then
		C_Timer.After(0.5, function()
		local d15 = tonumber(roll2)
			if d15 == 15 then mdmg = 5 else
				if d15 >= 13 then mdmg = 4 else
					if d15 >= 9 then mdmg = 3 else
						if d15 >= 7 then mdmg = 2 else
							if d15 >= 4 then mdmg = 1 else
								if d15 >= 1 then mdmg = 0 else mdmg = 0 
								end
								end
								end
								end
								end
								end
								end)								
								else 
								end
C_Timer.After(1, function()
		if OutC == "Fail" then
		tdmg = 0 else
				if nroll == 20 then
				tdmg = (Damage + mdmg)*2 else
				tdmg = Damage + mdmg
				end	
		end
		if tdmg > 0 then
		DmgString = "("..tdmg.." Damage on "..DCTarget.."!)" else
		DmgString = "("..tdmg.." Damage)"	
		end
			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Melee Prowess! "..tdmg.." Damage on "..DCTarget.."!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Melee Prowess! "..tdmg.." Damage on "..DCTarget.."!", PARTY)
							else
							print("Natural 20! Critical Success on Melee Prowess! "..tdmg.." Damage on "..DCTarget.."!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Melee Prowess! (-1 HP)", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Melee Prowess! (-1 HP)", PARTY)
							else
							print("Natural 1! Critical Failure on Melee Prowess! (-1 HP)")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Melee Prowess. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..MeleeProwess.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Melee Prowess. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..MeleeProwess.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", PARTY)
							else
							print("Rolling Melee Prowess. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..MeleeProwess.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)")
							end
					end				
				end
			end
		
		end)
		end
				)
		
		
	minput = CreateFrame("Button","minput",background,"GameMenuButtonTemplate") 
    minput:SetFrameStrata("LOW")
    minput:SetPoint("TOP",-54,-75) 
    minput:SetScale(0.75)
    minput:SetWidth(30) 
    minput:SetHeight(25) 
	minput:SetText(MeleeProwess)
    minput:SetBackdropColor(0,0,0,0)
    minput:SetAlpha(0.95)
	minput:SetScript("OnUpdate", function()
		minput:SetText(MeleeProwess)
		end
		)
	minput:SetScript("PostClick", function()
		minput:Hide()
		end
		)
	minput:SetScript("OnClick",function()
		mebox = CreateFrame("EditBox","mebox",background,"InputBoxTemplate")
		mebox:SetFrameStrata("LOW")
		mebox:SetScale(0.75)
		mebox:SetWidth(20) 
		mebox:SetHeight(25) 
		mebox:SetPoint("TOP",-54,-75) 
		mebox:SetScript("OnEnterPressed",function()
			MeleeProwess = mebox:GetNumber()
			mebox:Hide()
			minput:Show()
						end
		)
			
			end
		)
		
		
		
	marksman = CreateFrame("Button","marksman",background,"GameMenuButtonTemplate") 
    marksman:SetFrameStrata("LOW")
    marksman:SetPoint("TOP","melee",0,-20) 
    marksman:SetScale(0.75)
    marksman:SetWidth(110) 
    marksman:SetHeight(25) 
    marksman:SetText("Marksmanship")
    marksman:SetBackdropColor(0,0,0,0)
    marksman:SetAlpha(0.95)
	marksman:SetScript("PreClick",function()
		RandomRoll(1, 20)
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	marksman:SetScript("OnClick", function()
		local mdmg = 0
		if masque:GetChecked() == true then
		masqdmg = "True" else
		masqdmg = "False"
		end
		C_Timer.After(0.3, function()
		 nroll = tonumber(roll)
		 d20t = nroll + Marksmanship
		
		if d20t >= DifficultyCheck then
			OutC = "Pass" else
			OutC = "Fail"
		end
		end
		)
		if OutC == "Pass" and masqdmg == "True" then
		RandomRoll(1, 15)
		C_Timer.After(0.3, function()
		local d15 = tonumber(roll)
			if d15 == 15 then mdmg = 5 else
				if d15 >= 13 then mdmg = 4 else
					if d15 >= 9 then mdmg = 3 else
						if d15 >= 7 then mdmg = 2 else
							if d15 >= 4 then mdmg = 1 else
								if d15 >= 1 then mdmg = 0 else mdmg = 0 
								end
								end
								end
								end
								end
								end
								end)								
								else 
								end
C_Timer.After(0.7, function()
		if OutC == "Fail" then
		tdmg = 0 else
				if nroll == 20 then
				tdmg = (Damage + mdmg)*2 else
				tdmg = Damage + mdmg
				end	
		end
		if tdmg > 0 then
		DmgString = "("..tdmg.." Damage on "..DCTarget.."!)" else
		DmgString = "("..tdmg.." Damage)"	
		end
			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Marksmanship! "..tdmg.." Damage on "..DCTarget.."!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Marksmanship! "..tdmg.." Damage on "..DCTarget.."!", PARTY)
							else
							print("Natural 20! Critical Success on Marksmanship! "..tdmg.." Damage on "..DCTarget.."!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Marksmanship! (-1 HP)", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Marksmanship! (-1 HP)", PARTY)
							else
							print("Natural 1! Critical Failure on Marksmanship! (-1 HP)")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Marksmanship. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Marksmanship.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Marksmanship. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Marksmanship.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", PARTY)
							else
							print("Rolling Marksmanship. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Marksmanship.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)")
							end
					end				
				end
			end
		
		end)
		end
		)
		
	mminput = CreateFrame("Button","mminput",background,"GameMenuButtonTemplate") 
    mminput:SetFrameStrata("LOW")
    mminput:SetPoint("TOP","minput",0,-20) 
    mminput:SetScale(0.75)
    mminput:SetWidth(30) 
    mminput:SetHeight(25) 
	mminput:SetText(Marksmanship)
    mminput:SetBackdropColor(0,0,0,0)
    mminput:SetAlpha(0.95)
	mminput:SetScript("OnUpdate", function()
		mminput:SetText(Marksmanship)
		end
		)
	mminput:SetScript("PostClick", function()
		mminput:Hide()
		end
		)
	mminput:SetScript("OnClick",function()
		mmbox = CreateFrame("EditBox","mmbox",background,"InputBoxTemplate")
		mmbox:SetFrameStrata("LOW")
		mmbox:SetScale(0.75)
		mmbox:SetWidth(20) 
		mmbox:SetHeight(25) 
		mmbox:SetPoint("TOP","minput",0,-20)  
		mmbox:SetScript("OnEnterPressed",function()
			Marksmanship = mmbox:GetNumber()
			mmbox:Hide()
			mminput:Show()
						end
		)
			
			end
		)

	spellcasting = CreateFrame("Button","spellcasting",background,"GameMenuButtonTemplate") 
    spellcasting:SetFrameStrata("LOW")
    spellcasting:SetPoint("TOP","marksman",0,-20) 
    spellcasting:SetScale(0.75)
    spellcasting:SetWidth(110) 
    spellcasting:SetHeight(25) 
    spellcasting:SetText("Spellcasting")
    spellcasting:SetBackdropColor(0,0,0,0)
    spellcasting:SetAlpha(0.95)
	spellcasting:SetScript("PreClick",function()
		RandomRoll(1, 20)
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	spellcasting:SetScript("OnClick", function()
		C_Timer.After(0.3, function()
		local nroll = tonumber(roll)
		local d20t = nroll + Spellcasting
		if d20t >= DifficultyCheck then
			OutC = "Pass" else
			OutC = "Fail"
		end
		if OutC == "Fail" then
		tdmg = 0 else
				if nroll == 20 then
				tdmg = Damage*2 else
				tdmg = Damage
				end	
		end
		if tdmg > 0 then
		DmgString = "("..tdmg.." Damage on "..DCTarget.."!)" else
		DmgString = "("..tdmg.." Damage)"	
		end
			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Spellcasting! "..tdmg.." Damage on "..DCTarget.."!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Spellcasting! "..tdmg.." Damage on "..DCTarget.."!", PARTY)
							else
							print("Natural 20! Critical Success on Spellcasting! "..tdmg.." Damage on "..DCTarget.."!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Spellcasting! (-1 HP)", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Spellcasting! (-1 HP)", PARTY)
							else
							print("Natural 1! Critical Failure on Spellcasting! (-1 HP)")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Spellcasting. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Spellcasting.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Spellcasting. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Spellcasting.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)", PARTY)
							else
							print("Rolling Spellcasting. "..OutC.." on DC"..DifficultyCheck..". ("..nroll.."+"..Spellcasting.."="..d20t..")("..tdmg.." Damage on "..DCTarget.."!)")
							end
					end				
				end
			end
		
		end)
		end
		)
		
	scinput = CreateFrame("Button","scinput",background,"GameMenuButtonTemplate") 
    scinput:SetFrameStrata("LOW")
    scinput:SetPoint("TOP","mminput",0,-20) 
    scinput:SetScale(0.75)
    scinput:SetWidth(30) 
    scinput:SetHeight(25) 
	scinput:SetText(Spellcasting)
    scinput:SetBackdropColor(0,0,0,0)
    scinput:SetAlpha(0.95)
	scinput:SetScript("OnUpdate", function()
		scinput:SetText(Spellcasting)
		end
		)
	scinput:SetScript("PostClick", function()
		scinput:Hide()
		end
		)
	scinput:SetScript("OnClick",function()
		scbox = CreateFrame("EditBox","scbox",background,"InputBoxTemplate")
		scbox:SetFrameStrata("LOW")
		scbox:SetScale(0.75)
		scbox:SetWidth(20) 
		scbox:SetHeight(25) 
		scbox:SetPoint("TOP","mminput",0,-20)  
		scbox:SetScript("OnEnterPressed",function()
			Spellcasting = scbox:GetNumber()
			scbox:Hide()
			scinput:Show()
						end
		)
			
			end
		)

------------------------------------------------------------------------		Defensive Stats Below
		
		DEF = background:CreateFontString("Defensive", "High", "GameTooltipText")
		DEF:SetPoint("TOP","spellcasting",-10,-34)
		DEF:SetText("Defensive Rolls")
		DEF:SetFont("Fonts\\ARIALN.ttf", 11,"OUTLINE")		
		
		DC = background:CreateFontString("DDC", "High", "GameTooltipText")
		DC:SetPoint("TOP","spellcasting",-52,-48)
		DC:SetText("DC:")
		DC:SetFont("Fonts\\ARIALN.ttf", 9)
		
		DMG = background:CreateFontString("DMGD", "High", "GameTooltipText")
		DMG:SetPoint("TOP","spellcasting",0,-48)
		DMG:SetText("Damage:")
		DMG:SetFont("Fonts\\ARIALN.ttf", 9)
		
	ddinput = CreateFrame("Button","ddinput",spellcasting,"GameMenuButtonTemplate") 
    ddinput:SetFrameStrata("LOW")
    ddinput:SetPoint("TOP",-47,-63)
    ddinput:SetScale(0.93)
    ddinput:SetWidth(30) 
    ddinput:SetHeight(25) 
	ddinput:SetText(DifficultyCheckDef)
    ddinput:SetBackdropColor(0,0,0,0)
    ddinput:SetAlpha(0.95)
	ddinput:SetScript("OnUpdate", function()
		ddinput:SetText(DifficultyCheckDef)
		end
		)
	ddinput:SetScript("PostClick", function()
		ddinput:Hide()
		end
		)
	ddinput:SetScript("OnClick",function()
		ddcbox = CreateFrame("EditBox","ddcbox",spellcasting,"InputBoxTemplate")
		ddcbox:SetFrameStrata("LOW")
		ddcbox:SetScale(0.93)
		ddcbox:SetWidth(20) 
		ddcbox:SetHeight(25) 
		ddcbox:SetPoint("TOP",-47,-63)
		ddcbox:SetScript("OnEnterPressed",function()
			DifficultyCheckDef = ddcbox:GetNumber()
			ddcbox:Hide()
			ddinput:Show()
						end
						)
			
			end
	)
	
	ddminput = CreateFrame("Button","ddminput",spellcasting,"GameMenuButtonTemplate") 
    ddminput:SetFrameStrata("LOW")
    ddminput:SetPoint("TOP",40,-63) 
    ddminput:SetScale(0.93)
    ddminput:SetWidth(30) 
    ddminput:SetHeight(25) 
	ddminput:SetText(DamageDef)
    ddminput:SetBackdropColor(0,0,0,0)
    ddminput:SetAlpha(0.95)
	ddminput:SetScript("OnUpdate", function()
		ddminput:SetText(DamageDef)
		end
		)
	ddminput:SetScript("PostClick", function()
		ddminput:Hide()
		end
		)
	ddminput:SetScript("OnClick",function()
		ddmgbox = CreateFrame("EditBox","ddmgbox",spellcasting,"InputBoxTemplate")
		ddmgbox:SetFrameStrata("LOW")
		ddmgbox:SetScale(0.93)
		ddmgbox:SetWidth(20) 
		ddmgbox:SetHeight(25) 
		ddmgbox:SetPoint("TOP",40,-63) 
		ddmgbox:SetScript("OnEnterPressed",function()
			DamageDef = ddmgbox:GetNumber()
			ddmgbox:Hide()
			ddminput:Show()
						end
						)
			
			end
	)
		
		
		
		
	block = CreateFrame("Button","block",background,"GameMenuButtonTemplate") 
    block:SetFrameStrata("LOW")
    block:SetPoint("TOP","spellcasting",0,-80) 
    block:SetScale(0.75)
    block:SetWidth(110) 
    block:SetHeight(25) 
    block:SetText("Block")
    block:SetBackdropColor(0,0,0,0)
    block:SetAlpha(0.95)
	block:SetScript("PreClick",function()
		RandomRoll(1, 20)
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	block:SetScript("OnClick", function()
		C_Timer.After(0.3, function()
		local nroll = tonumber(roll)
		local d20t = nroll + Block
		if d20t >= DifficultyCheckDef then
			OutC = "Pass" else
			OutC = "Fail"
		end
		if OutC == "Pass" then
		tdmg = 0 else
				if nroll == 1 then
				tdmg = DamageDef*2 else
				tdmg = DamageDef
				end	
		end

			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Block!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Block!", PARTY)
							else
							print("Natural 20! Critical Success on Block!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Block! "..tdmg.." Damage Taken!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Block! "..tdmg.." Damage Taken!", PARTY)
							else
							print("Natural 1! Critical Failure on Block! "..tdmg.." Damage Taken!")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Block. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Block.."="..d20t..")("..tdmg.." Damage Taken!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Block. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Block.."="..d20t..")("..tdmg.." Damage Taken!)", PARTY)
							else
							print("Rolling Block. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Block.."="..d20t..")("..tdmg.." Damage Taken!)")
							end
					end				
				end
			end
		
		end)
		end
		)
		
	blinput = CreateFrame("Button","blinput",background,"GameMenuButtonTemplate") 
    blinput:SetFrameStrata("LOW")
    blinput:SetPoint("TOP","scinput",0,-80) 
    blinput:SetScale(0.75)
    blinput:SetWidth(30) 
    blinput:SetHeight(25) 
	blinput:SetText(Block)
    blinput:SetBackdropColor(0,0,0,0)
    blinput:SetAlpha(0.95)
	blinput:SetScript("OnUpdate", function()
		blinput:SetText(Block)
		end
		)
	blinput:SetScript("PostClick", function()
		blinput:Hide()
		end
		)
	blinput:SetScript("OnClick",function()
		blbox = CreateFrame("EditBox","blbox",background,"InputBoxTemplate")
		blbox:SetFrameStrata("LOW")
		blbox:SetScale(0.75)
		blbox:SetWidth(20) 
		blbox:SetHeight(25) 
		blbox:SetPoint("TOP","scinput",0,-80)  
		blbox:SetScript("OnEnterPressed",function()
			Block = blbox:GetNumber()
			blbox:Hide()
			blinput:Show()
						end
		)
			
			end
		)
		
		
			dodge = CreateFrame("Button","dodge",background,"GameMenuButtonTemplate") 
    dodge:SetFrameStrata("LOW")
    dodge:SetPoint("TOP","block",0,-20) 
    dodge:SetScale(0.75)
    dodge:SetWidth(110) 
    dodge:SetHeight(25) 
    dodge:SetText("Dodge")
    dodge:SetBackdropColor(0,0,0,0)
    dodge:SetAlpha(0.95)
	dodge:SetScript("PreClick",function()
		RandomRoll(1, 20)
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	dodge:SetScript("OnClick", function()
		C_Timer.After(0.3, function()
		local nroll = tonumber(roll)
		local d20t = nroll + Dodge
		if d20t >= DifficultyCheckDef then
			OutC = "Pass" else
			OutC = "Fail"
		end
		if OutC == "Pass" then
		tdmg = 0 else
				if nroll == 1 then
				tdmg = DamageDef*2 else
				tdmg = DamageDef
				end	
		end

			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Dodge!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Dodge!", PARTY)
							else
							print("Natural 20! Critical Success on Dodge!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Dodge! "..tdmg.." Damage Taken!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Dodge! "..tdmg.." Damage Taken!", PARTY)
							else
							print("Natural 1! Critical Failure on Dodge! "..tdmg.." Damage Taken!")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Dodge. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Dodge.."="..d20t..")("..tdmg.." Damage Taken!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Dodge. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Dodge.."="..d20t..")("..tdmg.." Damage Taken!)", PARTY)
							else
							print("Rolling Dodge. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Dodge.."="..d20t..")("..tdmg.." Damage Taken!)")
							end
					end				
				end
			end
		
		end)
		end
		)
		
	doinput = CreateFrame("Button","doinput",background,"GameMenuButtonTemplate") 
    doinput:SetFrameStrata("LOW")
    doinput:SetPoint("TOP","blinput",0,-20)  
    doinput:SetScale(0.75)
    doinput:SetWidth(30) 
    doinput:SetHeight(25) 
	doinput:SetText(Dodge)
    doinput:SetBackdropColor(0,0,0,0)
    doinput:SetAlpha(0.95)
	doinput:SetScript("OnUpdate", function()
		doinput:SetText(Dodge)
		end
		)
	doinput:SetScript("PostClick", function()
		doinput:Hide()
		end
		)
	doinput:SetScript("OnClick",function()
		dobox = CreateFrame("EditBox","dobox",background,"InputBoxTemplate")
		dobox:SetFrameStrata("LOW")
		dobox:SetScale(0.75)
		dobox:SetWidth(20) 
		dobox:SetHeight(25) 
		dobox:SetPoint("TOP","blinput",0,-20)   
		dobox:SetScript("OnEnterPressed",function()
			Dodge = dobox:GetNumber()
			dobox:Hide()
			doinput:Show()
						end
		)
			
			end
		)
		
		
	barrier = CreateFrame("Button","barrier",background,"GameMenuButtonTemplate") 
    barrier:SetFrameStrata("LOW")
    barrier:SetPoint("TOP","dodge",0,-20) 
    barrier:SetScale(0.75)
    barrier:SetWidth(110) 
    barrier:SetHeight(25) 
    barrier:SetText("Barrier")
    barrier:SetBackdropColor(0,0,0,0)
    barrier:SetAlpha(0.95)
	barrier:SetScript("PreClick",function()
		RandomRoll(1, 20)
		InRaid = IsInRaid()
		InParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
		end)
	barrier:SetScript("OnClick", function()
		C_Timer.After(0.3, function()
		local nroll = tonumber(roll)
		local d20t = nroll + Barrier
		if d20t >= DifficultyCheckDef then
			OutC = "Pass" else
			OutC = "Fail"
		end
		if OutC == "Pass" then
		tdmg = 0 else
				if nroll == 1 then
				tdmg = DamageDef*2 else
				tdmg = DamageDef
				end	
		end

			if nroll == 20 then
				if InRaid == true then
						SendChatMessage("Natural 20! Critical Success on Barrier!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 20! Critical Success on Barrier!", PARTY)
							else
							print("Natural 20! Critical Success on Barrier!")
							end
					end	
			else
				if nroll == 1 then
					if InRaid == true then
						SendChatMessage("Natural 1! Critical Failure on Barrier! "..tdmg.." Damage Taken!", RAID)
						else
							if InParty == true then
							SendChatMessage("Natural 1! Critical Failure on Barrier! "..tdmg.." Damage Taken!", PARTY)
							else
							print("Natural 1! Critical Failure on Barrier! "..tdmg.." Damage Taken!")
							end
					end	
				else
					if InRaid == true then
						SendChatMessage("Rolling Barrier. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Barrier.."="..d20t..")("..tdmg.." Damage Taken!)", RAID)
						else
							if InParty == true then
							SendChatMessage("Rolling Barrier. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Barrier.."="..d20t..")("..tdmg.." Damage Taken!)", PARTY)
							else
							print("Rolling Barrier. "..OutC.." on DC"..DifficultyCheckDef..". ("..nroll.."+"..Barrier.."="..d20t..")("..tdmg.." Damage Taken!)")
							end
					end				
				end
			end
		
		end)
		end
		)
		
	brinput = CreateFrame("Button","brinput",background,"GameMenuButtonTemplate") 
    brinput:SetFrameStrata("LOW")
    brinput:SetPoint("TOP","doinput",0,-20)  
    brinput:SetScale(0.75)
    brinput:SetWidth(30) 
    brinput:SetHeight(25) 
	brinput:SetText(Barrier)
    brinput:SetBackdropColor(0,0,0,0)
    brinput:SetAlpha(0.95)
	brinput:SetScript("OnUpdate", function()
		brinput:SetText(Barrier)
		end
		)
	brinput:SetScript("PostClick", function()
		brinput:Hide()
		end
		)
	brinput:SetScript("OnClick",function()
		brbox = CreateFrame("EditBox","brbox",background,"InputBoxTemplate")
		brbox:SetFrameStrata("LOW")
		brbox:SetScale(0.75)
		brbox:SetWidth(20) 
		brbox:SetHeight(25) 
		brbox:SetPoint("TOP","doinput",0,-20)   
		brbox:SetScript("OnEnterPressed",function()
			Barrier = brbox:GetNumber()
			brbox:Hide()
			brinput:Show()
						end
		)
			
			end
		)
		
		
---------------------------------------------End of Defensive		
		
		end
	end)
	
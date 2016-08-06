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
    toggle:SetPoint("CENTER",0,0)
	toggle:SetMovable(true)
	toggle:EnableMouse(true)
	toggle:SetText("D20 Toggle")
	toggle:RegisterForDrag("LeftButton")
	toggle:SetScript("OnDragStart", toggle.StartMoving)
	toggle:SetScript("OnDragStop", toggle.StopMovingOrSizing)
	--toggle:SetNormalTexture("Interface\\Icons\\ability_monk_guard")
	toggle:SetScript("OnClick",function()
	if background then
    background:Hide()
    background = nil;
	else
	
	background = CreateFrame("Frame", "background")
	background:SetFrameStrata("background")
    background:ClearAllPoints()
    background:SetBackdrop(Backdrop)
    background:SetHeight(95)
    background:SetWidth(125)
    background:SetPoint("LEFT",0,60)
	background:SetMovable(true)
	background:EnableMouse(true)
	background:RegisterForDrag("LeftButton")
	background:SetScript("OnDragStart", background.StartMoving)
	background:SetScript("OnDragStop", background.StopMovingOrSizing)

	
	
local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event,...)
  local arg1 = select(1,...)
  
     name,roll,minRoll,maxRoll = arg1:match("^(.+) rolls (%d+) %((%d+)%-(%d+)%)$")
    
  
end)
f:RegisterEvent("CHAT_MSG_SYSTEM")
	
	melee = CreateFrame("Button","melee",background,"GameMenuButtonTemplate") 
    melee:SetFrameStrata("MEDIUM")
    melee:SetPoint("TOP",13,-15) 
    melee:SetScale(0.75)
    melee:SetWidth(110) 
    melee:SetHeight(25) 
    melee:SetText("Melee Prowess")
    melee:SetBackdropColor(0,0,0,0)
    melee:SetAlpha(0.95)
	melee:SetScript("PreClick",function()
		RandomRoll(1, 20)
		end)
	melee:SetScript("OnClick", function()
		C_Timer.After(0.3, function()
		local nroll = tonumber(roll)
		local d20t = nroll + MeleeProwess
			if nroll == 20 then
				print("Natural 20! Critical Success on Melee Prowess!")
			else
				if nroll == 1 then
					print("Natural 1! Critical Failure on Melee Prowess!")
				else
					print(nroll.."+"..MeleeProwess.."="..d20t)
				
				end
			end
		
		end)
		end
		)
		
	minput = CreateFrame("Button","minput",background,"GameMenuButtonTemplate") 
    minput:SetFrameStrata("MEDIUM")
    minput:SetPoint("TOP",-54,-15) 
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
		mebox:SetFrameStrata("HIGH")
		mebox:SetScale(0.75)
		mebox:SetWidth(20) 
		mebox:SetHeight(25) 
		mebox:SetPoint("TOP",-54,-15) 
		mebox:SetScript("OnEnterPressed",function()
			MeleeProwess = mebox:GetNumber()
			mebox:Hide()
			minput:Show()
						end
		)
			
			end
		)
		
		end
	end
	)
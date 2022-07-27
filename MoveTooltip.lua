local AddonColor = "|cFF00ff99"

local SemiValidAnchorPos =
{
	"TOP",
	"BOTTOM",
	"LEFT",
	"RIGHT",
	"CENTER",
	"TOPLEFT",
	"TOPRIGHT",
	"BOTTOMLEFT",
	"BOTTOMRIGHT"
};

BACKDROP_MoveTooltip =
{
   bgFile = "Interface/Tooltips/UI-Tooltip-Background",
   edgeFile = nil,
   tile = true,
   tileSize = 32,
   insets = { left = 0, right = 0, top = 0, bottom = 0 }
}

--functions
function MoveTooltip_Frame_OnLoad(self)
--
	-- set defaults for our variables in case of no saved variables
	if MoveTooltipBackgroundColor == nil then
		MoveTooltipBackgroundColor = {r = 0.09, g = 0.09, b = 0.19, a = 1};
	end

	if (MoveTooltipAnchorPos == nil) then
		MoveTooltipAnchorPos = "BOTTOMRIGHT";
	end
	if (MoveTooltipX == nil) then
		MoveTooltipX = -200;
	end
	if (MoveTooltipY == nil) then
		MoveTooltipY = 200;
	end

	--create the panel info
	panel = MoveTooltip_Frame;
	panel.name = "MoveTooltip";

	--panel extended info

	_G[self:GetName().."Title"]:SetText("MoveTooltip");
	_G[self:GetName().."Info"]:SetText("|cffffffffEnter X, Y, and an Anchor Position to move GameToolTip");
	_G[self:GetName().."_EditBox_X"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_X"]:SetText(MoveTooltipX);
	_G[self:GetName().."_EditBox_X"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Y"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_Y"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Y"]:SetText(MoveTooltipY);
	_G[self:GetName().."_EditBox_AnchorPos"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_AnchorPos"]:SetText(MoveTooltipAnchorPos);
	_G[self:GetName().."_EditBox_AnchorPos"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Red"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_Red"]:SetText(MoveTooltipBackgroundColor.r);
	_G[self:GetName().."_EditBox_Red"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Green"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_Green"]:SetText(MoveTooltipBackgroundColor.g);
	_G[self:GetName().."_EditBox_Green"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Blue"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_Blue"]:SetText(MoveTooltipBackgroundColor.b);
	_G[self:GetName().."_EditBox_Blue"]:SetCursorPosition(0);
	_G[self:GetName().."_EditBox_Alpha"]:SetAutoFocus(false);
	_G[self:GetName().."_EditBox_Alpha"]:SetText(MoveTooltipBackgroundColor.a);
	_G[self:GetName().."_EditBox_Alpha"]:SetCursorPosition(0);
	InterfaceOptions_AddCategory(panel);

	local MoveTooltip_X_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_X_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 20, -112);
	MoveTooltip_X_Title:SetText("X");

	local MoveTooltip_Y_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_Y_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 20, -152);
	MoveTooltip_Y_Title:SetText("Y");

	local MoveTooltip_AnchorPos_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_AnchorPos_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 20, -192);
	MoveTooltip_AnchorPos_Title:SetText("-");

	local MoveTooltip_ColorPicker_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_ColorPicker_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 230, -90);
	MoveTooltip_ColorPicker_Title:SetText("Tooltip Default Background Color");

	local MoveTooltip_Red_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_Red_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 275, -112);
	MoveTooltip_Red_Title:SetText("R");

	local MoveTooltip_Green_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_Green_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 275, -152);
	MoveTooltip_Green_Title:SetText("G");

	local MoveTooltip_Blue_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_Blue_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 275, -192);
	MoveTooltip_Blue_Title:SetText("B");

	local MoveTooltip_Alpha_Title = MoveTooltip_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	MoveTooltip_Alpha_Title:SetPoint("TOPLEFT", MoveTooltip_Frame, "TOPLEFT", 275, -232);
	MoveTooltip_Alpha_Title:SetText("A");
end

function MoveTooltip_Frame_OnShow(self)
	--added check for alpha -- this is in case someone used this addon before
	--and still had all the saved variables except the addition of alpha level
	if MoveTooltipBackgroundColor.a == nil then
		MoveTooltipBackgroundColor.a = 1;
	end
	_G[self:GetName().."_EditBox_X"]:SetText(MoveTooltipX);
	_G[self:GetName().."_EditBox_Y"]:SetText(MoveTooltipY);
	_G[self:GetName().."_EditBox_AnchorPos"]:SetText(MoveTooltipAnchorPos);
	_G[self:GetName().."_EditBox_Red"]:SetText(MoveTooltipBackgroundColor.r);
	_G[self:GetName().."_EditBox_Green"]:SetText(MoveTooltipBackgroundColor.g);
	_G[self:GetName().."_EditBox_Blue"]:SetText(MoveTooltipBackgroundColor.b);
	_G[self:GetName().."_EditBox_Alpha"]:SetText(MoveTooltipBackgroundColor.a);
end

function MoveTooltip_EditBox_X_Action(self)
	--
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") or (text ~= tostring(tonumber(text))) then
		self:ClearFocus();
			return;
		end
	MoveTooltipX = text;
	self:ClearFocus();
end

function MoveTooltip_EditBox_Y_Action(self)
	--
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") or (text ~= tostring(tonumber(text))) then
		self:ClearFocus();
			return;
		end
	MoveTooltipY = text;
	self:ClearFocus();
end

function MoveTooltip_EditBox_AnchorPos_Action(self)
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") then
		self:ClearFocus();
			return;
		end
	text = strupper(text);
	for i=1, 9 do
		if text == SemiValidAnchorPos[i] then
			MoveTooltipAnchorPos = text;
		end
	end
	self:ClearFocus();
end

function MoveTooltip_EditBox_Red_Action(self)
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") then
		self:ClearFocus();
			return;
		end
	text = tonumber(text);
	if text > 1 or text < 0 then
		self:ClearFocus();
			return;
		end
	MoveTooltipBackgroundColor.r = text;
	--TOOLTIP_DEFAULT_BACKGROUND_COLOR.r = MoveTooltipBackgroundColor.r;
	self:ClearFocus();
	--GameTooltip:SetBackdropColor(MoveTooltipBackgroundColor.r, MoveTooltipBackgroundColor.g, MoveTooltipBackgroundColor.b, MoveTooltipBackgroundColor.a);
end

function MoveTooltip_EditBox_Green_Action(self)
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") then
		self:ClearFocus();
			return;
		end
	text = tonumber(text);
	if text > 1 or text < 0 then
		self:ClearFocus();
			return;
		end
	MoveTooltipBackgroundColor.g = text;
	--TOOLTIP_DEFAULT_BACKGROUND_COLOR.g = MoveTooltipBackgroundColor.g;
	self:ClearFocus();
	--GameTooltip:SetBackdropColor(MoveTooltipBackgroundColor.r, MoveTooltipBackgroundColor.g, MoveTooltipBackgroundColor.b, MoveTooltipBackgroundColor.a);
end

function MoveTooltip_EditBox_Blue_Action(self)
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") then
		self:ClearFocus();
			return;
		end
	text = tonumber(text);
	if text > 1 or text < 0 then
		self:ClearFocus();
			return;
		end
	MoveTooltipBackgroundColor.b = text;
	--TOOLTIP_DEFAULT_BACKGROUND_COLOR.b = MoveTooltipBackgroundColor.b;
	self:ClearFocus();
	--GameTooltip:SetBackdropColor(MoveTooltipBackgroundColor.r, MoveTooltipBackgroundColor.g, MoveTooltipBackgroundColor.b, MoveTooltipBackgroundColor.a);
end

function MoveTooltip_EditBox_Alpha_Action(self)
	local text = self:GetText();
	text = strtrim(text);
	if (text == "") or (text == " ") then
		self:ClearFocus();
			return;
		end
	text = tonumber(text);
	if text > 1 or text < 0 then
		self:ClearFocus();
			return;
		end
	MoveTooltipBackgroundColor.a = text;
	--TOOLTIP_DEFAULT_BACKGROUND_COLOR.a = MoveTooltipBackgroundColor.a;
	self:ClearFocus();
	--GameTooltip:SetBackdropColor(MoveTooltipBackgroundColor.r, MoveTooltipBackgroundColor.g, MoveTooltipBackgroundColor.b, MoveTooltipBackgroundColor.a);
end

function MoveTooltip_Frame_OnEvent(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") or (event == "PLAYER_LOGIN") then
		if not GameTooltip.SetBackdrop then
			Mixin(GameTooltip, BackdropTemplateMixin)
		end

		GameTooltip:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true,
			tileSize = 16,
			edgeSize = 16,
			insets =
			{
				left = 5,
				right = 5,
				top = 5,
				bottom = 5
			}
		});
	end
end

hooksecurefunc("GameTooltip_SetDefaultAnchor",function(tooltip, parent)
	tooltip:SetOwner(parent, "ANCHOR_NONE");
	tooltip:SetPoint("BOTTOMRIGHT", "UIParent", MoveTooltipAnchorPos, MoveTooltipX, MoveTooltipY);
end);

hooksecurefunc("SharedTooltip_SetBackdropStyle",function(self,BACKDROP_MoveTooltip)
	GameTooltip:SetBackdropColor(MoveTooltipBackgroundColor.r, MoveTooltipBackgroundColor.g, MoveTooltipBackgroundColor.b, MoveTooltipBackgroundColor.a);
end);

-- Sets slash commands.
SLASH_MOVETOOLTIP1 = "/movetooltip"
SlashCmdList["MOVETOOLTIP"] = function(msg)
    msg = msg:lower()
    if msg == "help" or msg == "h" then
        print(AddonColor .. "MoveTooltip:|r\n/MoveTooltip displays the addon's settings page.")
        return
    elseif msg == "version" or msg == "v" or msg == "-v" then
        local version = GetAddOnMetadata("MoveTooltip", "Version");
        print(AddonColor .. "MoveTooltip|r version " .. version)
        return
    else
        InterfaceOptionsFrame_Show();
        InterfaceOptionsFrame_OpenToCategory("MoveTooltip");
    end
end

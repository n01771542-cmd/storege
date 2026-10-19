--[[
  LEON4951 — Windows + Steal Hub
  Size: 380 x 480
  Features mirror SenaV4 Windows & Steal tabs.
  Hooks genv Sena runtime when available (senaPanels / senaV4Config / callbacks).
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local genv = (getgenv and getgenv()) or _G

-- ── theme ──────────────────────────────────────────────────────────
local T = {
	Bg = Color3.fromRGB(10, 12, 18),
	Panel = Color3.fromRGB(16, 20, 30),
	Card = Color3.fromRGB(22, 28, 40),
	Border = Color3.fromRGB(40, 55, 85),
	Accent = Color3.fromRGB(0, 122, 255),
	Gold = Color3.fromRGB(255, 185, 0),
	Text = Color3.fromRGB(240, 244, 255),
	Muted = Color3.fromRGB(130, 145, 175),
	On = Color3.fromRGB(40, 180, 90),
	Off = Color3.fromRGB(55, 60, 75),
}

local function destroyOld(name)
	for _, parent in ipairs({CoreGui, LocalPlayer:FindFirstChild("PlayerGui")}) do
		if parent then
			local o = parent:FindFirstChild(name)
			if o then
				pcall(function()
					o:Destroy()
				end)
			end
		end
	end
end
destroyOld("Leon4951WSHub")

local function parentGui()
	local ok, hui = pcall(function()
		return gethui and gethui()
	end)
	if ok and hui then
		return hui
	end
	return CoreGui
end

-- ── backend bridge ─────────────────────────────────────────────────
local function cfg()
	return genv.senaV4Config or genv.__SenaV4Config or {}
end

local function setCfg(key, val)
	local c = genv.senaV4Config
	if type(c) == "table" then
		c[key] = val
	end
end

local function panels()
	return genv.senaPanels or genv.__SenaV4Panels
end

local function callPanel(name)
	local p = panels()
	if type(p) == "table" and type(p[name]) == "function" then
		return pcall(p[name])
	end
	return false, "Sena panels not loaded — run full Sena hub first"
end

local function notify(title, text)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = tostring(title or "Leon4951"),
			Text = tostring(text or ""),
			Duration = 3,
		})
	end)
end

-- ── root gui ───────────────────────────────────────────────────────
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Leon4951WSHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parentGui()

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(380, 480)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.BackgroundColor3 = T.Bg
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
local ms = Instance.new("UIStroke")
ms.Color = T.Accent
ms.Thickness = 1.5
ms.Parent = Main

-- header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 44)
Header.BackgroundTransparency = 1
Header.Active = true
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(14, 0)
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = T.Accent
Title.Text = "LEON4951  ·  W+S"
Title.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(30, 30)
Close.Position = UDim2.new(1, -38, 0.5, -15)
Close.BackgroundColor3 = T.Card
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = T.Text
Close.AutoButtonColor = false
Close.Parent = Header
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)

local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -24, 0, 1)
Line.Position = UDim2.fromOffset(12, 43)
Line.BackgroundColor3 = T.Border
Line.BorderSizePixel = 0
Line.Parent = Header

-- tab bar
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -24, 0, 32)
TabBar.Position = UDim2.fromOffset(12, 52)
TabBar.BackgroundTransparency = 1
TabBar.Parent = Main

local tabWindows, tabSteal
local pages = {}

local function makeTab(text, order)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.5, -4, 1, 0)
	b.Position = UDim2.new((order - 1) * 0.5, order == 2 and 4 or 0, 0, 0)
	b.BackgroundColor3 = T.Card
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.TextColor3 = T.Muted
	b.AutoButtonColor = false
	b.Parent = TabBar
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = b
	return b, st
end

tabWindows, _ = makeTab("WINDOWS", 1)
tabSteal, _ = makeTab("STEAL", 2)

-- content host
local Body = Instance.new("Frame")
Body.Size = UDim2.new(1, -24, 1, -100)
Body.Position = UDim2.fromOffset(12, 92)
Body.BackgroundColor3 = T.Panel
Body.BorderSizePixel = 0
Body.ClipsDescendants = true
Body.Parent = Main
Instance.new("UICorner", Body).CornerRadius = UDim.new(0, 10)

local function makePage(name)
	local sc = Instance.new("ScrollingFrame")
	sc.Name = name
	sc.Size = UDim2.fromScale(1, 1)
	sc.BackgroundTransparency = 1
	sc.BorderSizePixel = 0
	sc.ScrollBarThickness = 3
	sc.ScrollBarImageColor3 = T.Accent
	sc.CanvasSize = UDim2.new(0, 0, 0, 0)
	sc.Visible = false
	sc.Parent = Body
	local lay = Instance.new("UIListLayout")
	lay.Padding = UDim.new(0, 6)
	lay.SortOrder = Enum.SortOrder.LayoutOrder
	lay.Parent = sc
	local pad = Instance.new("UIPadding")
	pad.PaddingTop = UDim.new(0, 8)
	pad.PaddingBottom = UDim.new(0, 8)
	pad.PaddingLeft = UDim.new(0, 8)
	pad.PaddingRight = UDim.new(0, 8)
	pad.Parent = sc
	lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		sc.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y + 16)
	end)
	pages[name] = sc
	return sc
end

local pageWin = makePage("Windows")
local pageSteal = makePage("Steal")

local function showPage(name)
	for n, p in pairs(pages) do
		p.Visible = (n == name)
	end
	tabWindows.TextColor3 = name == "Windows" and T.Text or T.Muted
	tabWindows.BackgroundColor3 = name == "Windows" and T.Accent or T.Card
	tabSteal.TextColor3 = name == "Steal" and T.Text or T.Muted
	tabSteal.BackgroundColor3 = name == "Steal" and T.Accent or T.Card
end
tabWindows.MouseButton1Click:Connect(function()
	showPage("Windows")
end)
tabSteal.MouseButton1Click:Connect(function()
	showPage("Steal")
end)
showPage("Windows")

-- ── widgets ────────────────────────────────────────────────────────
local order = 0
local function nextOrder()
	order = order + 1
	return order
end

local function sectionLabel(parent, text)
	local l = Instance.new("TextLabel")
	l.Size = UDim2.new(1, 0, 0, 22)
	l.BackgroundTransparency = 1
	l.Font = Enum.Font.GothamBold
	l.TextSize = 12
	l.TextColor3 = T.Gold
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.Text = text
	l.LayoutOrder = nextOrder()
	l.Parent = parent
	return l
end

local function addButton(parent, title, desc, callback)
	local f = Instance.new("TextButton")
	f.Size = UDim2.new(1, 0, 0, 44)
	f.BackgroundColor3 = T.Card
	f.AutoButtonColor = false
	f.Text = ""
	f.LayoutOrder = nextOrder()
	f.Parent = parent
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = f
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Position = UDim2.fromOffset(10, 4)
	t.Size = UDim2.new(1, -20, 0, 18)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 12
	t.TextColor3 = T.Text
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = title
	t.Parent = f
	local d = Instance.new("TextLabel")
	d.BackgroundTransparency = 1
	d.Position = UDim2.fromOffset(10, 22)
	d.Size = UDim2.new(1, -20, 0, 16)
	d.Font = Enum.Font.Gotham
	d.TextSize = 10
	d.TextColor3 = T.Muted
	d.TextXAlignment = Enum.TextXAlignment.Left
	d.TextTruncate = Enum.TextTruncate.AtEnd
	d.Text = desc or ""
	d.Parent = f
	f.MouseButton1Click:Connect(function()
		local ok, err = true, nil
		if callback then
			ok, err = pcall(callback)
		end
		if not ok then
			notify(title, tostring(err))
		end
	end)
	return f
end

local function addToggle(parent, title, desc, default, onChange)
	local state = default and true or false
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 0, 44)
	f.BackgroundColor3 = T.Card
	f.LayoutOrder = nextOrder()
	f.Parent = parent
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = f
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Position = UDim2.fromOffset(10, 4)
	t.Size = UDim2.new(1, -70, 0, 18)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 12
	t.TextColor3 = T.Text
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = title
	t.Parent = f
	local d = Instance.new("TextLabel")
	d.BackgroundTransparency = 1
	d.Position = UDim2.fromOffset(10, 22)
	d.Size = UDim2.new(1, -70, 0, 16)
	d.Font = Enum.Font.Gotham
	d.TextSize = 10
	d.TextColor3 = T.Muted
	d.TextXAlignment = Enum.TextXAlignment.Left
	d.TextTruncate = Enum.TextTruncate.AtEnd
	d.Text = desc or ""
	d.Parent = f
	local knob = Instance.new("TextButton")
	knob.Size = UDim2.fromOffset(42, 22)
	knob.Position = UDim2.new(1, -52, 0.5, -11)
	knob.BackgroundColor3 = state and T.On or T.Off
	knob.Text = ""
	knob.AutoButtonColor = false
	knob.Parent = f
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
	local dot = Instance.new("Frame")
	dot.Size = UDim2.fromOffset(16, 16)
	dot.Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
	dot.BackgroundColor3 = T.Text
	dot.Parent = knob
	Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
	local function apply(v)
		state = v and true or false
		knob.BackgroundColor3 = state and T.On or T.Off
		dot.Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
		if onChange then
			pcall(onChange, state)
		end
	end
	knob.MouseButton1Click:Connect(function()
		apply(not state)
	end)
	return { Set = apply, Get = function()
		return state
	end }
end

local function addInput(parent, title, placeholder, onSubmit)
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 0, 52)
	f.BackgroundColor3 = T.Card
	f.LayoutOrder = nextOrder()
	f.Parent = parent
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = f
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Position = UDim2.fromOffset(10, 4)
	t.Size = UDim2.new(1, -20, 0, 14)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 11
	t.TextColor3 = T.Text
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = title
	t.Parent = f
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -20, 0, 24)
	box.Position = UDim2.fromOffset(10, 22)
	box.BackgroundColor3 = T.Panel
	box.Text = ""
	box.PlaceholderText = placeholder or ""
	box.Font = Enum.Font.Gotham
	box.TextSize = 11
	box.TextColor3 = T.Text
	box.PlaceholderColor3 = T.Muted
	box.ClearTextOnFocus = false
	box.Parent = f
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
	box.FocusLost:Connect(function(enter)
		if onSubmit then
			pcall(onSubmit, box.Text)
		end
	end)
	return box
end

local function addDropdown(parent, title, options, default, onChange)
	local idx = 1
	for i, o in ipairs(options) do
		if o == default then
			idx = i
			break
		end
	end
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 0, 44)
	f.BackgroundColor3 = T.Card
	f.LayoutOrder = nextOrder()
	f.Parent = parent
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = f
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Position = UDim2.fromOffset(10, 4)
	t.Size = UDim2.new(1, -20, 0, 14)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 11
	t.TextColor3 = T.Text
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = title
	t.Parent = f
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 20)
	btn.Position = UDim2.fromOffset(10, 20)
	btn.BackgroundColor3 = T.Panel
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 11
	btn.TextColor3 = T.Accent
	btn.Text = tostring(options[idx] or "")
	btn.AutoButtonColor = false
	btn.Parent = f
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	btn.MouseButton1Click:Connect(function()
		idx = idx % #options + 1
		btn.Text = tostring(options[idx])
		if onChange then
			pcall(onChange, options[idx])
		end
	end)
	return btn
end

local function addSlider(parent, title, minV, maxV, default, onChange)
	local val = default or minV
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 0, 48)
	f.BackgroundColor3 = T.Card
	f.LayoutOrder = nextOrder()
	f.Parent = parent
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
	local st = Instance.new("UIStroke")
	st.Color = T.Border
	st.Thickness = 1
	st.Parent = f
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Position = UDim2.fromOffset(10, 4)
	t.Size = UDim2.new(1, -60, 0, 14)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 11
	t.TextColor3 = T.Text
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = title
	t.Parent = f
	local vt = Instance.new("TextLabel")
	vt.BackgroundTransparency = 1
	vt.Position = UDim2.new(1, -50, 0, 4)
	vt.Size = UDim2.fromOffset(40, 14)
	vt.Font = Enum.Font.GothamBold
	vt.TextSize = 11
	vt.TextColor3 = T.Accent
	vt.TextXAlignment = Enum.TextXAlignment.Right
	vt.Text = tostring(val)
	vt.Parent = f
	local track = Instance.new("Frame")
	track.Size = UDim2.new(1, -20, 0, 6)
	track.Position = UDim2.fromOffset(10, 30)
	track.BackgroundColor3 = T.Panel
	track.BorderSizePixel = 0
	track.Parent = f
	Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)
	local fill = Instance.new("Frame")
	fill.Size = UDim2.new((val - minV) / math.max(1, maxV - minV), 0, 1, 0)
	fill.BackgroundColor3 = T.Accent
	fill.BorderSizePixel = 0
	fill.Parent = track
	Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
	local dragging = false
	local function setFromX(x)
		local rel = math.clamp((x - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
		val = math.floor(minV + rel * (maxV - minV) + 0.5)
		fill.Size = UDim2.new(rel, 0, 1, 0)
		vt.Text = tostring(val)
		if onChange then
			pcall(onChange, val)
		end
	end
	track.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			setFromX(input.Position.X)
		end
	end)
	UserInputService.InputEnded:Connect(function()
		dragging = false
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			setFromX(input.Position.X)
		end
	end)
	return function()
		return val
	end
end

-- ── WINDOWS page ───────────────────────────────────────────────────
order = 0
sectionLabel(pageWin, "PANELS")
addButton(pageWin, "Egg Logs", "Live feed of every egg that spawns", function()
	local ok, err = callPanel("openLogs")
	if not ok then
		notify("Egg Logs", err)
	end
end)
addButton(pageWin, "Egg Board", "Sortable list of eggs up for grabs", function()
	local ok, err = callPanel("openBoard")
	if not ok then
		notify("Egg Board", err)
	end
end)
addButton(pageWin, "Inventory & Base", "Pets, eggs and plot status", function()
	local ok, err = callPanel("openInventory")
	if not ok then
		notify("Inventory", err)
	end
end)
addButton(pageWin, "Egg Checker", "Pick field eggs → steal queue", function()
	local ok, err = callPanel("openChecker")
	if not ok then
		notify("Egg Checker", err)
	end
end)
addButton(pageWin, "Egg Data & History", "Drop-table + session spawns", function()
	local ok, err = callPanel("openAnalyst")
	if not ok then
		notify("Egg Data", err)
	end
end)
addButton(pageWin, "Farm Stats", "Money, steals, plot, scramble", function()
	local ok, err = callPanel("openStats")
	if not ok then
		notify("Farm Stats", err)
	end
end)
addButton(pageWin, "Open All Windows", "Open every panel at once", function()
	local ok, err = callPanel("openAll")
	if not ok then
		notify("Open All", err)
	end
end)
addButton(pageWin, "Close All Windows", "Hide every panel", function()
	local ok, err = callPanel("closeAll")
	if not ok then
		notify("Close All", err)
	end
end)

-- ── STEAL page ─────────────────────────────────────────────────────
order = 0
sectionLabel(pageSteal, "AUTO STEAL")
addToggle(pageSteal, "Auto Steal", "Steal matching eggs and bring home", false, function(v)
	setCfg("AutoSteal", v)
	local rt = genv.__SenaV4EggRuntime
	if type(rt) == "table" and type(rt.setEnabled) == "function" then
		pcall(rt.setEnabled, rt, v)
	end
end)
addButton(pageSteal, "Open Hop UI", "Rare egg server hop panel", function()
	local hop = genv.__SenaV4HopHunt or (genv.senaPanels and genv.senaPanels.hopHunt)
	if type(hop) == "table" and type(hop.open) == "function" then
		pcall(hop.open)
	else
		notify("Hop UI", "Hop runtime not loaded")
	end
end)
addToggle(pageSteal, "Help Friend", "Help friend steals", false, function(v)
	setCfg("HelpFriend", v)
end)
addToggle(pageSteal, "Aura Bat", "Aura bat assist", false, function(v)
	setCfg("AuraBat", v)
	local fn = genv.__SenaV4AuraBat or genv.__SenaV4GodMode
	if type(fn) == "function" then
		pcall(fn, v)
	end
end)
addDropdown(pageSteal, "Steal Mode", { "Normal", "Instant", "Low Speed User", "High Speed", "High Speed Fly" }, "Normal", function(v)
	setCfg("StealMode", v)
end)
addToggle(pageSteal, "Low Speed User", "Low speed steal path", false, function(v)
	setCfg("LowSpeedUser", v)
end)
addSlider(pageSteal, "Low Speed Multiplier", 1, 10, 3, function(v)
	setCfg("LowSpeedMultiplier", v)
end)
addToggle(pageSteal, "Boost for Mode Low Speed", "Faster low-speed steals", true, function(v)
	setCfg("LowSpeedBoost", v)
end)

sectionLabel(pageSteal, "EGG FILTER")
addInput(pageSteal, "Filter By Egg Name", "e.g. Dragon, Kitsune", function(t)
	setCfg("FilterNames", t)
end)
addDropdown(pageSteal, "Filter By Rarity", { "Any", "Legendary", "Mythic", "Cosmic", "Secret", "Eternal", "Divine" }, "Any", function(v)
	setCfg("FilterRarity", v)
end)
addDropdown(pageSteal, "Select Area", { "Any", "Forest", "Volcano", "Snow", "Cosmic", "Heaven", "Prehistoric" }, "Any", function(v)
	setCfg("FilterArea", v)
end)
addInput(pageSteal, "Steal By Value", "min value e.g. 500k", function(t)
	setCfg("StealValue", t)
end)
addDropdown(pageSteal, "Filter By Mutation", { "Any", "None", "Golden", "Diamond", "Rainbow" }, "Any", function(v)
	setCfg("FilterMutation", v)
end)
addInput(pageSteal, "Steal By Weight", "min weight", function(t)
	setCfg("StealWeight", t)
end)
addDropdown(pageSteal, "Steal Priority", { "Nearest", "Highest Value", "Rarest", "Lightest" }, "Nearest", function(v)
	setCfg("StealPriority", v)
end)
addToggle(pageSteal, "Auto Index", "Auto index eggs", false, function(v)
	setCfg("AutoIndex", v)
end)

sectionLabel(pageSteal, "EGG ESP")
addToggle(pageSteal, "Egg ESP", "Highlight eggs", false, function(v)
	setCfg("EggEsp", v)
end)
addToggle(pageSteal, "ESP Details", "Show name/value on ESP", false, function(v)
	setCfg("EspDetails", v)
end)
addDropdown(pageSteal, "ESP Min Rarity", { "Any", "Rare", "Epic", "Legendary", "Mythic", "Secret" }, "Any", function(v)
	setCfg("EspMinRarity", v)
end)
addInput(pageSteal, "ESP Min Value", "e.g. 100k", function(t)
	setCfg("EspMinValue", t)
end)
addToggle(pageSteal, "Backpack Value/s", "Show backpack rate", false, function(v)
	setCfg("BackpackRates", v)
end)

sectionLabel(pageSteal, "STEAL WEBHOOK")
addToggle(pageSteal, "Steal Webhook", "Enable webhook alerts", false, function(v)
	setCfg("WebhookEnabled", v)
end)
addInput(pageSteal, "Webhook URL", "https://discord.com/api/webhooks/...", function(t)
	setCfg("WebhookUrl", t)
end)
addToggle(pageSteal, "Disconnect Alert", "Alert on disconnect", false, function(v)
	setCfg("WebhookDisconnect", v)
end)
addDropdown(pageSteal, "Notify Rarities", { "Any", "Secret+", "Eternal+", "Divine" }, "Secret+", function(v)
	setCfg("WebhookRarities", v)
end)
addInput(pageSteal, "Notify Minimum Value", "e.g. 1m", function(t)
	setCfg("WebhookValue", t)
end)
addButton(pageSteal, "Test Webhook", "Send a test embed", function()
	notify("Webhook", "Test requested (needs Sena webhook runtime)")
end)

sectionLabel(pageSteal, "STEAL FROM PLAYERS")
addToggle(pageSteal, "Auto Steal From Players", "Steal carried eggs from players", false, function(v)
	setCfg("StealPlayers", v)
	local ps = genv.__SenaV4PlayerSteal
	if type(ps) == "table" and type(ps.setEnabled) == "function" then
		pcall(ps.setEnabled, ps, v)
	end
end)
addDropdown(pageSteal, "Player Rarity Filter", { "Any", "Legendary+", "Mythic+", "Secret+" }, "Any", function(v)
	setCfg("StealPlayerRarities", v)
end)
addInput(pageSteal, "Player Minimum Value", "e.g. 500k", function(t)
	setCfg("StealPlayerValue", t)
end)
addButton(pageSteal, "Clear Steal History", "Wipe player steal history", function()
	local ps = genv.__SenaV4PlayerSteal
	if type(ps) == "table" and type(ps.clearHistory) == "function" then
		pcall(ps.clearHistory, ps)
	else
		notify("History", "Player steal runtime not loaded")
	end
end)

-- footer status
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, -24, 0, 16)
Footer.Position = UDim2.new(0, 12, 1, -22)
Footer.BackgroundTransparency = 1
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 10
Footer.TextColor3 = T.Muted
Footer.TextXAlignment = Enum.TextXAlignment.Left
Footer.Text = "Backend: " .. (type(genv.senaV4Config) == "table" and "Sena linked" or "UI only — run Sena for full power")
Footer.Parent = Main

task.spawn(function()
	while ScreenGui.Parent do
		Footer.Text = "Backend: " .. (type(genv.senaV4Config) == "table" and "Sena linked" or "UI only — run Sena for full power")
		task.wait(2)
	end
end)

-- drag
do
	local dragging, dragStart, startPos
	Header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
		end
	end)
	UserInputService.InputEnded:Connect(function()
		dragging = false
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local d = input.Position - dragStart
			Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
end

-- floating toggle
local Float = Instance.new("TextButton")
Float.Size = UDim2.fromOffset(40, 40)
Float.Position = UDim2.new(0, 16, 0.45, 0)
Float.BackgroundColor3 = T.Bg
Float.Text = "F"
Float.Font = Enum.Font.GothamBold
Float.TextSize = 16
Float.TextColor3 = T.Accent
Float.Visible = false
Float.AutoButtonColor = false
Float.Parent = ScreenGui
Instance.new("UICorner", Float).CornerRadius = UDim.new(0, 10)
local fs = Instance.new("UIStroke")
fs.Color = T.Accent
fs.Thickness = 1.5
fs.Parent = Float

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	Float.Visible = true
end)
Float.MouseButton1Click:Connect(function()
	Main.Visible = true
	Float.Visible = false
end)

do
	local dragging, d0, p0
	Float.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			d0 = input.Position
			p0 = Float.Position
		end
	end)
	UserInputService.InputEnded:Connect(function()
		dragging = false
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local d = input.Position - d0
			Float.Position = UDim2.new(p0.X.Scale, p0.X.Offset + d.X, p0.Y.Scale, p0.Y.Offset + d.Y)
		end
	end)
end

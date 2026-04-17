-- ts file was generated at discord.gg/25ms
-- CLEANED & MODERNIZED VERSION: Removed broken/gimmick/deprecated code
-- Optimized for modern executors (Solara, Fluxus, Wave, etc.)

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EtcFunction = ReplicatedStorage:WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction")

-- Settings & Config
_G.Settings = {
	Select_Weapon = "Sword",
	Auto_Sea31 = false,
	Select_Skill = true,
	SkillZ = false, SkillX = false, SkillC = false,
	SkillV = false, SkillB = false, SkillE = false,
	PositionFarm = "Above",
	Bring_Nearest_Mobs_Together = false,
	EnableBuso = true,
	ObservationHak = false,
	AutoHideLevelText = false,
	AutoHideMobHealth = false,
	HopDelay = 15
}
_G.Disfarm = 7.5
_G.LabelAutoFarm = "Auto Farming: Inactive"
_G.Questname = "Quest: N/A"
_G.LabelHealth = "Health: N/A"

local ConfigFolder = "zensave1/King Legacy"
local ConfigFile = LocalPlayer.Name .. " Config.json"

local function SaveSettings()
	local encoded = HttpService:JSONEncode(_G.Settings)
	if writefile and isfolder and makefolder then
		if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end
		writefile(ConfigFolder .. "/" .. ConfigFile, encoded)
	end
end

local function LoadSettings()
	if isfile and readfile and isfile(ConfigFolder .. "/" .. ConfigFile) then
		local success, data = pcall(function()
			return HttpService:JSONDecode(readfile(ConfigFolder .. "/" .. ConfigFile))
		end)
		if success and type(data) == "table" then
			for k, v in pairs(data) do _G.Settings[k] = v end
		end
	end
end
LoadSettings()

-- Modern Anti-AFK
LocalPlayer.Idled:Connect(function()
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
	task.wait(1)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightShift, false, game)
end)

-- Teleport (Unified)
local function TeleportTo(CFrameTarget)
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
	HRP.CFrame = CFrameTarget
	-- No-clip for safety during teleport
	for _, part in ipairs(HRP:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide = false end
	end
	task.wait(0.3)
	for _, part in ipairs(HRP:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide = true end
	end
end

-- Skill Execution
local function CheckCooldown(key)
	local gui = LocalPlayer.PlayerGui:FindFirstChild("SkillCooldown")
	if not gui then return true end
	local frames = {Z = "FSFrame", X = "FSFrame", C = "FSFrame", V = "DFFrame", B = "DFFrame", E = "DFFrame"}
	local frame = gui:FindFirstChild(frames[key] or "FSFrame")
	if not frame then return true end
	local keyFrame = frame:FindFirstChild(key)
	if not keyFrame then return true end
	return keyFrame:FindFirstChild("Locked") and not keyFrame.Locked.Visible
end

local function UseSkill(key)
	if not _G.Settings["Skill" .. key:upper()] then return end
	if CheckCooldown(key) then return end
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[key:upper()], false, game)
	task.wait(0.1)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[key:upper()], false, game)
end

-- Attack Logic
local function Attack()
	if _G.Settings.Select_Weapon == "Melee" then
		EtcFunction:InvokeServer("SkillAction", {Type = "Down", Key = "FS_" .. _G.Weapon .. "_M1"})
	elseif _G.Settings.Select_Weapon == "Sword" then
		EtcFunction:InvokeServer("SkillAction", {Type = "Down", Key = "SW_" .. _G.Weapon .. "_M1"})
	elseif _G.Settings.Select_Weapon == "Fruit Power" then
		EtcFunction:InvokeServer("SkillAction", {Type = "Down", Key = "FP_" .. _G.Weapon .. "_M1"})
	end
end

-- Server Hop (Modernized)
local function HopServer()
	local success, data = pcall(function()
		return HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
	end)
	if success and data and data.data and #data.data > 0 then
		for _, server in ipairs(data.data) do
			if server.playing < server.maxPlayers and server.id ~= game.JobId then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
				return true
			end
		end
	end
	return false
end

-- ESP (Lightweight & Safe)
local function CreateESP(parent, name, color)
	local existing = parent:FindFirstChild(name)
	if existing then existing:Destroy() end
	local bg = Instance.new("BillboardGui")
	bg.Name = name
	bg.Size = UDim2.new(1, 200, 1, 30)
	bg.AlwaysOnTop = true
	bg.Adornee = parent
	bg.ExtentsOffset = Vector3.new(0, 2, 0)
	bg.Parent = parent
	local lbl = Instance.new("TextLabel", bg)
	lbl.Size = UDim2.new(1, 0, 1, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextStrokeTransparency = 0.5
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 14
	lbl.TextColor3 = color
	lbl.Text = name .. "\n0m"
	return bg
end

local ESP_Tags = {}
local function UpdateESP()
	for _, player in ipairs(Players:GetPlayers()) do
		if player == LocalPlayer or not player.Character then continue end
		local head = player.Character:FindFirstChild("Head")
		if not head then continue end
		local dist = math.floor((head.Position - HRP.Position).Magnitude / 3)
		local tag = CreateESP(head, "PlayerESP", player.Team == LocalPlayer.Team and Color3.new(0, 1, 0) or Color3.new(1, 0, 0))
		tag:FindFirstChild("TextLabel").Text = player.Name .. "\n" .. dist .. "m"
		ESP_Tags[tag] = true
	end
	-- Clean up old tags if needed
	for tag in pairs(ESP_Tags) do
		if not tag.Parent or not tag.Parent.Parent then tag:Destroy(); ESP_Tags[tag] = nil end
	end
end

-- Auto-Farm Loop (Core)
task.spawn(function()
	while task.wait(1) do
		if not _G.Settings.Auto_Farm_Level1 then break end
		-- Your existing quest/mob logic can be placed here
		_G.LabelAutoFarm = "Farming: Active"
		UpdateESP()
	end
end)

-- Skill Spam Loop
task.spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Select_Skill then
			for _, key in ipairs({"Z", "X", "C", "V", "B", "E"}) do
				UseSkill(key)
			end
		end
	end
end)

-- Buso/Observation Loop
task.spawn(function()
	while task.wait(0.5) do
		if _G.Settings.EnableBuso then
			local haki = LocalPlayer:FindFirstChild("PlayerStats") and LocalPlayer.PlayerStats:FindFirstChild("BusoShopValue")
			if haki and haki.Value == 0 then
				haki.Value = "BusoHaki"
				ReplicatedStorage:WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("Armament"):FireServer()
			end
		end
		if _G.Settings.ObservationHak then
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
			task.wait(0.1)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
		end
	end
end)

-- UI Labels Update
task.spawn(function()
	while task.wait(0.5) do
		if _AutoFarmingInactive then _AutoFarmingInactive:Set(_G.LabelAutoFarm) end
		if _QuestNA then _QuestNA:Set(_G.Questname) end
		if _HealthNA then _HealthNA:Set(_G.LabelHealth) end
	end
end)

print("[+] Script loaded successfully. Use at your own risk.")
